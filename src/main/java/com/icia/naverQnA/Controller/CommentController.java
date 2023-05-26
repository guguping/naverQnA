package com.icia.naverQnA.Controller;

import com.icia.naverQnA.DTO.CommentDTO;
import com.icia.naverQnA.Service.BoardService;
import com.icia.naverQnA.Service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

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
    public ResponseEntity<Map<String, Object>> commentSave(@ModelAttribute CommentDTO commentDTO) {
        commentService.commentSave(commentDTO);
        List<CommentDTO> commentDTOList = commentService.commentList(commentDTO.getBoardId());
        String count = boardService.commentCount(commentDTO.getBoardId());

        Map<String, Object> commentResponse = new HashMap<>();
        commentResponse.put("comments", commentDTOList);
        commentResponse.put("count", count);

        return new ResponseEntity<>(commentResponse, HttpStatus.OK);
    }
}
