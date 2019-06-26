<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
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
	});
	
	// 페이징처리
	$(function(){
		var totalCount = "${page.totalCnt}";
		var nowPage = "${page.nowPage}";
		var page = new Page('page', totalCount, 10, 10, nowPage);
		page.setFunc("memberListPage");
		page.regPaging();
	});
	
	// 페이지이동
	var category = "${page.category}";
	var searchValue = "${page.searchValue}"
	function memberListPage(pageNum){
		if(category == "" || category == null){
			window.location.href = "${pageContext.request.contextPath}/member/memberList.web?&nowPage="+pageNum;			
		}else{
			window.location.href = "${pageContext.request.contextPath}/member/memberList.web?category="+category+"&searchValue="+searchValue+"&nowPage="+pageNum;
		}
	}
	
	/* 유저 검색 페이지 */
	function memberSearch(){
		var category = $("#category_selector option:selected").val();
		var searchValue = $("#searchValue").val();
		window.location.href = "${pageContext.request.contextPath}/member/memberList.web?category="+category+"&searchValue="+searchValue;
	}
</script>
</head>
<body>

   	<br>
	<div style="margin: 30px;'">
	<form class="form-inline my-2 my-lg-0" method="GET" id="sFrm">
	   	<%-- 검색 관련내용 --%>
	   	<table style="margin-bottom: 10px;">
	    	<tr>
	     		<td>
	      		<%-- 검색대상 --%>
	      		<select class="form-control"  name="category_selector" id="category_selector">
		       		<option value="userName" selected="selected">이름</option>
		       		<option value="userId">아이디</option>
		       		<option value="userPhone">연락처</option>
	      		</select>
	      		<%-- 검색단어 --%>
	      		<input class="form-control mr-sm-2"  type="text" name="searchValue" id="searchValue" placeholder="회원검색">
	      		<%-- 검색버튼 --%>
	      		<button class="btn btn-warning" type="button" onclick="memberSearch();">검색</button>
	      		<%--  --%>
	     		</td>
	    	</tr>
	 	</table>
  	</form>
  	
	<%-- 회원리스트 보여주기 --%>
 	<table class="table" >
 		<thead class="thead-dark">
	 		<tr>
	 			<th>회원 이름</th>
	 			<th>회원 아이디</th>
	 			<th>회원 연락처</th>
	 			<th>회원 주소</th>
	 			<th>회원 가입일</th>
	 			<th>회원 생년월일</th>
	 			<th>사용여부</th>
	 		</tr>
	 	</thead>
 		
 		<tbody>
	 		<c:if test="${not empty MEMBERLIST}">
	 		<c:forEach items="${MEMBERLIST}" var="list">
				<tr>
					<td><a href="../member/memberDetail.web?userNo=${list.mNo}">${list.mName }</a></td>
					<td>${list.mId }</td>
					<td>${list.mPhone }</td>
					<td>${list.mAddr }</td>
					<td>${list.mJoindate }</td>
					<td>${list.mBirth }</td>
					<td>${list.mUse }</td>
				</tr>
			</c:forEach>
			</c:if>
			
			<c:if test="${page.totalCnt > 10}">
			<tr>
				<td colspan="4"><ul id="page"><li>100<li></ul></td>
			</tr>
			</c:if>
			
			<c:if test="${empty MEMBERLIST}">
				<tr>
					<td>회원이 존재하지 않습니다</td>
					<td>회원이 존재하지 않습니다</td>
					<td>회원이 존재하지 않습니다</td>
					<td>회원이 존재하지 않습니다</td>
					<td>회원이 존재하지 않습니다</td>
				</tr>
			</c:if>
		</tbody>
 	</table>
 	</div>
</body>
</html>