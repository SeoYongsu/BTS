<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
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
	});
	
	// 페이징처리
	$(function(){
		var totalCount = "${page.totalCnt}";
		var nowPage = "${page.nowPage}";
		var page = new Page('page', totalCount, 10, 10, nowPage);
		page.setFunc("buyListPage");
		page.regPaging();
	});
	
	// 페이지이동
	var category = "${page.category}";
	var searchValue = "${page.searchValue}"
	function buyListPage(pageNum){
		window.location.href = "${pageContext.request.contextPath}/member/buyList.web?&nowPage="+pageNum;			
	}
</script>

</head>
<body>
	<%-- 목록 보여주기 --%>
	<br>
	<div class="container">
 	<table class="table" >
 		<thead class="thead-dark">
	 		<tr>
	 			<th scope="col">책번호</th>
	 			<th scope="col">주문일</th>
	 			<th scope="col">가격</th>
	 			<th scope="col">주문수량</th>
	 			<!-- <th scope="col">구매확정여부</th> -->
	 			<th scope="col">주소</th>
	 			<th scope="col">결제확정일</th>
	 			<th scope="col">배송받는 사람 이름</th>
	 			<th scope="col">배송받는 사람 연락처</th>
	 		</tr>
 		</thead>
 		
 		<tbody>
	 		<c:if test="${not empty BUYLIST}">
	 		<c:forEach items="${BUYLIST}" var="list">
				<tr>
					<td><a href="${pageContext.request.contextPath}/order/detail.web?biNo=${list.boBook}">${list.boBook }</a></td>
					<td>${list.strDate }</td>
					<td>	${list.boPrice }</td>
					<td>${list.boOrdercount }</td>
					
					<%-- <td>${list.boCheck }</td> --%>
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
			
			<c:if test="${empty BUYLIST}">
				<tr>
					<td colspan="9">구매내역이 존재하지 않습니다</td>
				</tr>
			</c:if>
		</tbody>
 	</table>
 	</div>
 	
</body>
</html>