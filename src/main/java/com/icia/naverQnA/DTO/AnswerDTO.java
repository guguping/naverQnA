package com.icia.naverQnA.DTO;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Data
@NoArgsConstructor
public class AnswerDTO {
    Long id;
    Long boardId;
    Long memberId;
    String anserWriter;
    String anserContents;
    String anserCreatedDate;
    int fileAttached = 0;
    List<MultipartFile> boardFile;
    int goodAnser = 0;
}
