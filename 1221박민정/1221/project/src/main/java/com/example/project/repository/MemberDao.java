package com.example.project.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.project.model.MemberVO;

@Repository
public class MemberDao {
	
	@Autowired
	SqlSession sqlSession;
		
	public MemberVO checkLogin(MemberVO mvo) {
		return sqlSession.selectOne("member.checkLogin", mvo);
	}
	
}
