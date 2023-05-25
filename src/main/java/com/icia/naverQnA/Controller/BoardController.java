package com.icia.naverQnA.Controller;

import com.icia.naverQnA.DTO.BoardDTO;
import com.icia.naverQnA.DTO.CommentDTO;
import com.icia.naverQnA.DTO.MemberDTO;
import com.icia.naverQnA.Service.BoardService;
import com.icia.naverQnA.Service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
public class BoardController {
    @Autowired
    private BoardService boardService;
    @Autowired
    private CommentService commentService;

    @GetMapping("/member/logout")
    public String memberLogout(HttpSession session) {
        session.invalidate();
        return "index";
    }

    @GetMapping("/board/save")
    public String boardSave(HttpSession session, Model model) {
        MemberDTO memberDTO = boardService.findById(session.getAttribute("memberId"));
        model.addAttribute("memberDTO", memberDTO);
        return "/boardPage/boardSave";
    }

    @PostMapping("/board/save")
    public String saveBoard(@ModelAttribute BoardDTO boardDTO, HttpSession session, Model model) throws IOException {
        MemberDTO memberDTO = boardService.findById(session.getAttribute("memberId"));
        boardDTO.setBoardWriter(memberDTO.getMemberEmail());
        boardDTO.setMemberId(memberDTO.getId());
        boardService.saveBoard(boardDTO);
        model.addAttribute("memberDTO", memberDTO);
        return "redirect:/login/index";
    }

    @GetMapping("/board/detail")
    public String boardDetail(@RequestParam(value = "bestBoardId", required = false, defaultValue = "") Long bestBoardId,
                              @RequestParam(value = "qnaBoardId", required = false, defaultValue = "") Long qnaBoardId,
                              HttpServletRequest request,
                              HttpSession session,
                              Model model) {
        HttpSession BoardHitsSession = request.getSession(true);
        BoardHitsSession.setMaxInactiveInterval(30);
        if (bestBoardId != null) {
            String bestBoardIdx = request.getParameter("bestBoardId");
            if (BoardHitsSession.getAttribute("visited_" + bestBoardIdx) == null) {
                BoardHitsSession.setAttribute("visited_" + bestBoardIdx, true);
                boardService.boardHitsUp(bestBoardId);
            }
            List<CommentDTO> bestCommentList = commentService.commentList(bestBoardId);
            if (bestCommentList.size() == 0) {
                model.addAttribute("bestCommentList",null);
            } else {
                model.addAttribute("bestCommentList",bestCommentList);
            }
            model.addAttribute("bestBoardDTO", boardService.findByBoard(bestBoardId));
        } else if (qnaBoardId != null) {
            String qnaBoardIdx = request.getParameter("qnaBoardId");
            if (BoardHitsSession.getAttribute("visited_" + qnaBoardIdx) == null) {
                BoardHitsSession.setAttribute("visited_" + qnaBoardIdx, true);
                boardService.boardHitsUp(qnaBoardId);
            }
            List<CommentDTO> qnaCommentList = commentService.commentList(qnaBoardId);
            if (qnaCommentList.size() == 0) {
                model.addAttribute("qnaCommentList",null);
            } else {
                model.addAttribute("qnaCommentList",qnaCommentList);
            }
            model.addAttribute("qnaBoardDTO", boardService.findByBoard(qnaBoardId));
        }
        model.addAttribute("memberDTO",boardService.findById(session.getAttribute("memberId")));
        return "/boardPage/boardDetail";
    }
}
