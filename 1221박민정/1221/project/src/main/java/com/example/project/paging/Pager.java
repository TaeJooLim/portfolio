package com.example.project.paging;

public class Pager {
	// 페이징 알고리즘
	private int PAGE_SCALE = 5; //한 페이지 게시물 개수
	private int BLOCK_SCALE = 10; //현재 보여지는 페이지 번호 개수

	private int curPage; //클릭했을 때 현재 페이지
	private int prevPage; //이전 페이지
	private int nextPage; //다음 페이지
	private int totPage;

	//한 블럭 이동할 때
	private int curBlock;
	private int prevBlock;
	private int nextBlock;
	private int totBlock;

	//맨 처음 또는 맨 뒤 페이지로 이동할 때
	private int pageBegin;
	private int pageEnd;
	
	//맨 처음 또는 맨 뒤 블록으로 이동할 때
	private int blockBegin;
	private int blockEnd;
	
	//페이지 생성자
	public Pager(int count, int curPage) {
		//this 현재페이지, super 부모
		//this(), super()
		this.curPage = curPage;
		curBlock = 1;
		
		setTotPage(count);
		setTotBlock();
		
		setPageRange(curPage);
		setBlockRange();
	}
	
	public int getPAGE_SCALE() {
		return PAGE_SCALE;
	}
	public void setPAGE_SCALE(int pAGE_SCALE) {
		PAGE_SCALE = pAGE_SCALE;
	}
	public int getBLOCK_SCALE() {
		return BLOCK_SCALE;
	}
	public void setBLOCK_SCALE(int bLOCK_SCALE) {
		BLOCK_SCALE = bLOCK_SCALE;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
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
	public int getTotPage() {
		return totPage;
	}
	public void setTotPage(int count) {
		//ceil : 강제로 반올림. *1.0 은 정수로 만들려는 것
		totPage = (int) Math.ceil(count * 1.0 / PAGE_SCALE);
	}
	public int getCurBlock() {
		return curBlock;
	}
	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}
	public int getPrevBlock() {
		return prevBlock;
	}
	public void setPrevBlock(int prevBlock) {
		this.prevBlock = prevBlock;
	}
	public int getNextBlock() {
		return nextBlock;
	}
	public void setNextBlock(int nextBlock) {
		this.nextBlock = nextBlock;
	}
	public int getTotBlock() {
		return totBlock;
	}
	public void setTotBlock(int totBlock) {
		this.totBlock = totBlock;
	}
	public int getPageBegin() {
		return pageBegin;
	}
	public void setPageBegin(int pageBegin) {
		this.pageBegin = pageBegin;
	}
	public int getPageEnd() {
		return pageEnd;
	}
	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}
	public int getBlockBegin() {
		return blockBegin;
	}
	public void setBlockBegin(int blockBegin) {
		this.blockBegin = blockBegin;
	}
	public int getBlockEnd() {
		return blockEnd;
	}
	public void setBlockEnd(int blockEnd) {
		this.blockEnd = blockEnd;
	}
	
	
	public void setTotBlock() {
		totBlock = (int) Math.ceil(totPage / BLOCK_SCALE);
	}
	
	public void setPageRange(int curPage) {
		pageBegin	= (curPage - 1) * PAGE_SCALE;
		pageEnd		= (int) ( Math.ceil( curPage / (double) PAGE_SCALE) * PAGE_SCALE );
	}
	
	public void setBlockRange() {
		// 0이 나오지 않도록 +1
		curBlock	=  (int) Math.ceil( (curPage - 1) / BLOCK_SCALE ) + 1;
		blockBegin	= (curBlock - 1) * BLOCK_SCALE + 1;
		blockEnd	= blockBegin + BLOCK_SCALE + 1;
		
		if( blockEnd > totPage ) blockEnd = totPage; //분기
		
		// 조건문 ? 참 : 거짓;
		prevPage = ( curPage == 1 ) ? 1 : (curPage - 1) * BLOCK_SCALE ;
		nextPage = curBlock > totBlock ? (curBlock * BLOCK_SCALE) : (curBlock * BLOCK_SCALE) + 1 ;
		
		if ( nextPage >= totPage ) nextPage = totPage ;
	}
}
