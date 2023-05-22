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

    public List<BoardDTO> bestBoardList(int page) {
        int pageLimit = 6;
        int pageStart = (page-1) *pageLimit;
        Map<String , Integer> listParam = new HashMap<>();
        listParam.put("start",pageStart);
        listParam.put("limit",pageLimit);
        List<BoardDTO> boardDTOList =boardRepository.bestBoardList(listParam);
        return boardDTOList;
    }

    public PageDTO bestPagingParam(int page) {
        int pageLimit = 6;
        int blockLimit = 2;
        int boardCount =boardRepository.bestBoardCount();
        int maxPage = (int)(Math.ceil((double)boardCount / pageLimit));
        int startPage = (((int)(Math.ceil((double) page / blockLimit))) - 1) * blockLimit + 1;
        int endPage = startPage + blockLimit -1;
        if(endPage > maxPage) {
            endPage = maxPage;
        }
        PageDTO pageDTO = new PageDTO();
        pageDTO.setPage(page);
        pageDTO.setMaxPage(maxPage);
        pageDTO.setStartPage(startPage);
        pageDTO.setEndPage(endPage);
        return pageDTO;
    }
}
