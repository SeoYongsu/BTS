<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<meta charset="EUC-KR">
<title>Insert title here</title>

<style>

#page {
	list-style:none;
	display:inline;
}

#page li{	
	margin:10px;
    float: left;
}

#page li a {
	float:left;
	padding:4px;
	margin-right:3px;
	width:15px;
	text-align:center;
	text-decoration:none;
}

</style>

<script type="text/javascript">
	$(document).ready(function() {
	   	// 검색 버튼 관련내용
	   	$("#sBtn").click(function(){
	    	/* alert("검색 버튼"); */
		    // 무결성검사
	    	$("#sFrm").submit();
	  	 });
	   	
	   	$("#category_selector").on("change", function(){
	   		var item = $("#category_selector option:selected").val();
	   		console.log(item);
	   		if(item == 'userDate'){
	   			$("#searchValue").css("display", "none");
	   			$("#orderDay").css("display", "inline");
	   		}else{
	   			$("#searchValue").css("display", "inline");
	   			$("#orderDay").css("display", "none");
	   		}
	   	})
	   	
	});
	
	// 페이징처리
	$(function(){
		var totalCount = "${page.totalCnt}";
		var nowPage = "${page.nowPage}";
		var page = new Page('page', totalCount, 10, 10, nowPage);
		page.setFunc("orderListPage");
		page.regPaging();
	});
	
	// 페이지이동
	var category = "${page.category}";
	var searchValue = "${page.searchValue}"
	function orderListPage(pageNum){
		if(category == "" || category == null){
			window.location.href = "${pageContext.request.contextPath}/member/orderList.web?&nowPage="+pageNum;			
		}else{
			window.location.href = "${pageContext.request.contextPath}/member/orderList.web?category="+category+"&searchValue="+searchValue+"&nowPage="+pageNum;
		}
	}
	
	/* 유저 검색 페이지 */
	function orderSearch(){
		var category = $("#category_selector option:selected").val();
		if(category != "userDate") {
			var searchValue = $("#searchValue").val();
		}
		else {
			var searchValue = $("#orderDay").val();
		}
		console.log(searchValue);
		window.location.href = "${pageContext.request.contextPath}/member/orderList.web?category="+category+"&searchValue="+searchValue;
	}
	
	$( function() {
	    $( "#orderDay" ).datepicker({
	    	dateFormat: 'yy-mm-dd'
	    });
	});
</script>

</head>
<body>
	<br>
	<div style="margin: 30px;'">
	<form class="form-inline my-2 my-lg-0" method="GET" id="sFrm" >
	   	<%-- 검색 관련내용 --%>
	   	<table style="margin-bottom: 10px;">
	    	<tr>
	     		<td>
		      		<%-- 검색대상 --%>
		      		<select class="form-control" name="category_selector" id="category_selector">
			       		<option value="userNo" selected="selected">회원번호</option>
			       		<option value="orderNo">주문번호</option>
			       		<option value="userName">배송받는사람</option>
			       		<option value="userPhone">배송받는사람 연락처</option>
			       		<option value="userDate">주문일</option>
		      		</select>
		      		<%-- 검색단어 --%>
		      		<input class="form-control mr-sm-2 " type="text" name="searchValue" id="searchValue" placeholder="주문검색" autocomplete="off">
		      		<input class="form-control mr-sm-2 " type="text" name="searchValue" id="orderDay" 
		      		placeholder="주문검색" autocomplete="off" style="display: none;">

		      		<%-- 검색버튼 --%>
		      		<button class="btn btn-warning" type="button" onclick="orderSearch();">검색</button>
		      		<%--  --%>
	     		</td>
	    	</tr>
	 	</table>
  	</form>
	<%-- 목록 보여주기 --%>
 	<table class="table" >
 		<thead class="thead-dark">
	 		<tr>
	 			<th>주문번호</th>
	 			<th>회원이름</th>
	 			<th>책이름</th>
	 			<th>주문일</th>
	 			<th>가격</th>
	 			<th>주문수량</th>
	 			
	 			<th>구매확정여부</th>
	 			<th>주소</th>
	 			<th>결제확정일</th>
	 			<th>배송자 이름</th>
	 			<th>연락처</th>
	 		</tr>
 		</thead>
 		
 		<tbody>
	 		<c:if test="${not empty ORDERLIST}">
	 		<c:forEach items="${ORDERLIST}" var="list">
				<tr>
					<td>${list.boNo }</td>
					<%-- <td><a href="../member/memberDetail.web?userNo=${list.boUser}">${list.boUser }</a></td> --%>
					<td><a href="../member/memberDetail.web?userNo=${list.boUser}">${list.mName }</a></td>
					<%-- <td><a href="${pageContext.request.contextPath}/order/detail.web?biNo=${list.boBook}">${list.boBook }</a></td> --%>
					<td><a href="${pageContext.request.contextPath}/order/detail.web?biNo=${list.boBook}">${list.biTitle }</a></td>
					<td>${list.strDate }</td>
					<td>	${list.boPrice }</td>
					<td>${list.boOrdercount }</td>
					
					<td>${list.boCheck }</td>
					<td>${list.boAddr }</td>
					<td>${list.boConfirm }</td>
					<td>${list.boName }</td>
					<td>${list.boPhone }</td>
				</tr>
			</c:forEach>
			</c:if>
			
			<c:if test="${page.totalCnt > 10}">
			<tr>
				<td colspan="4"><ul id="page"><li>100<li></ul></td>
			</tr>
			</c:if>
			
			<c:if test="${empty ORDERLIST}">
				<tr>
						<td>구매내역없음</td>
						<td>구매내역없음</td>
						<td>구매내역없음</td>
						<td>구매내역없음</td>
						<td>구매내역없음</td>
						
						<td>구매내역없음</td>
						<td>구매내역없음</td>
						<td>구매내역없음</td>
						<td>구매내역없음</td>
						<td>구매내역없음</td>
					</tr>
			</c:if>
		</tbody>
 	</table>
 	</div>
</body>
</html>