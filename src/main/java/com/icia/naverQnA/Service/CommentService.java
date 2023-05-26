package com.icia.naverQnA.Service;

import com.icia.naverQnA.DTO.CommentDTO;
import com.icia.naverQnA.DTO.PageDTO;
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
    public String commentCount(Long BoardId) {
        return commentRepository.commentCount(BoardId);
    }

    public List<CommentDTO> commentList(PageDTO DetailPage) {
        DetailPage.setPageLimit(5);
        return commentRepository.commentList(DetailPage);
    }
    public Object commentPagingParam(PageDTO DetailPageDTO, String q) {
        DetailPageDTO.setBlockLimit(10);
        DetailPageDTO.setQ(q);
        DetailPageDTO.setBoardCount(Integer.parseInt(commentRepository.commentCount(DetailPageDTO.getBoardId())));
        if(DetailPageDTO.getEndPage() > DetailPageDTO.getMaxPage()){
            DetailPageDTO.setEndPage(DetailPageDTO.getMaxPage());
        }
        return DetailPageDTO;
    }
}
