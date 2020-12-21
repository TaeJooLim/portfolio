package com.example.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.project.service.MemberSrv;
import com.example.project.model.MemberVO;

@Controller
public class MainCtr {

	@Autowired
	MemberSrv memberSrv;

	// 첫화면(임시) = 로그인
	@RequestMapping("")
	public String getMain() {
		return "login";
	}

	// 로그인화면
	@RequestMapping("/login")
	public String getLogin() {
		return "login";
	}

	// 세션 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public String checkLogin(@ModelAttribute MemberVO mvo, HttpSession session) {
		MemberVO vo = memberSrv.checkLogin(mvo, session);
		String msg;
		
		if ( vo != null ) {
			
			//관리자 승인 여부 확인
			String isConfirm = vo.getMemConfirm();
			String notConfirm = "N";
			if( isConfirm.equals(notConfirm) ) {
				msg = "needConfirm";
			}else {
				msg = "success";
			}
			
		}else {
			msg = "failure";
		}
		return msg;
	}

	// 세션 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		memberSrv.logout(session);
		return "redirect:/login";
	}

	// 사용자페이지로 이동
	@RequestMapping("/userhome")
	public String getUserhome() {
		return "userhome";
	}

	// 관리자페이지로 이동
	@RequestMapping("/adminhome")
	public String getAdminhome() {
		return "adminPage/adminhome";
	}
}
