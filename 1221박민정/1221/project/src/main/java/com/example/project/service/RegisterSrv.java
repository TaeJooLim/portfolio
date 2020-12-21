package com.example.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.model.BuseoVO;
import com.example.project.model.GradeVO;
import com.example.project.model.MemberVO;
import com.example.project.repository.RegisterDao;

@Service
public class RegisterSrv {
	
	@Autowired
	RegisterDao registerDao;
	
	public List<BuseoVO> getBuseo() {
		return registerDao.getBuseo();
	}
	
	public List<GradeVO> getGrade() {
		return registerDao.getGrade();
	}
	
	public void setMember(MemberVO mvo) {
		registerDao.setMember(mvo);
	}
	
	public int checkID(MemberVO mvo) {
		return registerDao.checkID(mvo);
	}
}
