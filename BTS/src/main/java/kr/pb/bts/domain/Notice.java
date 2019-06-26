package kr.pb.bts.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Notice {
	
	// 공지사항 테이블 기본컬럼
	private int nNo;
	private String nWriter;
	private String nTitle;
	private String nBody;
	private Date nDate;
	private String nUse;
	private int nHit;
	
	// 이정현 추가변수
	private String nowPage;			// 현제페이지
	private String totalCnt;				// 전체 레코드수
	private String category;			//	검색분류 기준컬럼
	private String searchValue;		// 검색 값
	private String mName;
	
	
	
	public int getnNo() {
		return nNo;
	}
	public void setnNo(int nNo) {
		this.nNo = nNo;
	}
	public String getnWriter() {
		return nWriter;
	}
	public void setnWriter(String nWriter) {
		this.nWriter = nWriter;
	}
	public String getnTitle() {
		return nTitle;
	}
	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}
	public String getnBody() {
		return nBody;
	}
	public void setnBody(String nBody) {
		this.nBody = nBody;
	}
	public Date getnDate() {
		return nDate;
	}
	public void setnDate(Date nDate) {
		this.nDate = nDate;
	}
	public String getnUse() {
		return nUse;
	}
	public void setnUse(String nUse) {
		this.nUse = nUse;
	}
	public int getnHit() {
		return nHit;
	}
	public void setnHit(int nHit) {
		this.nHit = nHit;
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
	
	
	 public String getStrDate() { 
		 Date date = this.nDate; 
		 SimpleDateFormat fm = new SimpleDateFormat("YYYY-MM-dd"); 
		 String strDate = fm.format(date); 
		 return strDate;
	 }
	 

}
