package kr.pb.bts.domain;

import java.util.Date;

// 책 정보 DTO 클래스
public class BookInfo {
	
	// Book_inf 테이블 컬럼
	private int biNo;			// 책 번호
	private String biGenre;		// 책 장르
	private String biTitle;		// 책 제목
	private String biWriter;	// 책 저자
	private String biInfo;		// 책 정보(줄거리, 소개 등)
	private Date biDate;		// 책 출판일
	private String biPub;		// 책 출판사
	private int biPrice;		// 책 정가
	private String biImg;		// 책 이미지
	private String viUse;		// 책 판매여부
	private double avg;			//책 평점
	
	
	// [이정현] 추가 변수
	private int count;	
	
	// [서용수] 추가 변수
	private int boUser;		// 추천도서에서 사용할 유저의 id값
	private int boBook;
	private String searchValue;		// 검색 값
	
	//현제 시간
	private Date now;
	
	//페이징 처리
	private int nowPage;			// 현제페이지
	private int totalCnt;		// 전체 레코드수
	private int startPage;		//시작페이지
	private int endPage;		//마지막페이지
	
	
	

	public Date getNow() {
		return now;
	}
	public void setNow(Date now) {
		this.now = now;
	}
	public double getAvg() {
		return avg;
	}
	public void setAvg(double avg) {
		this.avg = avg;
	}
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getBiNo() {
		return biNo;
	}
	public void setBiNo(int biNo) {
		this.biNo = biNo;
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
	public String getBiWriter() {
		return biWriter;
	}
	public void setBiWriter(String biWriter) {
		this.biWriter = biWriter;
	}
	public String getBiInfo() {
		return biInfo;
	}
	public void setBiInfo(String biInfo) {
		this.biInfo = biInfo;
	}
	public Date getBiDate() {
		return biDate;
	}
	public void setBiDate(Date biDate) {
		this.biDate = biDate;
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
	public String getBiImg() {
		return biImg;
	}
	public void setBiImg(String biImg) {
		this.biImg = biImg;
	}
	public String getViUse() {
		return viUse;
	}
	public void setViUse(String viUse) {
		this.viUse = viUse;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getBoUser() {
		return boUser;
	}
	public void setBoUser(int boUser) {
		this.boUser = boUser;
	}
	public int getBoBook() {
		return boBook;
	}
	public void setBoBook(int boBook) {
		this.boBook = boBook;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	public int getNowPage() {
		return nowPage;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
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
	

	
	

}
