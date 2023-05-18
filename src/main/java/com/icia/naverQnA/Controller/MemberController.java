package com.icia.naverQnA.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MemberController {
    @GetMapping("/memberLogin")
    public String memberLogin(){
        return "/memberPage/memberLogin";
    }
    @GetMapping("/memberSave")
    public String memberSave(){
        return "/memberPage/memberSave";
    }
    @PostMapping("/memberSave")
    public String saveMember(){
        return "index";
    }
}
