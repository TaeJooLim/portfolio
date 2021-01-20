package com.portfolio.erp.repository.admin.car;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.portfolio.erp.model.car.CarVO;

@Repository
public class CarDaoImpl implements CarDao{
	
	@Autowired
	   SqlSession sqlSession;
	
	@Override
	public void setCar(CarVO cvo) {
		sqlSession.insert("car.setCar", cvo);
	}

	@Override
	public void setCarUse(CarVO cvo) {
		sqlSession.insert("car.setCarUse", cvo);
		sqlSession.update("car.changeStartKm", cvo);
	}

	@Override
	public List<CarVO> getCarList(String words, String searchOpt, int startIndex, int pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("words", words);
		map.put("searchOpt", searchOpt);
		map.put("startIndex", startIndex);
		map.put("pageSize", pageSize);
		
		return sqlSession.selectList("car.getCarList",map);
	}

	@Override
	public List<CarVO> getCarUseList(String words, String searchOpt, int carID, int startIndex, int pageSize) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("words", words);
		map.put("searchOpt", searchOpt);
		map.put("carID", carID);
		map.put("startIndex", startIndex);
		map.put("pageSize", pageSize);
		return sqlSession.selectList("car.getCarUseList",map);
	}

	@Override
	public CarVO getCarOne(int carID) {
		return sqlSession.selectOne("car.getCarOne", carID);
	}

	@Override
	public CarVO getCarUpdateList(int carID) {
		return sqlSession.selectOne("car.getCarOne", carID);
	}

	@Override
	public void getCarUpdate(CarVO cvo) {
		sqlSession.update("car.getCarUpdate",cvo);
	}

	@Override
	public void setCarDelete(int carID) {
		sqlSession.delete("car.setCarDelete",carID);
	}

	@Override
	public CarVO getCarUseUpdateList(int carPID) {
		return sqlSession.selectOne("car.getCarUseUpdateList", carPID);
	}

	@Override
	public void getCarUseUpdate(CarVO cvo) {
		sqlSession.update("car.getCarUseUpdate", cvo);
	}

	@Override
	public void setCarUseDelete(int carPID) {
		sqlSession.delete("car.setCarUseDelete",carPID);
	}

	@Override
	public int carCount(String words, String searchOpt) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("words", words);
		map.put("searchOpt", searchOpt);
		return sqlSession.selectOne("car.carCount", map);
	}

	@Override
	public int carUseCount(String words, String searchOpt, int carID) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("words", words);
		map.put("searchOpt", searchOpt);
		map.put("carID", carID);
		return sqlSession.selectOne("car.carUseCount", map);
	}
}
