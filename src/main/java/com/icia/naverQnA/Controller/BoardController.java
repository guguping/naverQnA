package com.icia.naverQnA.Controller;

import com.icia.naverQnA.DTO.BoardDTO;
import com.icia.naverQnA.DTO.MemberDTO;
import com.icia.naverQnA.Service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class BoardController {
    @Autowired
    private BoardService boardService;
    @GetMapping("/member/logout")
    public String memberLogout(HttpSession session) {
        session.invalidate();
        return "index";
    }

    @GetMapping("/board/save")
    public String boardSave(HttpSession session, Model model) {
        MemberDTO memberDTO = boardService.findById(session.getAttribute("memberId"));
        model.addAttribute("memberDTO",memberDTO);
        return "/boardPage/boardSave";
    }
    @PostMapping("/board/save")
    public String saveBoard(@ModelAttribute BoardDTO boardDTO, HttpSession session , Model model) throws IOException {
        MemberDTO memberDTO = boardService.findById(session.getAttribute("memberId"));
        boardDTO.setBoardWriter(memberDTO.getMemberEmail());
        boardDTO.setMemberId(memberDTO.getId());
        boardService.saveBoard(boardDTO);
        model.addAttribute("memberDTO",memberDTO);
        return "redirect:/login/index";
    }
    @GetMapping("/board/detail")
    public String boardDetail() {
        return "/boardPage/boardDetail";
    }
}
