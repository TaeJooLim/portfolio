package com.portfolio.erp.repository.admin.produce;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.portfolio.erp.model.contract.ContractVO;
import com.portfolio.erp.model.produce.ProduceVO;
import com.portfolio.erp.model.product.ProductVO;

@Repository
public class ProduceDaoImpl implements ProduceDao{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void setProduceOne(String contDocNum) {
		List<ContractVO> list = sqlSession.selectList("contract.getContDList", contDocNum);
		for (int i = 0; i < list.size(); i++) {
			String str = "";
			int pIdFk = list.get(i).getpIdFk();
			int processCnt = sqlSession.selectOne("product.getMaxProcessSeq", pIdFk);
			List<ProductVO> pList = sqlSession.selectList("getProcessList", pIdFk);

			str += "INSERT INTO produce SET ";
			str += "prod_doc_num_fk = '" + contDocNum + "', ";
			str += "prod_p_name = '" + list.get(i).getContDpName() + "', ";
			str += "prod_p_unit = '" + list.get(i).getContDpUnit() + "', ";
			str += "prod_p_amount = '" + list.get(i).getContDpAmount() + "', ";
			
			for (int j = 0; j < processCnt; j++) {
				str += "prod_process_name" + (j+1) + " = '" + pList.get(j).getProcName() + "', ";
				str += "prod_process" + (j+1) + " = 'N', ";
			}
			
			str += "prod_process_cnt = " + processCnt;
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("str", str);
			sqlSession.insert("produce.setProduceOne", str);
		}
	}

	@Override
	public List<ProduceVO> getProduceOne(String contDocNum) {
		return sqlSession.selectList("produce.getProduceOne", contDocNum);
	}

	@Override
	public void updateQcOne(String prod_process, String prodValue, int prodId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("prod_process", prod_process);
		map.put("prodValue", prodValue);
		map.put("prodId", prodId);
		
		sqlSession.update("produce.updateQcOne", map);
		ProduceVO pvo = sqlSession.selectOne("produce.getQcInfo", prodId);
		
		int cnt = 0;
		for (int i = 0; i < pvo.getProdProcessCnt(); i++) {
			
			if(pvo.getProdProcess1() == null) break;
			if(pvo.getProdProcess1().equals("Y")) cnt++;
			
			if(pvo.getProdProcess2() == null) break;
			if(pvo.getProdProcess2().equals("Y")) cnt++;

			if(pvo.getProdProcess3() == null) break;
			if(pvo.getProdProcess3().equals("Y")) cnt++;
			
			if(pvo.getProdProcess4() == null) break;
			if(pvo.getProdProcess4().equals("Y")) cnt++;
			
			if(pvo.getProdProcess5() == null) break;
			if(pvo.getProdProcess5().equals("Y")) cnt++;
			
		}
		if (cnt == pvo.getProdProcessCnt()) {
			map.put("updateRelease", "Y");
			sqlSession.update("produce.updateProdRelease", map);
		}
		else {
			map.put("updateRelease", "N");
			sqlSession.update("produce.updateProdRelease", map);
		}
	}

	@Override
	public List<ProduceVO> getReleaseList(String searchOpt, String words, int startIndex, int pageSize) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		map.put("startIndex", startIndex);
		map.put("pageSize", pageSize);
		
		return sqlSession.selectList("produce.getReleaseList", map);
	}

	@Override
	public int getReleaseListCnt(String searchOpt, String words) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		
		return sqlSession.selectOne("produce.getReleaseListCnt", map);
	}
}