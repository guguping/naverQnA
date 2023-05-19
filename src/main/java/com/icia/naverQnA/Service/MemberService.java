package com.icia.naverQnA.Service;

import com.icia.naverQnA.DTO.MemberDTO;
import com.icia.naverQnA.Repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;
    public void saveMember(MemberDTO memberDTO) {
        memberRepository.saveMember(memberDTO);
    }
}
