package com.portfolio.erp.model.product;

public class ProductVO {

	// 1. field
	private int pId;			// PK
	
	private String pType;		// 대분류 ( select value=값들 / 제품(A), 원자재(B), 상품(C) )
	private String pName;		// 품명
	private String pCode;		// 품목코드( p_대분류 +  p_소분류 + p_id(pk) 자동생성 )
	private String pBrand;		// 제조사
	private String pGroup;		// 상품그룹명 ( select value=값들 / 컴퓨터(01), 전자기기(02), 스마트폰(03), 사무용품(04) )
	private String pModelnum;	// 상품의 모델번호 ( 최소 5자 이상 입력 )
	private String pUnit;		// 기준단위 ( select값 그대로 영어로 저장 / EA, KG, SET )
	private String pSize;		// 규격
	private String pCurrency;	// 통화 ( KRW(1), USD(2) )

	private int pBuy;			// 입고단가
	private int pSell;			// 판매단가
	private int pTax;			// 부가세 ( 무조건 가격의 10%로 적용 )
	private String pTaxuse;		// 부가세적용 ( input="radio" value="값" / Y,N )
	private String pNote;		// 비고
	
	private int accountIdFk;		// 거래처의 pk를 fk로 저장하여 조인
	private String clientCompany;	// 조인을 통해서 받은 거래처명을 저장

	private int ref;			// 상품코드 중복생성 방지
	
	
	// 공정별 소요자재(BOM) field
	private int pmAmount;		// 원자재 수량
	private int pIdFk;		// 제품의 pk를 fk로 저장하여 조인
	private int pmIdFk;		// 원자재의 pk를 fk로 저장하여 조인

	// 2. setter, getter
	
	public int getpId() {
		return pId;
	}

	public int getpIdFk() {
		return pIdFk;
	}

	public void setpIdFk(int pIdFk) {
		this.pIdFk = pIdFk;
	}

	public int getPmIdFk() {
		return pmIdFk;
	}

	public void setPmIdFk(int pmIdFk) {
		this.pmIdFk = pmIdFk;
	}

	public int getPmAmount() {
		return pmAmount;
	}

	public void setPmAmount(int pmAmount) {
		this.pmAmount = pmAmount;
	}

	public String getClientCompany() {
		return clientCompany;
	}

	public void setClientCompany(String clientCompany) {
		this.clientCompany = clientCompany;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public String getpType() {
		return pType;
	}

	public void setpType(String pType) {
		this.pType = pType;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpCode() {
		return pCode;
	}

	public void setpCode(String pCode) {
		this.pCode = pCode;
	}

	public String getpBrand() {
		return pBrand;
	}

	public void setpBrand(String pBrand) {
		this.pBrand = pBrand;
	}

	public String getpGroup() {
		return pGroup;
	}

	public void setpGroup(String pGroup) {
		this.pGroup = pGroup;
	}

	public String getpModelnum() {
		return pModelnum;
	}

	public void setpModelnum(String pModelnum) {
		this.pModelnum = pModelnum;
	}

	public String getpUnit() {
		return pUnit;
	}

	public void setpUnit(String pUnit) {
		this.pUnit = pUnit;
	}

	public String getpSize() {
		return pSize;
	}

	public void setpSize(String pSize) {
		this.pSize = pSize;
	}

	public String getpCurrency() {
		return pCurrency;
	}

	public void setpCurrency(String pCurrency) {
		this.pCurrency = pCurrency;
	}

	public int getpBuy() {
		return pBuy;
	}

	public void setpBuy(int pBuy) {
		this.pBuy = pBuy;
	}

	public int getpSell() {
		return pSell;
	}

	public void setpSell(int pSell) {
		this.pSell = pSell;
	}

	public int getpTax() {
		return pTax;
	}

	public void setpTax(int pTax) {
		this.pTax = pTax;
	}

	public String getpTaxuse() {
		return pTaxuse;
	}

	public void setpTaxuse(String pTaxuse) {
		this.pTaxuse = pTaxuse;
	}

	public String getpNote() {
		return pNote;
	}

	public void setpNote(String pNote) {
		this.pNote = pNote;
	}

	public int getAccountIdFk() {
		return accountIdFk;
	}

	public void setAccountIdFk(int accountIdFk) {
		this.accountIdFk = accountIdFk;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}
	
}