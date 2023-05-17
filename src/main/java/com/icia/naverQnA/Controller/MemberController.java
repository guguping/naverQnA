package com.icia.naverQnA.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {
    @GetMapping("/memberLogin")
    public String memberLogin(){
        return "/memberPage/memberLogin";
    }
}
