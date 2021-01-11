package com.portfolio.erp.repository.admin.vacation;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.portfolio.erp.model.employee.EmployeeVO;
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
	public List<VacationVO> getVacationList(int empId) {
		return sqlSession.selectList("vacation.getVacationList", empId);
	}

	@Override
	public int getCntOffTypeA() {
		return sqlSession.selectOne("vacation.getCntOffTypeA");
	}

	@Override
	public int getCntOffTypeB() {
		return sqlSession.selectOne("vacation.getCntOffTypeB");
	}

	@Override
	public int getCntOffTypeC() {
		return sqlSession.selectOne("vacation.getCntOffTypeC");
	}
	
	@Override
	public int getCntOffTypeD() {
		return sqlSession.selectOne("vacation.getCntOffTypeD");
	}

	@Override
	public List<VacationVO> getVacationListAll(String searchOpt, String words) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchOpt", searchOpt);
		map.put("words", words);
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

}
