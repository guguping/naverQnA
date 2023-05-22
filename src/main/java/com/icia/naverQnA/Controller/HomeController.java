package com.icia.naverQnA.Controller;

import com.icia.naverQnA.DTO.BoardDTO;
import com.icia.naverQnA.DTO.MemberDTO;
import com.icia.naverQnA.DTO.PageDTO;
import com.icia.naverQnA.Service.BoardService;
import com.icia.naverQnA.Service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class HomeController {
    @Autowired
    private BoardService boardService;
    @Autowired
    private MemberService memberService;

    @GetMapping("/")
    public String Index(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
                        Model model) {
        List<BoardDTO> boardDTOList = null;
        PageDTO pageDTO = null;
        boardDTOList =boardService.bestBoardList(page);
        pageDTO =boardService.bestPagingParam(page);
        model.addAttribute("bestBoardDTOList",boardDTOList);
        model.addAttribute("bestPaging",pageDTO);
        return "index";
    }

    @GetMapping("/login/index")
    public String loginIndex(HttpSession session, Model model) {
        MemberDTO memberDTO = boardService.findById(session.getAttribute("memberId"));
        model.addAttribute("memberDTO", memberDTO);
        return "index";
    }
}
