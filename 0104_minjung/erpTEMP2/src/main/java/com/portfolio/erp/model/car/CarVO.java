package com.portfolio.erp.model.car;

public class CarVO {
	
	// 1. corp_car 테이블 field
	private int carID;					// PK
	private String carModel;			// 
	private String carName;
	private String carNum;
	private String carPurchaseDate;
	private int carPurchasePrice;
	private int carUseYear;
	private int carScrapValue;
	private String carInsuranceStart;
	private String carInsuranceEnd;
	private String carComprehensive;
	private String carInspection;
	private int carTotalMileage;
	
	// 1. corp_car_log 테이블 field
	private int carPID;
	private String carDriveDate;
	private String carDestination;
	private String carPurpose;
	private String carDriveStart;
	private String carDriveEnd;
	private int carStartKm;
	private int carEndKm;
	private String carDriver;
	private String carPassenger;
	private String carKey;
	private String carFuel;
	private int carFuelAmount;
	private String carRemark;
	
	private int carIDFk;

	// 2. setter, getter
	public int getCarID() {
		return carID;
	}

	public void setCarID(int carID) {
		this.carID = carID;
	}

	public String getCarModel() {
		return carModel;
	}

	public void setCarModel(String carModel) {
		this.carModel = carModel;
	}

	public String getCarName() {
		return carName;
	}

	public void setCarName(String carName) {
		this.carName = carName;
	}

	public String getCarNum() {
		return carNum;
	}

	public void setCarNum(String carNum) {
		this.carNum = carNum;
	}

	public String getCarPurchaseDate() {
		return carPurchaseDate;
	}

	public void setCarPurchaseDate(String carPurchaseDate) {
		this.carPurchaseDate = carPurchaseDate;
	}

	public int getCarPurchasePrice() {
		return carPurchasePrice;
	}

	public void setCarPurchasePrice(int carPurchasePrice) {
		this.carPurchasePrice = carPurchasePrice;
	}

	public int getCarUseYear() {
		return carUseYear;
	}

	public void setCarUseYear(int carUseYear) {
		this.carUseYear = carUseYear;
	}

	public int getCarScrapValue() {
		return carScrapValue;
	}

	public void setCarScrapValue(int carScrapValue) {
		this.carScrapValue = carScrapValue;
	}

	public String getCarInsuranceStart() {
		return carInsuranceStart;
	}

	public void setCarInsuranceStart(String carInsuranceStart) {
		this.carInsuranceStart = carInsuranceStart;
	}

	public String getCarInsuranceEnd() {
		return carInsuranceEnd;
	}

	public void setCarInsuranceEnd(String carInsuranceEnd) {
		this.carInsuranceEnd = carInsuranceEnd;
	}

	public String getCarComprehensive() {
		return carComprehensive;
	}

	public void setCarComprehensive(String carComprehensive) {
		this.carComprehensive = carComprehensive;
	}

	public String getCarInspection() {
		return carInspection;
	}

	public void setCarInspection(String carInspection) {
		this.carInspection = carInspection;
	}

	public int getCarTotalMileage() {
		return carTotalMileage;
	}

	public void setCarTotalMileage(int carTotalMileage) {
		this.carTotalMileage = carTotalMileage;
	}

	public int getCarPID() {
		return carPID;
	}

	public void setCarPID(int carPID) {
		this.carPID = carPID;
	}

	public String getCarDriveDate() {
		return carDriveDate;
	}

	public void setCarDriveDate(String carDriveDate) {
		this.carDriveDate = carDriveDate;
	}

	public String getCarDestination() {
		return carDestination;
	}

	public void setCarDestination(String carDestination) {
		this.carDestination = carDestination;
	}

	public String getCarPurpose() {
		return carPurpose;
	}

	public void setCarPurpose(String carPurpose) {
		this.carPurpose = carPurpose;
	}

	public String getCarDriveStart() {
		return carDriveStart;
	}

	public void setCarDriveStart(String carDriveStart) {
		this.carDriveStart = carDriveStart;
	}

	public String getCarDriveEnd() {
		return carDriveEnd;
	}

	public void setCarDriveEnd(String carDriveEnd) {
		this.carDriveEnd = carDriveEnd;
	}

	public int getCarStartKm() {
		return carStartKm;
	}

	public void setCarStartKm(int carStartKm) {
		this.carStartKm = carStartKm;
	}

	public int getCarEndKm() {
		return carEndKm;
	}

	public void setCarEndKm(int carEndKm) {
		this.carEndKm = carEndKm;
	}

	public String getCarDriver() {
		return carDriver;
	}

	public void setCarDriver(String carDriver) {
		this.carDriver = carDriver;
	}

	public String getCarPassenger() {
		return carPassenger;
	}

	public void setCarPassenger(String carPassenger) {
		this.carPassenger = carPassenger;
	}

	public String getCarKey() {
		return carKey;
	}

	public void setCarKey(String carKey) {
		this.carKey = carKey;
	}

	public String getCarFuel() {
		return carFuel;
	}

	public void setCarFuel(String carFuel) {
		this.carFuel = carFuel;
	}

	public int getCarFuelAmount() {
		return carFuelAmount;
	}

	public void setCarFuelAmount(int carFuelAmount) {
		this.carFuelAmount = carFuelAmount;
	}

	public String getCarRemark() {
		return carRemark;
	}

	public void setCarRemark(String carRemark) {
		this.carRemark = carRemark;
	}

	public int getCarIDFk() {
		return carIDFk;
	}

	public void setCarIDFk(int carIDFk) {
		this.carIDFk = carIDFk;
	}
	
}