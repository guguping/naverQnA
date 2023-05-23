package com.icia.naverQnA.Repository;

import com.icia.naverQnA.DTO.BoardDTO;
import com.icia.naverQnA.DTO.MemberDTO;
import com.icia.naverQnA.DTO.PageDTO;
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

    public List<BoardDTO> bestBoardList(PageDTO bestPageDTO) {
        return sql.selectList("naverBoard.bestBoardList",bestPageDTO);
    }

    public int BoardCount() {
        return sql.selectOne("naverBoard.BoardCount");
    }

    public List<BoardDTO> qnaBoardDTOList(PageDTO qnaPageDTO) {
        return sql.selectList("naverBoard.qnaBoardList",qnaPageDTO);
    }
}
