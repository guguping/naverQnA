package com.icia.naverQnA.DTO;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;
import java.util.List;

@Data
@NoArgsConstructor
public class BoardDTO {
    Long id;
    String boardTitle;
    String boardWriter;
    String boardContents;
    int boardHits;
    int boardAnswer = 0;
    Timestamp boardCreatedDate;
    int fileAttached = 0;
    List<MultipartFile> boardFile;
    Long memberId;
}
