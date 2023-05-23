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
    public String Index(@RequestParam(value = "bestPage", required = false, defaultValue = "1") int bestPage,
                        Model model, HttpSession session) {
        MemberDTO memberDTO = boardService.findById(session.getAttribute("memberId"));
        PageDTO bestPageDTO = new PageDTO();
        bestPageDTO.setPage(bestPage);
        List<BoardDTO> bestBoardDTOList = null;
        PageDTO bestPaging = null;
        String bestBoardCount = "6";
        bestBoardDTOList =boardService.bestBoardList(bestPageDTO);
        bestPaging =boardService.bestPagingParam(bestPageDTO);
        model.addAttribute("bestBoardDTOList",bestBoardDTOList);
        model.addAttribute("bestPaging",bestPaging);
        model.addAttribute("bestBoardCount",bestBoardCount);
        model.addAttribute("memberDTO",memberDTO);
        return "index";
    }

    @GetMapping("/login/index")
    public String loginIndex(@RequestParam(value = "bestPage", required = false, defaultValue = "1") int bestPage,
                             @RequestParam(value = "qnaPage", required = false,defaultValue = "1")int qnaPage,
                             HttpSession session, Model model) {
        MemberDTO memberDTO = boardService.findById(session.getAttribute("memberId"));
        PageDTO bestPageDTO = new PageDTO();
        bestPageDTO.setPage(bestPage);
        // best게시물 페이징
        List<BoardDTO> bestBoardDTOList = null;
        PageDTO bestPaging = null;
        bestBoardDTOList =boardService.bestBoardList(bestPageDTO);
        bestPaging =boardService.bestPagingParam(bestPageDTO);
        System.out.println("bestPaging = " + bestPaging);
        
        // qna게시물 페이징
//        List<BoardDTO> qnaBoardDTOList = null;
//        PageDTO qnaPaging = null;
//        qnaBoardDTOList =boardService.qnaBoardList(qnaPage);
//        qnaPaging =boardService.qnaPagingParam(qnaPage);
        String bestBoardCount = "6";
        model.addAttribute("bestBoardDTOList",bestBoardDTOList);
        model.addAttribute("bestPaging",bestPaging);
        model.addAttribute("bestBoardCount",bestBoardCount);
        model.addAttribute("memberDTO", memberDTO);
        return "index";
    }
}
