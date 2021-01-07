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
	public void deleteVacation(String offStartDate, String offEndDate, int empId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("offStartDate", offStartDate);
		map.put("offEndDate", offEndDate);
		map.put("empId", empId);
		
		sqlSession.delete("vacation.deleteVacation", map);
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

}
