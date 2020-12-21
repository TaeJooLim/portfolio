package com.example.project.repository.adminPageRepo.memberMngmtRepo;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.project.model.MemberVO;

@Repository
public class MemberMngmtDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public MemberVO getMemOne(String sessionNum) {
		return sqlSession.selectOne("member.getMemOne",sessionNum);
	}
	
	public MemberVO getMemOthersOne(String sessionNum) {
		return sqlSession.selectOne("member.getMemOthersOne",sessionNum);
	}
	
	public void setMemOthers(MemberVO mvo) {
		sqlSession.update("member.updateMem", mvo);
		int result = sqlSession.selectOne("member.existsMemOthers", mvo);
		if ( result == 0 ) {
			// member_others TBL에 세션멤버의 정보가 없
			sqlSession.insert("member.setMemOthers",mvo);
		}else {
			// member_others TBL에 세션멤버의 정보가 있음
			sqlSession.update("member.updateMemOthers", mvo);
		}
	}
	
	public List<MemberVO> getMemApplicant(int start, int end, String searchOpt, String words) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOpt",searchOpt);
		map.put("words",words);
		map.put("start",start);
		map.put("end",end);
		return sqlSession.selectList("member.getMemApplicant",map);
	}
	
	public void approveConfirm(int num) {
		sqlSession.update("member.approveConfirm",num);
	}
	
	public void disapproveConfirm(int num) {
		sqlSession.delete("member.disapproveConfirm",num);
	}

	public int getApplicantCount(String searchOpt, String words) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchOpt",searchOpt);
		map.put("words",words);
		return sqlSession.selectOne("member.getApplicantCount",map);
	}
	
	public void approveAll(int num) {
		sqlSession.update("member.approveAll",num);
	}
	
	public void rejectAll(int num) {
		sqlSession.delete("member.rejectAll",num);
	}
	
	public List<MemberVO> getMemList(int start, int end, String searchOpt, String words) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOpt",searchOpt);
		map.put("words",words);
		map.put("start",start);
		map.put("end",end);
		return sqlSession.selectList("member.getMemList",map);
	}
	
	public int getMemCount(String searchOpt, String words) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchOpt",searchOpt);
		map.put("words",words);
		return sqlSession.selectOne("member.getMemCount",map);
	}
	
	public void changeGender(String memGender, int num){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memGender",memGender);
		map.put("num",num);
		sqlSession.update("member.changeGender",map);
	}
	
	public void changeLevel(String memLevel, int num){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memLevel",memLevel);
		map.put("num",num);
		sqlSession.update("member.changeLevel",map);
	}
	
	public void changeConfirm(String memConfirm, int num){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memConfirm",memConfirm);
		map.put("num",num);
		sqlSession.update("member.changeConfirm",map);
	}
	
	public void deleteOne(int num) {
		sqlSession.delete("member.deleteOne",num);
	}
	
	public void deleteMemAll(int num) {
		sqlSession.delete("member.deleteMemAll",num);
	}
}
