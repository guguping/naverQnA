package com.icia.naverQnA.Service;

import com.icia.naverQnA.DTO.MemberDTO;
import com.icia.naverQnA.Repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService {
    @Autowired
    private BoardRepository boardRepository;

    public MemberDTO findById(Object memberId) {
        return boardRepository.findById(memberId);
    }
}
