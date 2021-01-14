package com.portfolio.erp.repository.admin.car;

import java.util.List;

import com.portfolio.erp.model.car.CarVO;

public interface CarDao {
	
	public void setCar(CarVO cvo);
	
	public void setCarUse(CarVO cvo);
	
	public List<CarVO> getCarList(String words, String searchOpt, int startIndex, int pageSize);
	
	public int carCount(String words, String searchOpt);
	
	public int carUseCount(String words, String searchOpt, int carID);
	
	public List<CarVO> getCarUseList(String words, String searchOpt, int carID, int startIndex, int pageSize);
	
	public CarVO getCarOne(int carID);
	
	public CarVO getCarUpdateList(int carID);
	
	public void getCarUpdate(CarVO cvo);
	
	public void setCarDelete(int carID);
	
	public CarVO getCarUseUpdateList(int carPID);
	
	public void getCarUseUpdate(CarVO cvo);
	
	public void setCarUseDelete(int carPID);
}
