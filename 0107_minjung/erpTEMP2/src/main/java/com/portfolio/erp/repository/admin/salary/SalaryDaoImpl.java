package com.portfolio.erp.repository.admin.salary;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.portfolio.erp.model.employee.EmployeeVO;
import com.portfolio.erp.model.salary.SalaryVO;

@Repository
public class SalaryDaoImpl implements SalaryDao{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<SalaryVO> getSalarayTaxList() {
		return sqlSession.selectList("salary.getSalarayTaxList");
	}

	@Override
	public void setSalaryTaxList(SalaryVO svo) {
		sqlSession.update("salary.setSalaryTaxList", svo);
	}

	@Override
	public void deleteSalaryTaxList(SalaryVO svo) {
		sqlSession.delete("salary.deleteSalaryTaxList", svo);
	}

	@Override
	public List<SalaryVO> getMonthSalaryList(String searchOpt, String searchDate, String words) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchOpt", searchOpt);
		map.put("searchDate", searchDate);
		map.put("words", words);
		
		return sqlSession.selectList("salary.getMonthSalaryList", map);
	}

	@Override
	public int setSalaryAll(String toDate) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOpt", "emp_name");
		map.put("toDate", toDate);
		map.put("words", "");
		int cntchk = sqlSession.selectOne("salary.sqlaryCntChk", map);
		
		if (cntchk == 0) {
			List<EmployeeVO> eList = sqlSession.selectList("employee.getEmployeeList", map);
			for (int i = 0; i < eList.size(); i++) {
				map.put("empId", eList.get(i).getEmpId());
				map.put("empPosition", eList.get(i).getEmpPosition());
				map.put("empStep", eList.get(i).getEmpStep());
				map.put("empHeadcheck", eList.get(i).getEmpHeadcheck());

				// 기본급(salary_base테이블)을 찾아서(Join) 입력
				int salaryPay = sqlSession.selectOne("salary.getSalaryPayInfo", eList.get(i).getEmpPosition());
				map.put("salaryPay", salaryPay);
				
				// 기본급에 맞는 세금을 찾아서 입력
				SalaryVO svo = sqlSession.selectOne("salary.getSalaryTaxInfo", salaryPay);
				
				map.put("netPay", svo.getNetPay());
				map.put("salaryNps", svo.getSalaryNps());
				map.put("salaryHInsurance", svo.getSalaryHInsurance());
				map.put("salaryCare", svo.getSalaryCare());
				map.put("salaryEInsurance", svo.getSalaryEInsurance());
				map.put("salaryIncome", svo.getSalaryIncome());
				map.put("salaryLIncome", svo.getSalaryLIncome());
				map.put("salaryTotalcost", svo.getSalaryTotalcost());
				
				sqlSession.insert("salary.setSalaryAll", map);
			}
		}
		return cntchk;
	}

}
