package com.icia.naverQnA.Controller;

import com.icia.naverQnA.DTO.BoardDTO;
import com.icia.naverQnA.DTO.CommentDTO;
import com.icia.naverQnA.DTO.MemberDTO;
import com.icia.naverQnA.DTO.PageDTO;
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
                              @RequestParam(value = "DetailPage", required = false, defaultValue = "1") int DetailPage,
                              @RequestParam(value = "q",required = false,defaultValue = "") String q,
                              HttpServletResponse response,
                              HttpServletRequest request,
                              HttpSession session,
                              Model model) {

        Cookie oldCookie = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("BoardHits")) {
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
            Cookie newCookie = new Cookie("BoardHits","[" + BoardId + "]");
            newCookie.setPath("/");
            newCookie.setMaxAge(3600);
            response.addCookie(newCookie);
        }

        PageDTO DetailPageDTO = new PageDTO();
        DetailPageDTO.setBoardId(BoardId);
        DetailPageDTO.setPage(DetailPage);
        model.addAttribute("CommentList", commentService.commentList(DetailPageDTO));
        model.addAttribute("CommentPaging",commentService.commentPagingParam(DetailPageDTO,q));
        model.addAttribute("CommentCount", commentService.commentCount(BoardId));
        model.addAttribute("BoardDTO", boardService.findByBoard(BoardId));
        model.addAttribute("memberDTO", boardService.findById(session.getAttribute("memberId")));
        return "/boardPage/boardDetail";
    }
}
