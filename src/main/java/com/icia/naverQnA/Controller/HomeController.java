package com.icia.naverQnA.Controller;

import com.icia.naverQnA.DTO.MemberDTO;
import com.icia.naverQnA.Service.BoardService;
import com.icia.naverQnA.Service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
public class HomeController {
    @Autowired
    private BoardService boardService;
    @Autowired
    private MemberService memberService;
    @GetMapping("/")
    public String Index(){
        return "index";
    }
    @GetMapping("/login/index")
    public  String loginIndex(HttpSession session , Model model) {
        MemberDTO memberDTO = boardService.findById(session.getAttribute("memberId"));
        model.addAttribute("memberDTO",memberDTO);
        return "index";
    }
}
