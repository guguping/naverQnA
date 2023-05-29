package com.icia.naverQnA.Controller;

import com.icia.naverQnA.DTO.BoardDTO;
import com.icia.naverQnA.DTO.CommentDTO;
import com.icia.naverQnA.DTO.PageDTO;
import com.icia.naverQnA.Service.BoardService;
import com.icia.naverQnA.Service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CommentController {
    @Autowired
    private CommentService commentService;
    @Autowired
    private BoardService boardService;

    @PostMapping("/comment/save")
    public ResponseEntity<Map<String, Object>> commentSave(@RequestParam(value = "DetailPage", required = false, defaultValue = "1") int DetailPage,
                                                           @RequestParam(value = "q",required = false,defaultValue = "") String q,
                                                           @ModelAttribute CommentDTO commentDTO) {
        commentService.commentSave(commentDTO);
        PageDTO DetailPageDTO = new PageDTO();
        DetailPageDTO.setPage(DetailPage);
        DetailPageDTO.setBoardId(commentDTO.getBoardId());
        List<CommentDTO> commentDTOList = commentService.commentList(DetailPageDTO);
        String count = commentService.commentCount(commentDTO.getBoardId());

        Map<String, Object> commentResponse = new HashMap<>();
        commentResponse.put("comments", commentDTOList);
        commentResponse.put("count", count);
        commentResponse.put("boardDTO",boardService.findByBoard(commentDTO.getBoardId()));
        commentResponse.put("DetailCommentPage",commentService.commentPagingParam(DetailPageDTO,q));

        return new ResponseEntity<>(commentResponse, HttpStatus.OK);
    }
    @PostMapping("/comment/UDPage")
    public ResponseEntity commentBackPage(@RequestParam(value = "DetailPage", required = false, defaultValue = "1") int DetailPage,
                                          @RequestParam(value = "q",required = false,defaultValue = "") String q,
                                          @RequestParam("boardId") Long boardId){
        PageDTO DetailPageDTO = new PageDTO();
        DetailPageDTO.setPage(DetailPage);
        DetailPageDTO.setBoardId(boardId);

        Map<String, Object> commentResponse = new HashMap<>();
        commentResponse.put("boardDTO",boardService.findByBoard(boardId));
        commentResponse.put("commentDTOList",commentService.commentList(DetailPageDTO));
        commentResponse.put("DetailCommentPage",commentService.commentPagingParam(DetailPageDTO,q));
        return new ResponseEntity<>(commentResponse,HttpStatus.OK);
    }
}
