package com.icia.naverQnA.DTO;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;
import java.util.List;

@Data
@NoArgsConstructor
public class AnswerDTO {
    Long id;
    Long boardId;
    Long memberId;
    String answerWriter;
    String answerContents;
    Timestamp answerCreatedDate;
    int fileAttached = 0;
    List<MultipartFile> answerFile;
    Long goodAnswer = 0L;
    Long totalGoodAnswer = 0L; // 받기만해야함
}
