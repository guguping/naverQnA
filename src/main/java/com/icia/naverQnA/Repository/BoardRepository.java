package com.icia.naverQnA.Repository;

import com.icia.naverQnA.DTO.BoardDTO;
import com.icia.naverQnA.DTO.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

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

    public List<BoardDTO> bestBoardList(Map<String, Integer> listParam) {
        return sql.selectList("naverBoard.bestBoardList",listParam);
    }

    public int bestBoardCount() {
        return sql.selectOne("naverBoard.bestBoardCount");
    }
}
