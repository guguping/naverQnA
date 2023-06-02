package com.icia.naverQnA.DTO;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
public class MemberDTO {
    Long id;
    String memberEmail;
    String memberDomain;
    String memberPassword;
    String memberName;
    String memberBiryy;
    String memberBirmm;
    String memberBirdd;
    String memberBirthday;
    String memberGender;
    Timestamp memberCreateDate;
    Long memberPoint = 10L;
    Long memberGoodCount = 0L;
}
