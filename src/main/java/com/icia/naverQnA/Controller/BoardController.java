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

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
                              HttpServletResponse response,
                              HttpServletRequest request,
                              HttpSession session,
                              Model model) {

//        boardService.boardHitsUp(BoardId);
        Cookie oldCookie = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("postView")) {
                    oldCookie = cookie;
                }
            }
        }

        if (oldCookie != null) {
            if (!oldCookie.getValue().contains("[" + BoardId.toString() + "]")) {
                boardService.boardHitsUp(BoardId);
                oldCookie.setValue(oldCookie.getValue() + "_[" + BoardId + "]");
                oldCookie.setPath("/");
                oldCookie.setMaxAge(3600);
                response.addCookie(oldCookie);
            }
        } else {
            boardService.boardHitsUp(BoardId);
            Cookie newCookie = new Cookie("postView","[" + BoardId + "]");
            newCookie.setPath("/");
            newCookie.setMaxAge(3600);
            response.addCookie(newCookie);
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

    //        HttpSession BoardHitsSession = request.getSession(true);
//        BoardHitsSession.setMaxInactiveInterval(10);
//
//        String BoardIdx = request.getParameter("BoardId");
//        if (BoardHitsSession.getAttribute("visited_" + BoardIdx) == null) {
//            BoardHitsSession.setAttribute("visited_" + BoardIdx, true);
//            boardService.boardHitsUp(BoardId);
//        }
}
