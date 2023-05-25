package com.icia.naverQnA.Controller;

import com.icia.naverQnA.DTO.CommentDTO;
import com.icia.naverQnA.Service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class CommentController {
    @Autowired
    private CommentService commentService;
    @PostMapping("/comment/save")
    public ResponseEntity commentSave(@ModelAttribute CommentDTO commentDTO) {
        commentService.commentSave(commentDTO);
        List<CommentDTO> commentDTOList = commentService.commentList(commentDTO.getBoardId());
        return new ResponseEntity<>(commentDTOList, HttpStatus.OK);
    }
}
