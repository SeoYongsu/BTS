package kr.pb.bts.domain;


public class Member {

	// Member 테이블 컬럼
	private int mNo;
	private String mName;
	private String mId;
	private String mPw;
	private String mMail;
	
	private String mPhone;
	private String mAddr;
	private int mGrade;
	private String mUse;
	private String mJoindate;
	
	private String mBirth;
	private String mSido;
	
	// [유명기] 추가 변수
	private String mAddr1; // 우편번호
	private String mAddr2; // 지번(도로명)주소
	private String mAddr3; // 상세주소
	private String mBirthyy; // 출생년도
	private String mBirthmm; // 월
	private String mBirthdd; // 일
	private String mPhone1; // 핸드폰 앞
	private String mPhone2; // 핸드폰 중간
	private String mPhone3; // 핸드폰 뒤
	private String category; // 검색 주제
	private String searchValue; // 검색 단어
	private String nowPage; // 현재페이지
	private String totalCnt; // 총 데이터의 개수
	
	
	// Getter, Setter
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
	public String getmPw() {
		return mPw;
	}
	public void setmPw(String mPw) {
		this.mPw = mPw;
	}
	public String getmMail() {
		return mMail;
	}
	public void setmMail(String mMail) {
		this.mMail = mMail;
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
	public int getmGrade() {
		return mGrade;
	}
	public void setmGrade(int mGrade) {
		this.mGrade = mGrade;
	}
	public String getmUse() {
		return mUse;
	}
	public void setmUse(String mUse) {
		this.mUse = mUse;
	}
	public String getmJoindate() {
		return mJoindate;
	}
	public void setmJoindate(String mJoindate) {
		this.mJoindate = mJoindate;
	}
	public String getmBirth() {
		return mBirth;
	}
	public void setmBirth(String mBirth) {
		this.mBirth = mBirth;
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
	public String getmBirthyy() {
		return mBirthyy;
	}
	public void setmBirthyy(String mBirthyy) {
		this.mBirthyy = mBirthyy;
	}
	public String getmBirthmm() {
		return mBirthmm;
	}
	public void setmBirthmm(String mBirthmm) {
		this.mBirthmm = mBirthmm;
	}
	public String getmBirthdd() {
		return mBirthdd;
	}
	public void setmBirthdd(String mBirthdd) {
		this.mBirthdd = mBirthdd;
	}
	public String getmSido() {
		return mSido;
	}
	public void setmSido(String mSido) {
		this.mSido = mSido;
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
	
	
	
}
