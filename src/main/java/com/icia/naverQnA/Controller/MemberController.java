package com.icia.naverQnA.Controller;

import com.icia.naverQnA.DTO.BoardDTO;
import com.icia.naverQnA.DTO.MemberDTO;
import com.icia.naverQnA.DTO.PageDTO;
import com.icia.naverQnA.Service.BoardService;
import com.icia.naverQnA.Service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
public class MemberController {
    @Autowired
    private MemberService memberService;
    @Autowired
    private BoardService boardService;
    @GetMapping("/member/login")
    public String memberLogin() {
        return "/memberPage/memberLogin";
    }

    @PostMapping("/member/login")
    public String loginMember(@ModelAttribute MemberDTO memberDTO ,
                              HttpSession session , Model model) {

        MemberDTO memberDB = memberService.loginMember(memberDTO);
        String loginFalse = "아이디 또는 비밀번호를 잘못 입력했습니다."+"<br>"+"입력하신 내용을 다시 확인해주세요.";
        String bestBoardCount = "6";
        if(memberDB != null) {
            session.setAttribute("memberId",memberDB.getId());
            model.addAttribute("memberDTO",memberDB);
            return "redirect:/";
        } else {
            model.addAttribute("loginFalse",loginFalse);
            return "/memberPage/memberLogin";
        }

    }

    @GetMapping("/member/save")
    public String memberSave() {
        return "/memberPage/memberSave";
    }

    @PostMapping("/member/save")
    public String saveMember(@ModelAttribute MemberDTO memberDTO) {
        memberDTO.setMemberBirthday(memberDTO.getMemberBiryy() +"-"+ memberDTO.getMemberBirmm() +"-"+ memberDTO.getMemberBirdd());
        memberDTO.setMemberDomain(memberDTO.getMemberEmail()+"@naver.com");
        memberService.saveMember(memberDTO);
        return "/memberPage/memberLogin";
    }
    @PostMapping("/member/emailcheck")
    public ResponseEntity emailcheck(@RequestParam("memberEmail") String memberEmail){
        String dbEmail = memberService.emailcheck(memberEmail);
        if(dbEmail != null) {
            return new ResponseEntity(HttpStatus.CONFLICT);
        } else {
            return new ResponseEntity(HttpStatus.OK);
        }
    }
}
