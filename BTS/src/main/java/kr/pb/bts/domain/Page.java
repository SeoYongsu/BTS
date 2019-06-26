package kr.pb.bts.domain;

public class Page {

	// Page 처리를 위한 클래스
	private String pageCategory; 		// 페이지 카테고리(분류)
	private int nowPage;				// 현재페이지
	private int totalCnt;				// 전체카운트
	private int pageCnt;				// 페이지카운트
	private String category; 			// 페이지 카테고리(컬럼)
	private String searchValue;		// 검색값(벨류)
	
	// 유명기 추가변수
	private int no; // 번호
	

	//서용수 필요변수
	private String biGenre;
	
	
	public String getBiGenre() {
		return biGenre;
	}
	public void setBiGenre(String biGenre) {
		this.biGenre = biGenre;
	}
	// Getter, Setter
	public String getPageCategory() {
		return pageCategory;
	}
	public void setPageCategory(String pageCategory) {
		this.pageCategory = pageCategory;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	public int getPageCnt() {
		return pageCnt;
	}
	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	
	
}
