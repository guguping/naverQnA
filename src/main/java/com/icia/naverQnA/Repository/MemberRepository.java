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
}
