package com.example.project.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.model.MemberVO;
import com.example.project.repository.MemberDao;

@Service
public class MemberSrv {

	@Autowired
	MemberDao memberDao;

	public MemberVO checkLogin(MemberVO mvo, HttpSession session) {
		MemberVO vo = memberDao.checkLogin(mvo);
		if ( vo != null ) {
			session.setAttribute("memID", vo.getMemID());
			session.setAttribute("memName", vo.getMemName());
			session.setAttribute("memNum", vo.getMemNum());
			session.setAttribute("memBuseoName", vo.getMemBuseoName());
			session.setAttribute("memGradeName", vo.getMemGradeName());
			session.setAttribute("memLevel", vo.getMemLevel());
			session.setAttribute("memConfirm", vo.getMemConfirm());
		}else {
			vo = null;
		}
		return vo;
	}

	// 세션 로그아웃
	public void logout(HttpSession session) {
		session.invalidate();
	}
}
