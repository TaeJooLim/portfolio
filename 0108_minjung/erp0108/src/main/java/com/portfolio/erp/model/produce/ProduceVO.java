package com.portfolio.erp.model.produce;

public class ProduceVO {

	// 1. 공정과정 field
	private int prodId;				// PK
	private String prodDocNumFk;	// 문서번호 (계약서와 조인할때 사용됨)
	private String prodPName;		// 제품이름
	private String prodPUnit;		// 제품단위
	private String prodPAmount;		// 제품수량
	private String prodProcessName1;// 공정과정1 이름
	private String prodProcess1;	// 공정과정1 품질검사(default NULL)
	private String prodProcessName2;// 공정과정1 이름
	private String prodProcess2;	// 공정과정2 (default NULL)
	private String prodProcessName3;// 공정과정1 이름
	private String prodProcess3;	// 공정과정3 (default NULL)
	private String prodProcessName4;// 공정과정1 이름
	private String prodProcess4;	// 공정과정4 (default NULL)
	private String prodProcessName5;// 공정과정1 이름
	private String prodProcess5;	// 공정과정5 (default NULL)
	private String prodRelease;		// 출고완료 표시 (default N)
	private int prodProcessCnt;		// 공정이 몇까지 있는지
	
	// 1. 출고상품목록 field
	private String prodClientCompany;			// 거래처명
	private String prodClientResponsibility;	// 거래처 담당자 이름
	private String prodClientResCP;				// 거래처 담당자 연락처
	private String prodDepartmentName;			// 담당자 부서명
	private String prodPositionName;			// 담당자 직급명
	private String prodEmpName;					// 담당자 이름
	private String prodOrderDate;				// 발주일
	private String prodDueDate;					// 납기일
	
	// 2. setter, getter
	public int getProdId() {
		return prodId;
	}
	public String getProdClientResCP() {
		return prodClientResCP;
	}
	public void setProdClientResCP(String prodClientResCP) {
		this.prodClientResCP = prodClientResCP;
	}
	public String getProdClientResponsibility() {
		return prodClientResponsibility;
	}
	public void setProdClientResponsibility(String prodClientResponsibility) {
		this.prodClientResponsibility = prodClientResponsibility;
	}
	public String getProdClientCompany() {
		return prodClientCompany;
	}
	public void setProdClientCompany(String prodClientCompany) {
		this.prodClientCompany = prodClientCompany;
	}
	public String getProdDepartmentName() {
		return prodDepartmentName;
	}
	public void setProdDepartmentName(String prodDepartmentName) {
		this.prodDepartmentName = prodDepartmentName;
	}
	public String getProdPositionName() {
		return prodPositionName;
	}
	public void setProdPositionName(String prodPositionName) {
		this.prodPositionName = prodPositionName;
	}
	public String getProdEmpName() {
		return prodEmpName;
	}
	public void setProdEmpName(String prodEmpName) {
		this.prodEmpName = prodEmpName;
	}
	public String getProdOrderDate() {
		return prodOrderDate;
	}
	public void setProdOrderDate(String prodOrderDate) {
		this.prodOrderDate = prodOrderDate;
	}
	public String getProdDueDate() {
		return prodDueDate;
	}
	public void setProdDueDate(String prodDueDate) {
		this.prodDueDate = prodDueDate;
	}
	public String getProdProcessName1() {
		return prodProcessName1;
	}
	public void setProdProcessName1(String prodProcessName1) {
		this.prodProcessName1 = prodProcessName1;
	}
	public String getProdProcessName2() {
		return prodProcessName2;
	}
	public void setProdProcessName2(String prodProcessName2) {
		this.prodProcessName2 = prodProcessName2;
	}
	public String getProdProcessName3() {
		return prodProcessName3;
	}
	public void setProdProcessName3(String prodProcessName3) {
		this.prodProcessName3 = prodProcessName3;
	}
	public String getProdProcessName4() {
		return prodProcessName4;
	}
	public void setProdProcessName4(String prodProcessName4) {
		this.prodProcessName4 = prodProcessName4;
	}
	public String getProdProcessName5() {
		return prodProcessName5;
	}
	public void setProdProcessName5(String prodProcessName5) {
		this.prodProcessName5 = prodProcessName5;
	}
	public String getProdPUnit() {
		return prodPUnit;
	}
	public void setProdPUnit(String prodPUnit) {
		this.prodPUnit = prodPUnit;
	}
	public String getProdPAmount() {
		return prodPAmount;
	}
	public void setProdPAmount(String prodPAmount) {
		this.prodPAmount = prodPAmount;
	}
	public String getProdPName() {
		return prodPName;
	}
	public void setProdPName(String prodPName) {
		this.prodPName = prodPName;
	}
	public void setProdId(int prodId) {
		this.prodId = prodId;
	}
	public String getProdDocNumFk() {
		return prodDocNumFk;
	}
	public void setProdDocNumFk(String prodDocNumFk) {
		this.prodDocNumFk = prodDocNumFk;
	}
	public String getProdProcess1() {
		return prodProcess1;
	}
	public void setProdProcess1(String prodProcess1) {
		this.prodProcess1 = prodProcess1;
	}
	public String getProdProcess2() {
		return prodProcess2;
	}
	public void setProdProcess2(String prodProcess2) {
		this.prodProcess2 = prodProcess2;
	}
	public String getProdProcess3() {
		return prodProcess3;
	}
	public void setProdProcess3(String prodProcess3) {
		this.prodProcess3 = prodProcess3;
	}
	public String getProdProcess4() {
		return prodProcess4;
	}
	public void setProdProcess4(String prodProcess4) {
		this.prodProcess4 = prodProcess4;
	}
	public String getProdProcess5() {
		return prodProcess5;
	}
	public void setProdProcess5(String prodProcess5) {
		this.prodProcess5 = prodProcess5;
	}
	public String getProdRelease() {
		return prodRelease;
	}
	public void setProdRelease(String prodRelease) {
		this.prodRelease = prodRelease;
	}
	public int getProdProcessCnt() {
		return prodProcessCnt;
	}
	public void setProdProcessCnt(int prodProcessCnt) {
		this.prodProcessCnt = prodProcessCnt;
	}
}