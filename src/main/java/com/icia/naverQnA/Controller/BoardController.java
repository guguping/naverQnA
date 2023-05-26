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
        return "redirect:/";
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
    public String boardDetail(@RequestParam(value = "BoardId", required = false, defaultValue = "") Long BoardId,
                              HttpServletRequest request,
                              HttpSession session,
                              Model model) {
        HttpSession BoardHitsSession = request.getSession(true);
        BoardHitsSession.setMaxInactiveInterval(300);

        String BoardIdx = request.getParameter("BoardId");
        if (BoardHitsSession.getAttribute("visited_" + BoardIdx) == null) {
            BoardHitsSession.setAttribute("visited_" + BoardIdx, true);
            boardService.boardHitsUp(BoardId);
        }
        List<CommentDTO> CommentList = commentService.commentList(BoardId);
        if (CommentList.size() == 0) {
            model.addAttribute("CommentList", null);
        } else {
            model.addAttribute("CommentList", CommentList);
        }
        model.addAttribute("CommentCount", boardService.commentCount(BoardId));
        model.addAttribute("BoardDTO", boardService.findByBoard(BoardId));
        model.addAttribute("memberDTO", boardService.findById(session.getAttribute("memberId")));
        return "/boardPage/boardDetail";
    }
}
