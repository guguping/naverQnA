package com.icia.naverQnA.Controller;

import com.icia.naverQnA.DTO.BoardDTO;
import com.icia.naverQnA.DTO.MemberDTO;
import com.icia.naverQnA.DTO.PageDTO;
import com.icia.naverQnA.Service.BoardService;
import com.icia.naverQnA.Service.MemberService;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
public class HomeController {
    @Autowired
    private BoardService boardService;
    @Autowired
    private MemberService memberService;

    @GetMapping("/")
    public String Index(@RequestParam(value = "bestPage", required = false, defaultValue = "1") int bestPage,
                        @RequestParam(value = "qnaPage", required = false,defaultValue = "1")int qnaPage,
                        @RequestParam(value = "q",required = false,defaultValue = "") String q,
                        Model model, HttpSession session) {
        MemberDTO memberDTO = boardService.findById(session.getAttribute("memberId"));
        PageDTO bestPageDTO = new PageDTO();
        bestPageDTO.setPage(bestPage);

        // qna게시물 페이징
        PageDTO qnaPageDTO = new PageDTO();
        qnaPageDTO.setPage(qnaPage);

        Date Time = new Date();
        int hours = Time.getHours();
        String formattedHours = (hours < 10) ? "0" + hours : String.valueOf(hours);
        String bestBoardTime = Time.getDate() + "일 " + formattedHours+"시 기준";

        String bestBoardCount = "6";
        model.addAttribute("bestBoardDTOList",boardService.bestBoardList(bestPageDTO));
        model.addAttribute("bestPaging",boardService.bestPagingParam(bestPageDTO,q));
        model.addAttribute("qnaBoardDTOList",boardService.qnaBoardList(qnaPageDTO,q));
        model.addAttribute("qnaPaging",boardService.qnaPagingParam(qnaPageDTO,q));
        model.addAttribute("bestBoardCount",bestBoardCount);
        model.addAttribute("bestBoardTime",bestBoardTime);
        model.addAttribute("memberDTO",memberDTO);
        return "index";
    }

    @GetMapping("/login/index")
    public String loginIndex(@RequestParam(value = "bestPage", required = false, defaultValue = "1") int bestPage,
                             @RequestParam(value = "qnaPage", required = false,defaultValue = "1")int qnaPage,
                             @RequestParam(value = "q",required = false,defaultValue = "") String q,
                             HttpSession session, Model model) {
        PageDTO bestPageDTO = new PageDTO();
        bestPageDTO.setPage(bestPage);

        // qna게시물 페이징
        PageDTO qnaPageDTO = new PageDTO();
        qnaPageDTO.setPage(qnaPage);

        Date Time = new Date();
        int hours = Time.getHours();
        String formattedHours = (hours < 10) ? "0" + hours : String.valueOf(hours);
        String bestBoardTime = Time.getDate() + "일 " + formattedHours+"시 기준";
        model.addAttribute("bestBoardTime",bestBoardTime);

        String bestBoardCount = "6";
        model.addAttribute("bestBoardDTOList",boardService.bestBoardList(bestPageDTO));
        model.addAttribute("bestPaging",boardService.bestPagingParam(bestPageDTO,q));
        model.addAttribute("bestBoardCount",bestBoardCount);
        model.addAttribute("qnaBoardDTOList",boardService.qnaBoardList(qnaPageDTO,q));
        model.addAttribute("qnaPaging",boardService.qnaPagingParam(qnaPageDTO,q));
        model.addAttribute("memberDTO", boardService.findById(session.getAttribute("memberId")));
        return "index";
    }
}
