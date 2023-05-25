package com.icia.naverQnA.Repository;

import com.icia.naverQnA.DTO.CommentDTO;
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

    public List<CommentDTO> commentList(Long boardId) {
        return sql.selectList("boardComment.commentList",boardId);
    }
}
