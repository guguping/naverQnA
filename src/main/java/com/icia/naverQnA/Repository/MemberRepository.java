package com.icia.naverQnA.Repository;

import com.icia.naverQnA.DTO.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public void saveMember(MemberDTO memberDTO) {
        sql.insert("naverMember.saveMember",memberDTO);
    }

    public String emailcheck(String memberEmail) {
        return sql.selectOne("naverMember.emailCheck",memberEmail);
    }

    public MemberDTO loginMember(MemberDTO memberDTO) {
        return sql.selectOne("naverMember.loginMember",memberDTO);
    }

    public void memberPointUpdate(MemberDTO memberDTO) {
        sql.update("naverMember.memberPointUpdate",memberDTO);
    }

    public void memberGoodCountUp(MemberDTO memberDTO) {
        sql.update("naverMember.memberGoodCountUp",memberDTO);
    }

    public List<MemberDTO> findRank() {
        return sql.selectList("naverMember.findRank");
    }
}
