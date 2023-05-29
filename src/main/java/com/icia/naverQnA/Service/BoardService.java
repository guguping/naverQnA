package com.icia.naverQnA.Service;

import com.icia.naverQnA.DTO.BoardDTO;
import com.icia.naverQnA.DTO.MemberDTO;
import com.icia.naverQnA.DTO.PageDTO;
import com.icia.naverQnA.Repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardService {
    @Autowired
    private BoardRepository boardRepository;

    public MemberDTO findById(Object memberId) {
        return boardRepository.findById(memberId);
    }

    public void saveBoard(BoardDTO boardDTO) throws IOException {
        if (boardDTO.getBoardFile().get(0).isEmpty()) {
            boardDTO.setFileAttached(0);
            boardRepository.saveBoard(boardDTO);
        }
    }

    public List<BoardDTO> bestBoardList(PageDTO bestPageDTO) {
        bestPageDTO.setPageLimit(6);
        List<BoardDTO> boardDTOList = boardRepository.bestBoardList(bestPageDTO);
        return boardDTOList;
    }

    public PageDTO bestPagingParam(PageDTO bestPageDTO,String q) {
        bestPageDTO.setBlockLimit(2);
        bestPageDTO.setQ(q);
        bestPageDTO.setBoardCount(boardRepository.BoardCount(bestPageDTO));
        if (bestPageDTO.getEndPage() > bestPageDTO.getMaxPage()) {
            bestPageDTO.setEndPage(bestPageDTO.getMaxPage());
        }
        return bestPageDTO;
    }

    public Object qnaBoardList(PageDTO qnaPageDTO, String q) {
        qnaPageDTO.setPageLimit(10);
        qnaPageDTO.setQ(q);
        List<BoardDTO> qnaBoardDTOList = boardRepository.qnaBoardDTOList(qnaPageDTO);
        return qnaBoardDTOList;
}

    public Object qnaPagingParam(PageDTO qnaPageDTO, String q) {
        qnaPageDTO.setBlockLimit(10);
        qnaPageDTO.setQ(q);
        qnaPageDTO.setBoardCount(boardRepository.BoardCount(qnaPageDTO));
        if (qnaPageDTO.getEndPage() > qnaPageDTO.getMaxPage()) {
            qnaPageDTO.setEndPage(qnaPageDTO.getMaxPage());
        }
        return qnaPageDTO;

    }

    public BoardDTO findByBoard(Long BoardId) {
        return boardRepository.findByBoard(BoardId);
    }

    public void boardHitsUp(Long BoardId) {
        boardRepository.boardHitsUp(BoardId);
    }

    public Object answerBestBoardList(PageDTO bestPageDTO) {
        bestPageDTO.setPageLimit(4);
        List<BoardDTO> boardDTOList = boardRepository.bestBoardList(bestPageDTO);
        return boardDTOList;
    }
}
