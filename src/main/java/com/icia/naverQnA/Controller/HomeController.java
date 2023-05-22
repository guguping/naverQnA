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
        String bestBoardCount = "6";
        boardDTOList =boardService.bestBoardList(page);
        pageDTO =boardService.bestPagingParam(page);
        model.addAttribute("bestBoardDTOList",boardDTOList);
        model.addAttribute("bestPaging",pageDTO);
        model.addAttribute("bestBoardCount",bestBoardCount);
        return "index";
    }

    @GetMapping("/login/index")
    public String loginIndex(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
                             HttpSession session, Model model) {
        MemberDTO memberDTO = boardService.findById(session.getAttribute("memberId"));
        List<BoardDTO> boardDTOList = null;
        PageDTO pageDTO = null;
        String bestBoardCount = "6";
        boardDTOList =boardService.bestBoardList(page);
        pageDTO =boardService.bestPagingParam(page);
        model.addAttribute("bestBoardDTOList",boardDTOList);
        model.addAttribute("bestPaging",pageDTO);
        model.addAttribute("bestBoardCount",bestBoardCount);
        model.addAttribute("memberDTO", memberDTO);
        return "index";
    }
}
