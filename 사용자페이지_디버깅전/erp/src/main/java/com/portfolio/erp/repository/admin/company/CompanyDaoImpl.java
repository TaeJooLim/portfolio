package com.portfolio.erp.repository.admin.company;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.portfolio.erp.model.company.CompanyVO;

@Repository
public class CompanyDaoImpl implements CompanyDao {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public void setCompanyInfo(CompanyVO cvo) {
		/* company의 count 값이 0이면 insert, 0이 아니면 update */
		int result = sqlSession.selectOne("company.chkCnt");
		// System.out.println(result);
		if(result == 0 ) {
			sqlSession.insert("company.setCompanyInfo", cvo);
		}else {
			sqlSession.update("company.updateCompanyInfo", cvo);
		}
	}

	@Override
	public CompanyVO getCompanyInfo() {
		return sqlSession.selectOne("company.getCompanyInfo");
	}

	@Override
	public CompanyVO getMenu() {
		return sqlSession.selectOne("company.getMenu");
	}

}
