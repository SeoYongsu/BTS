package kr.pb.bts.domain;

import java.util.Date;

public class BookReview {

	// Book_review 컬럼
	private int brRno;
	private int brMno;
	private int brSco;
	private String brRe;
	private Date brDate;
	private String brUse;
	
	// Getter, Setter
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
	public String getBrRe() {
		return brRe;
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
	public String getBrUse() {
		return brUse;
	}
	public void setBrUse(String brUse) {
		this.brUse = brUse;
	}
	
	
}
