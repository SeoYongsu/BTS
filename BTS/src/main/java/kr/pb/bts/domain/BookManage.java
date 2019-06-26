package kr.pb.bts.domain;

public class BookManage {

	// Book_Manage 테이블 기본컬럼
	private int bmNo;		// 책 번호
	private int bmHave;		// 책 수량
	private int bmCount;	// 책 누적판매량
	private int bmSale;		// 책 할인율
	private int bmHit;		// 책 조회수
	private String bmUse;	// 책 [추천도서]노출여부
	
	
	// [이정현] 추가변수
	private String biGenre;		// 책 장르
	private String biWriter;	// 책 저자
	private String biTitle;		// 책 제목
	private String biInfo;		// 책 정보
	private String biPub;		// 책 출판사
	private String biUse;		// 책 판매여부
	private int biPrice;			// 책 정가
	private String nowPage;	// 현제페이지
	private String totalCnt;		// 전체 레코드수
	private String category;	//	검색분류 기준컬럼
	private String searchValue;		// 검색 값
	
	
	
	// Getter / Setter
	public int getBmNo() {
		return bmNo;
	}
	public void setBmNo(int bmNo) {
		this.bmNo = bmNo;
	}
	public int getBmHave() {
		return bmHave;
	}
	public void setBmHave(int bmHave) {
		this.bmHave = bmHave;
	}
	public int getBmCount() {
		return bmCount;
	}
	public void setBmCount(int bmCount) {
		this.bmCount = bmCount;
	}
	public int getBmSale() {
		return bmSale;
	}
	public void setBmSale(int bmSale) {
		this.bmSale = bmSale;
	}
	public int getBmHit() {
		return bmHit;
	}
	public void setBmHit(int bmHit) {
		this.bmHit = bmHit;
	}
	public String getBmUse() {
		return bmUse;
	}
	public void setBmUse(String bmUse) {
		this.bmUse = bmUse;
	}
	public String getBiGenre() {
		return biGenre;
	}
	public void setBiGenre(String biGenre) {
		this.biGenre = biGenre;
	}
	public String getBiTitle() {
		return biTitle;
	}
	public void setBiTitle(String biTitle) {
		this.biTitle = biTitle;
	}
	public String getBiInfo() {
		return biInfo;
	}
	public void setBiInfo(String biInfo) {
		this.biInfo = biInfo;
	}
	public String getBiPub() {
		return biPub;
	}
	public void setBiPub(String biPub) {
		this.biPub = biPub;
	}
	public int getBiPrice() {
		return biPrice;
	}
	public void setBiPrice(int biPrice) {
		this.biPrice = biPrice;
	}
	public String getBiUse() {
		return biUse;
	}
	public void setBiUse(String biUse) {
		this.biUse = biUse;
	}
	public String getBiWriter() {
		return biWriter;
	}
	public void setBiWriter(String biWriter) {
		this.biWriter = biWriter;
	}
	public String getNowPage() {
		return nowPage;
	}
	public void setNowPage(String nowPage) {
		this.nowPage = nowPage;
	}
	public String getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(String totalCnt) {
		this.totalCnt = totalCnt;
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
	
}
