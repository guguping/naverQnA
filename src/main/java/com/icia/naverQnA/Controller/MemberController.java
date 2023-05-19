package com.icia.naverQnA.Controller;

import com.icia.naverQnA.DTO.MemberDTO;
import com.icia.naverQnA.Service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;

@Controller
public class MemberController {
    @Autowired
    private MemberService memberService;
    @GetMapping("/member/login")
    public String memberLogin() {
        return "/memberPage/memberLogin";
    }

    @PostMapping("/member/login")
    public String loginMember() {
        return "index";
    }

    @GetMapping("/member/save")
    public String memberSave() {
        return "/memberPage/memberSave";
    }

    @PostMapping("/member/save")
    public String saveMember(@ModelAttribute MemberDTO memberDTO) {
        memberDTO.setMemberBirthday(memberDTO.getMemberBiryy() +"-"+ memberDTO.getMemberBirmm() +"-"+ memberDTO.getMemberBirdd());
        memberDTO.setMemberDomain(memberDTO.getMemberEmail()+"@naver.com");
        System.out.println("memberDTO = " + memberDTO);
        memberService.saveMember(memberDTO);
        return "/memberPage/memberLogin";
    }
}
