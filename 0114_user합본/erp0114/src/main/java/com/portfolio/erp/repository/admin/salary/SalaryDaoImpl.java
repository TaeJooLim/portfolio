package com.portfolio.erp.repository.admin.salary;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.portfolio.erp.model.employee.EmployeeVO;
import com.portfolio.erp.model.salary.SalaryVO;

@Repository
public class SalaryDaoImpl implements SalaryDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<SalaryVO> getSalarayTaxList(int startIndex, int pageSize) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startIndex", startIndex);
		map.put("pageSize", pageSize);
		
		return sqlSession.selectList("salary.getSalarayTaxList", map);
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
	public List<SalaryVO> getMonthSalaryList(String searchOpt, String searchDate, String words, int startIndex, int pageSize) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOpt", searchOpt);
		map.put("searchDate", searchDate);
		map.put("words", words);
		map.put("startIndex", startIndex);
		map.put("pageSize", pageSize);

		return sqlSession.selectList("salary.getMonthSalaryList", map);
	}

	@Override
	public int setSalaryAll(String toDate) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOpt", "emp_name");
		map.put("toDate", toDate);
		map.put("words", "");

		// 범위설정
		int empCnt = sqlSession.selectOne("employee.getEmpCount", map);
		map.put("startIndex", 0);
		map.put("pageSize", empCnt);
		int cntchk = sqlSession.selectOne("salary.sqlaryCntChk", map);
		
		if (cntchk == 0) {
			List<EmployeeVO> eList = sqlSession.selectList("employee.getEmployeeList", map);
			for (int i = 0; i < eList.size(); i++) {
				map.put("empId", eList.get(i).getEmpId());
				map.put("empPosition", eList.get(i).getEmpPosition());

				// 기본급(salary_base테이블)을 찾아서(Join) 입력
				int salaryPay = sqlSession.selectOne("salary.getSalaryPayInfo", eList.get(i).getEmpPosition());
				map.put("salaryPay", salaryPay);
				
				// 비과세항목 입력
				// 호봉수당 = 호봉 * 10,000
				int emp_step_pay = eList.get(i).getEmpStep() * 10000;
				map.put("empStep", emp_step_pay);		
				
				// 직책수당 = 부서장이면 + 100,000
				int emp_headcheck_pay = 0;
				if(eList.get(i).getEmpHeadcheck().equals("Y")) {
					emp_headcheck_pay = 100000;
				}
				map.put("empHeadcheck", emp_headcheck_pay);
				
				// 식사비용 = 150,000
				int salary_food_pay = 150000;
				map.put("salaryFood", salary_food_pay);
				
				int salaryNontaxTotal = emp_step_pay + emp_headcheck_pay + salary_food_pay;
				map.put("salaryNontaxTotalcost", salaryNontaxTotal);
				
				
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

	@Override
	public SalaryVO getMonthSalaryOne(int sformId) {
		return sqlSession.selectOne("salary.getMonthSalaryOne", sformId);
	}

	@Override
	public int getMonthSalaryCnt() {
		return sqlSession.selectOne("salary.getMonthSalaryCnt");
	}

	@Override
	public int getSalarayTaxCnt() {
		return sqlSession.selectOne("salary.getSalarayTaxCnt");
	}

}
