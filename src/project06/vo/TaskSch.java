package project06.vo;
// springweb.a03_mvc.a04_vo.BoardSch
public class TaskSch {
	// 검색과 페이징 처리를 위한 Vo 객체..
	// 1. 검색(제목과 작성자)
	private String tname;
	private String writer;
	private int pno;
	private int mno;
	private int mdiv;
	// 2. 페이징 처리.
	private int count; // 총데이터 건수.
	private int pageSize; // 한번에 보여줄 페이지 크기..
	private int pageCount; // 총 페이지 수. count/pageSize
	private int curPage; // 클릭한 현재 페이지번호
	private int start; // 페이지의 시작 번호
	private int end;  // 페이지의 마지막 번호
	// 3. 블럭 처리.
	private int blocksize; // 한번에 보여줄 block의 크기.
	private int startBlock;
	private int endBlock;
	 
	
	public int getMdiv() {
		return mdiv;
	}
	public void setMdiv(int mdiv) {
		this.mdiv = mdiv;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getBlocksize() {
		return blocksize;
	}
	public void setBlocksize(int blocksize) {
		this.blocksize = blocksize;
	}
	public int getStartBlock() {
		return startBlock;
	}
	public void setStartBlock(int startBlock) {
		this.startBlock = startBlock;
	}
	public int getEndBlock() {
		return endBlock;
	}
	public void setEndBlock(int endBlock) {
		this.endBlock = endBlock;
	}
	
	
	
	
	
}
