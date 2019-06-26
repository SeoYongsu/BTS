package kr.pb.bts.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Help {
	
	
	// Member_Manage 테이블 기본 컬럼명
	private int mmNo;
	private String mmCode;
	private int mmUser;
	private String mmTitle;
	private String mmBody;
	private String mmUse;
	private String mmReTitle;
	private String mmReBody;
	private Date mmDate;
	
	
	// 이정현 추가변수
	private String nowPage;			// 현제페이지
	private String totalCnt;				// 전체 레코드수
	private String category;			//	검색분류 기준컬럼
	private String searchValue;		// 검색 값
	private String mName;
	
	
	
	// Getter, Setter
	public int getMmNo() {
		return mmNo;
	}
	public void setMmNo(int mmNo) {
		this.mmNo = mmNo;
	}
	public String getMmCode() {
		return mmCode;
	}
	public void setMmCode(String mmCode) {
		this.mmCode = mmCode;
	}
	public int getMmUser() {
		return mmUser;
	}
	public void setMmUser(int mmUser) {
		this.mmUser = mmUser;
	}
	public String getMmTitle() {
		return mmTitle;
	}
	public void setMmTitle(String mmTitle) {
		this.mmTitle = mmTitle;
	}
	public String getMmBody() {
		return mmBody;
	}
	public void setMmBody(String mmBody) {
		this.mmBody = mmBody;
	}
	public String getMmUse() {
		return mmUse;
	}
	public void setMmUse(String mmUse) {
		this.mmUse = mmUse;
	}
	public String getMmReTitle() {
		return mmReTitle;
	}
	public void setMmReTitle(String mmReTitle) {
		this.mmReTitle = mmReTitle;
	}
	public String getMmReBody() {
		return mmReBody;
	}
	public void setMmReBody(String mmReBody) {
		this.mmReBody = mmReBody;
	}
	public Date getMmDate() {
		return mmDate;
	}
	public void setMmDate(Date mmDate) {
		this.mmDate = mmDate;
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
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	
	// mySQL datetime 으로 들어온거 스트링으로 받는용도
	 public String getStrDate() { 
		 Date date = this.mmDate; 
		 SimpleDateFormat fm = new SimpleDateFormat("YYYY-MM-dd"); 
		 String strDate = fm.format(date); 
		 return strDate;
	 }
	
}
