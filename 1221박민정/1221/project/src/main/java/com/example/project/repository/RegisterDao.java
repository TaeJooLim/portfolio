package com.example.project.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.project.model.BuseoVO;
import com.example.project.model.GradeVO;
import com.example.project.model.MemberVO;

@Repository
public class RegisterDao {

	@Autowired
	SqlSession sqlSession;
	
	public List<BuseoVO> getBuseo() {
		return sqlSession.selectList("register.getBuseo");
	}
	
	public List<GradeVO> getGrade() {
		return sqlSession.selectList("register.getGrade");
	}
	
	public void setMember(MemberVO mvo) {
		sqlSession.insert("register.setMember",mvo);
	}
	
	public int checkID(MemberVO mvo) {
		return sqlSession.selectOne("register.checkID", mvo);
	}
}
