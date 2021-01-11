package com.portfolio.erp.model.paging;

public class PagingVO {

	private int pageSize = 10;	// 한 페이지당 게시글 수
    private int rangeSize = 10;	// 한 블럭(range)당 페이지 수
    
    private int curPage = 1;	// 현재 페이지 번호
    private int curRange = 1;	// 현재 블럭(range) 번호
    
    private int listCnt;		// 전체 게시글 수
    private int pageCnt;		// 전체 페이지 수
    private int rangeCnt;		// 전체 블럭(range) 수
    
    private int startIndex = 0;	// 시작 index
    
    private int startPage = 1;	// 시작 페이지
    private int endPage = 1;	// 끝 페이지
    
    private int prevPage;		// 이전 페이지
    private int nextPage; 		// 다음 페이지

    
    // 2. 생성자 (페이징 처리)
    public PagingVO(int listCnt, int curPage) {
    	/*
	         * 페이징 처리 순서
	         * 1. 총 페이지수
	         * 2. 총 블럭(range)수
	         * 3. range setting
         */
    	
    	// 1. 전체 게시물 수와 현재 페이지를 Controller로 부터 받아온다.
    	setCurPage(curPage);	// 현재페이지 setter에 입력
    	setListCnt(listCnt);	// 전체 게시물 수 setter에 입력
    	
    	// 2. 전체 게시물 수와 현재페이지 번호를 이용해서 페이징처리 메소드 작성
    	setPageCnt(listCnt);	// 전체 페이지 수
    	setRangeCnt(pageCnt);	// 전체 블럭의 수
    	rangeSetting(curPage);	// 블럭 셋팅
    	setStartIndex(curPage);	// DB에서 SELECT하는 리스트의 시작숫자
    }
    
    // 3. 페이징처리 setter, getter
	public void setPageCnt(int listCnt) {
		// 한 페이지에 들어가는 게시글의 수를 위에서 설정한 pageSize(예시_10개)로 나눠서 페이지의 갯수를 입력
		this.pageCnt = (int) Math.ceil(listCnt * 1.0/pageSize);
	}

	public void setRangeCnt(int pageCnt) {
		// 한 블럭(1~10 / 2~10)에 들어가는 페이지의 수를 위에서 설정한 rangeSize(예시_10개)로 나눠서 블럭의 갯수를 입력
		this.rangeCnt = (int) Math.ceil(pageCnt * 1.0/rangeSize);
	}
	
	public void rangeSetting(int curPage) {
		setCurPage(curPage);
		this.startPage = (curRange - 1) * rangeSize + 1;
		this.endPage = startPage + rangeSize - 1;
		
		if (endPage > pageCnt) {
			this.endPage = pageCnt;
		}
		this.prevPage = curPage - 1;
        this.nextPage = curPage + 1;
	}

	public void setCurRange(int curRange) {
		this.curRange = (int)((curPage - 1)/rangeSize) + 1;
	}

	public void setStartIndex(int curPage) {
		this.startIndex = (curPage - 1) * pageSize;
	}
	
	// 3. setter, getter
	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getRangeSize() {
		return rangeSize;
	}

	public void setRangeSize(int rangeSize) {
		this.rangeSize = rangeSize;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getCurRange() {
		return curRange;
	}

	public int getListCnt() {
		return listCnt;
	}

	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public int getRangeCnt() {
		return rangeCnt;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
}
