package com.icia.naverQnA.Repository;

import com.icia.naverQnA.DTO.AnswerDTO;
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

    public int BoardCount(PageDTO qnaPageDTO) {
        if(!(qnaPageDTO.getQ().equals(""))){
            return sql.selectOne("naverBoard.BoardSearchCount",qnaPageDTO);
        } else {
            return sql.selectOne("naverBoard.BoardCount");
        }
    }

    public List<BoardDTO> qnaBoardDTOList(PageDTO qnaPageDTO) {
        if(!(qnaPageDTO.getQ().equals(""))) {
            return sql.selectList("naverBoard.qnaSearchBoardList",qnaPageDTO);
        } else {
            return sql.selectList("naverBoard.qnaBoardList", qnaPageDTO);
        }
    }

    public BoardDTO findByBoard(Long boardId) {
        return sql.selectOne("naverBoard.findByBoard",boardId);
    }

    public void boardHitsUp(Long boardId) {
        sql.update("naverBoard.boardHitsUp",boardId);
    }

    public void boardAnswerUp(Long boardId) {
        sql.update("naverBoard.boardAnswerUp",boardId);
    }

    public void boardAnswerSave(AnswerDTO answerDTO) {
        sql.insert("naverBoard.boardAnswerSave",answerDTO);
    }

    public List<AnswerDTO> findByAnswerList(Long boardId) {
        return sql.selectList("naverBoard.findByAnswerList",boardId);
    }
}
