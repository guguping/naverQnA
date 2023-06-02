package com.icia.naverQnA.Controller;

import com.icia.naverQnA.DTO.*;
import com.icia.naverQnA.Service.BoardService;
import com.icia.naverQnA.Service.CommentService;
import com.icia.naverQnA.Service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BoardController {
    @Autowired
    private BoardService boardService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private MemberService memberService;

    @GetMapping("/member/logout")
    public String memberLogout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/board/save")
    public String boardSave(HttpSession session, Model model) {
        MemberDTO memberDTO = boardService.findById(session.getAttribute("memberId"));
        model.addAttribute("memberDTO", memberDTO);
        return "/boardPage/boardSave";
    }

    @PostMapping("/board/save")
    public String saveBoard(@ModelAttribute BoardDTO boardDTO, HttpSession session, Model model) throws IOException {
        MemberDTO memberDTO = boardService.findById(session.getAttribute("memberId"));
        if(boardDTO.getBoardPoint() != 0){
            memberDTO.setMemberPoint(memberDTO.getMemberPoint()-boardDTO.getBoardPoint());
            memberService.memberPointUpdate(memberDTO); // 여기부터
        }
        boardDTO.setBoardWriter(memberDTO.getMemberEmail());
        boardDTO.setMemberId(memberDTO.getId());
        boardService.saveBoard(boardDTO);
        model.addAttribute("memberDTO", memberDTO);
        return "redirect:/";
    }

    @GetMapping("/board/detail")
    public String boardDetail(@RequestParam(value = "BoardId", required = false, defaultValue = "") Long BoardId,
                              @RequestParam(value = "bestPage", required = false, defaultValue = "1") int bestPage,
                              @RequestParam(value = "DetailPage", required = false, defaultValue = "1") int DetailPage,
                              @RequestParam(value = "q",required = false,defaultValue = "") String q,
                              HttpServletResponse response,
                              HttpServletRequest request,
                              HttpSession session,
                              Model model) {

        Cookie oldCookie = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("BoardHits")) {
                    oldCookie = cookie;
                }
            }
        }

        if (oldCookie != null) {
            if (!oldCookie.getValue().contains("[" + BoardId.toString() + "]")) {
                boardService.boardHitsUp(BoardId);
                oldCookie.setValue(oldCookie.getValue() + "_[" + BoardId + "]");
                oldCookie.setPath("/");
                oldCookie.setMaxAge(3600);
                response.addCookie(oldCookie);
            }
        } else {
            boardService.boardHitsUp(BoardId);
            Cookie newCookie = new Cookie("BoardHits","[" + BoardId + "]");
            newCookie.setPath("/");
            newCookie.setMaxAge(3600);
            response.addCookie(newCookie);
        }

        PageDTO DetailPageDTO = new PageDTO();
        DetailPageDTO.setBoardId(BoardId);
        DetailPageDTO.setPage(DetailPage);
        PageDTO bestPageDTO = new PageDTO();
        bestPageDTO.setPage(bestPage);

        model.addAttribute("answerDTOList",boardService.findByAnswerList(BoardId));
        model.addAttribute("bestBoardDTOList",boardService.bestBoardList(bestPageDTO));
        model.addAttribute("CommentList", commentService.commentList(DetailPageDTO));
        model.addAttribute("CommentPaging",commentService.commentPagingParam(DetailPageDTO,q));
        model.addAttribute("CommentCount", commentService.commentCount(BoardId));
        model.addAttribute("BoardDTO", boardService.findByBoard(BoardId));
        model.addAttribute("memberDTO", boardService.findById(session.getAttribute("memberId")));
        return "/boardPage/boardDetail";
    }
    @PostMapping("/answer/save")
    public String answerSave(@ModelAttribute AnswerDTO answerDTO) throws IOException{
        MemberDTO memberDTO = boardService.findById(answerDTO.getMemberId());
        BoardDTO boardDTO = boardService.findByBoard(answerDTO.getBoardId());
        memberDTO.setMemberPoint(memberDTO.getMemberPoint() + boardDTO.getBoardDPoint());
        memberService.memberPointUpdate(memberDTO);
        boardService.boardAnswerUp(answerDTO.getBoardId());
        boardService.boardAnswerSave(answerDTO);
        return "redirect:/board/detail?BoardId="+answerDTO.getBoardId();
    }
    @GetMapping("/board/Qna")
    public String boardQna(@RequestParam(value = "qnaPage", required = false,defaultValue = "1")int qnaPage,
                           @RequestParam(value = "q",required = false,defaultValue = "") String q,
                           Model model,HttpSession session){
        PageDTO qnaPageDTO = new PageDTO();
        qnaPageDTO.setPage(qnaPage);
        model.addAttribute("qnaBoardDTOList",boardService.qnaBoardList(qnaPageDTO,q));
        model.addAttribute("qnaPaging",boardService.qnaPagingParam(qnaPageDTO,q));
        model.addAttribute("memberDTO", boardService.findById(session.getAttribute("memberId")));
        return "/boardPage/boardQna";
    }
    @PostMapping("/boardQna/UDPage")
    public ResponseEntity boardQnaUD(@RequestParam(value = "qnaPage", required = false,defaultValue = "1")int qnaPage,
                                     @RequestParam(value = "q",required = false,defaultValue = "") String q) {
        PageDTO qnaPageDTO = new PageDTO();
        qnaPageDTO.setPage(qnaPage);

        Map<String,Object> boardQnaResponse = new HashMap<>();

        boardQnaResponse.put("qnaBoardDTOList",boardService.qnaBoardList(qnaPageDTO,q));
        boardQnaResponse.put("qnaBoardPage",boardService.qnaPagingParam(qnaPageDTO,q));
        return new ResponseEntity<>(boardQnaResponse,HttpStatus.OK);
    }
    @GetMapping("/board/Rank")
    public String boardRank(Model model,HttpSession session) {
        model.addAttribute("memberDTOList",memberService.findRank());
        model.addAttribute("memberDTO", boardService.findById(session.getAttribute("memberId")));
        return "/boardPage/boardRank";
    }
    @PostMapping("/board/bestAnswer")
    public ResponseEntity bestAnswer(@RequestParam("memberId") Long memberId,
                                     @RequestParam("boardId") Long boardId,
                                     @RequestParam("answerId") Long answerId){
        BoardDTO boardDTO = boardService.findByBoard(boardId);
        MemberDTO memberDTO = boardService.findById(memberId);
        boardDTO.setBoardGoodAnswer(1);
        memberDTO.setMemberGoodCount(memberDTO.getMemberGoodCount()+1);
        AnswerDTO answerDTO = boardService.findByAnswer(answerId);

        answerDTO.setGoodAnswer(1L);
        memberDTO.setMemberPoint(memberDTO.getMemberPoint()+boardDTO.getBoardPoint());
        memberService.memberPointUpdate(memberDTO);
        memberService.memberGoodCountUp(memberDTO);
        boardService.boardGoodAnswerUp(boardDTO);
        boardService.GoodAnswerUp(answerDTO);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
