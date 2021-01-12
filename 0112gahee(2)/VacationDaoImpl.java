package com.portfolio.erp.repository.admin.vacation;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.portfolio.erp.model.employee.EmployeeVO;
import com.portfolio.erp.model.order.OrderVO;
import com.portfolio.erp.model.vacation.VacationVO;

@Repository
public class VacationDaoImpl implements VacationDao {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public void setVacation(VacationVO vvo) {
		sqlSession.insert("vacation.setVacation",vvo);		
	}

	@Override
	public void updateEmpOff(EmployeeVO evo) {
		sqlSession.update("vacation.updateEmpOff", evo);
	}

	@Override
	public List<VacationVO> getVacationList(int empId, int startIndex, int pageSize) {
		HashMap<String, Object> map = new HashMap<String, Object>();
//		System.out.println("startIndex" + startIndex);
//		System.out.println("pageSize" + pageSize);
//		System.out.println("empId" + empId);
		map.put("empIdFk", empId);
		map.put("startIndex", startIndex);
		map.put("pageSize", pageSize);
		return sqlSession.selectList("vacation.getVacationList",map);
	}

	@Override
	public int getCntOffTypeA(int empId) {
		return sqlSession.selectOne("vacation.getCntOffTypeA", empId);
	}

	@Override
	public int getCntOffTypeB(int empId) {
		return sqlSession.selectOne("vacation.getCntOffTypeB", empId);
	}

	@Override
	public int getCntOffTypeC(int empId) {
		return sqlSession.selectOne("vacation.getCntOffTypeC", empId);
	}
	
	@Override
	public int getCntOffTypeD(int empId) {
		return sqlSession.selectOne("vacation.getCntOffTypeD", empId);
	}

	@Override
	public List<VacationVO> getVacationListAll(String searchOpt, String words, int startIndex, int pageSize) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		map.put("startIndex",startIndex);
		map.put("pageSize",pageSize);
		return sqlSession.selectList("vacation.getVacationListAll", map);
	}

	@Override
	public int getVacationCnt(String searchOpt, String words) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		return sqlSession.selectOne("vacation.getVacationCnt", map);
	}
	
	@Override
	public void deleteVacation(String offDocNum, int empId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("offDocNum", offDocNum);
		map.put("empId", empId);
		
		sqlSession.delete("vacation.deleteVacation", map);
	}

	@Override
	public void deleteVacationAll(String offDocNum) {
		sqlSession.delete(offDocNum);		
	}

	@Override
	public void updateConfirm(String offDocNum) {
		sqlSession.update("vacation.updateConfirm", offDocNum);
	}

	@Override
	public VacationVO getVacationForm(String offDocNum) {
		return sqlSession.selectOne("vacation.getVacationForm", offDocNum);
	}

	@Override
	public int getVacationCntOne(int empId) {
		return sqlSession.selectOne("vacation.getVacationCntOne", empId);
	}

	@Override
	public List<OrderVO> getAppVacationList(String searchOpt, String words, int startIndex, int pageSize, String confirmChk) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		map.put("startIndex",startIndex);
		map.put("pageSize",pageSize);
		map.put("confirmChk", confirmChk);
		
		return sqlSession.selectList("vacation.getAppVacationList", map);
	}

	@Override
	public int getAppVacationListCnt(String searchOpt, String words, String confirmChk) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		map.put("confirmChk", confirmChk);
		
		return sqlSession.selectOne("vacation.getAppVacationListCnt", map);
	}

	@Override
	public int getAppVacationSendListCnt(String searchOpt, String words, int empId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		map.put("empId", empId);
		
		return sqlSession.selectOne("vacation.getAppVacationSendListCnt", map);
	}

	@Override
	public List<OrderVO> getAppVacationSendList(String searchOpt, String words, 
												int startIndex, int pageSize,
												int empId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		map.put("startIndex",startIndex);
		map.put("pageSize",pageSize);
		map.put("empId", empId);
		
		return sqlSession.selectList("vacation.getAppVacationSendList", map);
	}

}
