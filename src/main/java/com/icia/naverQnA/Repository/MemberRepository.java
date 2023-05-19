package com.icia.naverQnA.Repository;

import com.icia.naverQnA.DTO.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
