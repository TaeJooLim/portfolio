package com.portfolio.erp.repository.admin.salary;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

}
