package com.icia.naverQnA.Repository;

import com.icia.naverQnA.DTO.CommentDTO;
import com.icia.naverQnA.DTO.PageDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public void commentSave(CommentDTO commentDTO) {
        sql.insert("boardComment.commentSave",commentDTO);
    }
    public String commentCount(Long boardId) {
        return sql.selectOne("boardComment.commentCount",boardId);
    }

    public List<CommentDTO> commentList(PageDTO DetailPage) {
        return sql.selectList("boardComment.commentList",DetailPage);
    }

    public Long findByHoly(String holy) {
        return sql.selectOne("boardComment.findByHoly",holy);
    }
}
