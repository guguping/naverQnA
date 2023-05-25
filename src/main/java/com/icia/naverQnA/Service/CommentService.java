package com.icia.naverQnA.Service;

import com.icia.naverQnA.DTO.CommentDTO;
import com.icia.naverQnA.Repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {
    @Autowired
    private CommentRepository commentRepository;

    public void commentSave(CommentDTO commentDTO) {
        commentRepository.commentSave(commentDTO);
    }

    public List<CommentDTO> commentList(Long boardId) {
        return commentRepository.commentList(boardId);
    }
}
