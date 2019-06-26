/*
	page.js
	ver 1.0
	Kim Tae Woong
	
	ver 1.75
	Lee Jeong Hyun
*/

var _html; 					// html 코드
var obj; 					// dom 
var firstPageNum; 		// 기준 페이지
var temp					// maxPage - firstPage 계산용
var residual				// firstPage + temp 계산용
var tenPage				// firstPage+9 (10페이지씩 뿌리기로 했을경우)

var Page = function(id, totalCnt, recordCnt, pageCnt, nowPage){

	this.totalCnt = parseInt(totalCnt); 			// 전체 레코드 수
	this.recordCnt = parseInt(recordCnt); 		// 한 페이지에 보여 줄 레코드 수
	this.pageCnt = parseInt(pageCnt);			// 표현하고 싶은 페이지 수
	this.cnt = this.pageCnt; 						// 변동될 수 있는 페이지 수 
	this.nowPage = parseInt(nowPage); 		// 현재 페이지 [ 생략가능 ]
	this.id = id; 										// ul tag id
	this.func = "";									// user setting func
	this.maxPage = ""								// maxPage
	
	if(this.totalCnt%this.recordCnt==0){
		this.maxPage = this.totalCnt/this.recordCnt;
	}else{
		this.maxPage =  parseInt(this.totalCnt/this.recordCnt)+1;
	}
	
	if(this.nowPage == null || this.nowPage == undefined || this.nowPage < 1){
		this.nowPage = 1;
	}

}


// 페이지 이동함수 같은거 집어넣으면됨
Page.prototype.setFunc = function(func){
	this.func = func;
}


// 페이징 생성
Page.prototype.regPaging = function(){
	this.calcPageCnt();
	this.drawPage();
}

// Cnt 계산
Page.prototype.calcPageCnt = function(){

	if(this.nowPage <= this.pageCnt){

		// (전체) 페이지가 설정한 표시페이지(* 10페이지) 이하 일 경우
		if( this.totalCnt / this.recordCnt < this.pageCnt ){
			// 보여줄페이지가 10개로 설정 후, 전체 페이지가 10페이지가 안될 경우 마지막페이지 지정
			console.log("여기로 진입");
			this.cnt = calcCeil(this.totalCnt / this.recordCnt);
			console.log(this.cnt);
		}
		
		firstPageNum = 1; // 첫 페이지이므로

	}else{

		firstPageNum = calcCeil(this.nowPage/this.pageCnt)*10-9;

		temp = this.maxPage - firstPageNum;
		residual = firstPageNum+temp;
		tenPage = firstPageNum+this.pageCnt-1;
		
		if(tenPage<=residual){
			console.log("if 1");
			this.cnt = this.pageCnt;
		}else if(tenPage > this.maxPage){
			console.log("if 2");
			this.cnt = this.pageCnt-(tenPage-this.maxPage);
		}

	}	
	return firstPageNum;
}

// html draw
Page.prototype.drawPage = function(){
	console.log(firstPageNum);
	console.log(this.cnt);
	obj = document.getElementById(this.id);

	// 이전페이지
	if(this.nowPage <= this.pageCnt){
		_html = '<li><a>&#60;</a></li>';
	}else{
		_html = '<li><a href="javascript:'+this.func+'('+ (firstPageNum-1) +');">&#60;</a></li>';
	}
	
	for(var i = 0; i < this.cnt; i++){
		_html = _html + '<li><a href="javascript:'+this.func+'('+ (firstPageNum+i) +');">' + (firstPageNum+i) + '</a></li>';		
	}

	// 다음페이지
	if(this.nowPage == this.maxPage){
		_html = _html + '<li><a>&#62;</a></li>'; 
	}else{
		_html = _html + '<li><a href="javascript:'+this.func+'('+ (firstPageNum+this.pageCnt) +');">&#62;</a></li>'; 
	}


	obj.innerHTML = _html;
	obj.getElementsByTagName('a')[this.nowPage].classList.toggle('on', true);

	return this.nowPage-(firstPageNum-1);
}


function calcCeil(num){
	return Math.ceil(num);
}