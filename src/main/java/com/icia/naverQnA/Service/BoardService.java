package com.icia.naverQnA.Service;

import com.icia.naverQnA.DTO.BoardDTO;
import com.icia.naverQnA.DTO.MemberDTO;
import com.icia.naverQnA.Repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;

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
}
