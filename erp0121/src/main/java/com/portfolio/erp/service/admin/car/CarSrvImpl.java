package com.portfolio.erp.service.admin.car;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfolio.erp.model.car.CarVO;
import com.portfolio.erp.repository.admin.car.CarDao;

@Service
public class CarSrvImpl implements CarSrv{
	
	@Autowired
	CarDao cDao;

	@Override
	public void setCar(CarVO cvo) {
		cDao.setCar(cvo);
	}

	@Override
	public void setCarUse(CarVO cvo) {
		cDao.setCarUse(cvo);
	}

	@Override
	public List<CarVO> getCarList(String words, String searchOpt, int startIndex, int pageSize) {
		return cDao.getCarList(words, searchOpt,startIndex,pageSize);
	}

	@Override
	public List<CarVO> getCarUseList(String words, String searchOpt, int carID, int startIndex, int pageSize) {
		return cDao.getCarUseList(words, searchOpt, carID,startIndex,pageSize);
	}

	@Override
	public CarVO getCarOne(int carID) {
		return cDao.getCarOne(carID);
	}

	@Override
	public CarVO getCarUpdateList(int carID) {
		return cDao.getCarUpdateList(carID);
	}

	@Override
	public void getCarUpdate(CarVO cvo) {
		cDao.getCarUpdate(cvo);
	}

	@Override
	public void setCarDelete(int carID) {
		cDao.setCarDelete(carID);
	}

	@Override
	public CarVO getCarUseUpdateList(int carPID) {
		return cDao.getCarUseUpdateList(carPID);
	}

	@Override
	public void getCarUseUpdate(CarVO cvo) {
		cDao.getCarUseUpdate(cvo);
	}

	@Override
	public void setCarUseDelete(int carPID) {
		cDao.setCarUseDelete(carPID);
	}

	@Override
	public int carCount(String words, String searchOpt) {
		return cDao.carCount(words, searchOpt);
	}

	@Override
	public int carUseCount(String words, String searchOpt, int carID) {
		return cDao.carUseCount(words, searchOpt, carID);
	}
}