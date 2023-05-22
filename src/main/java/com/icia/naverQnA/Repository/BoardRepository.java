package com.icia.naverQnA.Repository;

import com.icia.naverQnA.DTO.BoardDTO;
import com.icia.naverQnA.DTO.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public MemberDTO findById(Object memberId) {
        return sql.selectOne("naverBoard.findById",memberId);
    }

    public BoardDTO saveBoard(BoardDTO boardDTO) {
        sql.insert("naverBoard.saveBoard",boardDTO);
        return boardDTO;
    }
}
