package com.icia.naverQnA.Service;

import com.icia.naverQnA.DTO.MemberDTO;
import com.icia.naverQnA.Repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;
    public void saveMember(MemberDTO memberDTO) {
        memberRepository.saveMember(memberDTO);
    }

    public String emailcheck(String memberEmail) {
        return memberRepository.emailcheck(memberEmail);
    }

    public MemberDTO loginMember(MemberDTO memberDTO) {
        return memberRepository.loginMember(memberDTO);
    }

    public void memberPointUpdate(MemberDTO memberDTO) {
        memberRepository.memberPointUpdate(memberDTO);
    }

    public void memberGoodCountUp(MemberDTO memberDTO) {
        memberRepository.memberGoodCountUp(memberDTO);
    }

    public List<MemberDTO> findRank() {
        return memberRepository.findRank();
    }
}
