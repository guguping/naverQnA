package com.icia.naverQnA.DTO;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
public class CommentDTO {
    Long id;
    Long boardId;
    Long memberId;
    String commentWriter;
    String commentContents;
    Timestamp commentCreatedDate;
}
