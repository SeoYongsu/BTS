package kr.pb.bts.domain;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class BookOrder {
	
	// Book_order 테이블 컬럼
	private int boNo;
	private int boUser;
	private int boBook;
	private String boDate;
	private int boPrice;
	private int boOrdercount;
	private String boCheck;
	private String boAddr;
	private String boConfirm;
	private String boName;
	private String boPhone;
	
	// [이희승] 추가변수
	private int biNo;			// 책 번호
	private String biGenre;	// 책 장르
	private String biTitle;		// 책 제목
	private String biWriter;	// 책 저자
	private String biInfo;		// 책 정보(줄거리, 소개 등)
	private Date biDate;		// 책 출판일
	private String biPub;		// 책 출판사
	private int biPrice;			// 책 정가
	private String biImg;		// 책 이미지		
	
	private int mNo;
	private String mName;
	private String mId;
	private String mEmail;
	private String mPhone;
	private String mAddr;
	
	private int bmNo;
	private int bmHave;
	private int bmCount;
	private int bmSale;
	private int bmHit;
	
	private int brRno;
	private int brMno;
	private int brSco;
	private String brRe;
	private Date brDate;
		
	//추가적인 로직으로 인해 필요한 파라메터 등
	private String mAddr1; // 우편번호
	private String mAddr2; // 지번(도로명)주소
	private String mAddr3; // 상세주소
	
	private String mPhone1; // 핸드폰 앞
	private String mPhone2; // 핸드폰 중간
	private String mPhone3; // 핸드폰 뒤	
	
	// Getter, Setter
	public int getBoNo() {
		return boNo;
	}
	public void setBoNo(int boNo) {
		this.boNo = boNo;
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
	public String getBoDate() {
		return boDate;
	}
	public void setBoDate(String boDate) {
		this.boDate = boDate;
	}
	public int getBoPrice() {
		return boPrice;
	}
	public void setBoPrice(int boPrice) {
		this.boPrice = boPrice;
	}
	public int getBoOrdercount() {
		return boOrdercount;
	}
	public void setBoOrdercount(int boOrdercount) {
		this.boOrdercount = boOrdercount;
	}
	public String getBoCheck() {
		return boCheck;
	}
	public void setBoCheck(String boCheck) {
		this.boCheck = boCheck;
	}
	public String getBoAddr() {
		return boAddr;
	}
	public void setBoAddr(String boAddr) {
		this.boAddr = boAddr;
	}
	public String getBoConfirm() {
		return boConfirm;
	}
	public void setBoConfirm(String boConfirm) {
		this.boConfirm = boConfirm;
	}
	public String getBoName() {
		return boName;
	}
	public void setBoName(String boName) {
		this.boName = boName;
	}
	public String getBoPhone() {
		return boPhone;
	}
	public void setBoPhone(String boPhone) {
		this.boPhone = boPhone;
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
	public int getBiSalPrice() {//할인반영한 금액 가져오기
		int salPrice=biPrice-(biPrice*bmSale/100);
		return salPrice;
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
	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmEmail() {
		return mEmail;
	}
	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}
	public String getmPhone() {
		return mPhone;
	}
	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}
	public String getmAddr() {
		return mAddr;
	}
	public void setmAddr(String mAddr) {
		this.mAddr = mAddr;
	}
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
	public int getBrRno() {
		return brRno;
	}
	public void setBrRno(int brRno) {
		this.brRno = brRno;
	}
	public int getBrMno() {
		return brMno;
	}
	public void setBrMno(int brMno) {
		this.brMno = brMno;
	}
	public int getBrSco() {
		return brSco;
	}
	public void setBrSco(int brSco) {
		this.brSco = brSco;
	}
	public String getBrReBr() {
		//리뷰 띄어쓰기 뷰 처리
		String result=null;
		if(brRe!=null && brRe.length()!=0) {//데이터가 존재할때
			result=brRe.replaceAll("\r\n", "<br/>");
		}
		return result;
	}
	public String getBrRe() {
		//리뷰 수정할때 br태그 다시 바꿔서 가져오기
		String result=null;
		if(brRe!=null && brRe.length()!=0) {//데이터가 존재할때
			result=brRe.replaceAll("<br/>","\r\n");
		}
		return result;
	}
	public void setBrRe(String brRe) {
		this.brRe = brRe;
	}
	public Date getBrDate() {
		return brDate;
	}
	public void setBrDate(Date brDate) {
		this.brDate = brDate;
	}
	public String getmAddr1() {
		return mAddr1;
	}
	public void setmAddr1(String mAddr1) {
		this.mAddr1 = mAddr1;
	}
	public String getmAddr2() {
		return mAddr2;
	}
	public void setmAddr2(String mAddr2) {
		this.mAddr2 = mAddr2;
	}
	public String getmAddr3() {
		return mAddr3;
	}
	public void setmAddr3(String mAddr3) {
		this.mAddr3 = mAddr3;
	}
	public String getmPhone1() {
		return mPhone1;
	}
	public void setmPhone1(String mPhone1) {
		this.mPhone1 = mPhone1;
	}
	public String getmPhone2() {
		return mPhone2;
	}
	public void setmPhone2(String mPhone2) {
		this.mPhone2 = mPhone2;
	}
	public String getmPhone3() {
		return mPhone3;
	}
	public void setmPhone3(String mPhone3) {
		this.mPhone3 = mPhone3;
	}
	
	public String getStrDate() {
		 String temp = this.boDate.substring(0, 11);
		return temp;
	}
	
	
}
