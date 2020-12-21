package com.example.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.project.model.BuseoVO;
import com.example.project.model.GradeVO;
import com.example.project.model.MemberVO;
import com.example.project.service.MemberSrv;
import com.example.project.service.RegisterSrv;

@Controller
public class RegisterCtr {

	@Autowired
	MemberSrv memberSrv;

	@Autowired
	RegisterSrv registerSrv;

	// 회원가입
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String getRegister() {
		return "register";
	}

	// 회원가입폼을 DB에 저장
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String setMember(@ModelAttribute MemberVO mvo) {
		/* 사원번호 만들기 = 입사일 + 부서코드 + 직급코드 + PK */
		int enterYear = Integer.parseInt(mvo.getMemEntdate().substring(0, 4));
		String buseoCode = mvo.getMemBuseoCode();
		String gradeCode = mvo.getMemGradeCode();
		String mNum = enterYear + buseoCode + gradeCode;
		mvo.setMemNum(mNum);
		/* 사원번호 만들기 끝 */
		/* 필수 사원 정보 입력 */
		registerSrv.setMember(mvo);
		/* 필수 사원 정보 입력 완료 */
		return "redirect:/login";
	}

	// ajax 부서 가져오기
	@RequestMapping(value = "/get_buseo", method = RequestMethod.POST)
	@ResponseBody
	public List<BuseoVO> getBuseo() {
		List<BuseoVO> list = registerSrv.getBuseo();
		return list;
	}

	// ajax 직급 가져오기
	@RequestMapping(value = "/get_grade", method = RequestMethod.POST)
	@ResponseBody
	public List<GradeVO> getGrade() {
		List<GradeVO> list = registerSrv.getGrade();
		return list;
	}
	
	// 아이디 중복 확인
	@RequestMapping(value="/checkID", method = RequestMethod.POST)
	@ResponseBody
	public String checkID(MemberVO mvo) {
		String msg;
		//count == 1 : DB에 해당 아이디가 존재한다
		int count = registerSrv.checkID(mvo);
		if( count > 0 ) {
			msg = "exists";
		}else {
			msg = "notExists";
		}
		return msg;
	}
}
