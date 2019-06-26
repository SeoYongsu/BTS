<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">

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
<meta charset="UTF-8">
<title>리스트입니다</title>
<script type="text/javascript">
$(function(){
	var totalCount = "${totalCnt}";
	var nowPage = "${nowPage}";
	var page = new Page('page', totalCount, 10, 10, nowPage);

	page.setFunc("searchListPage");
	page.regPaging();
		
	
})
	/* 페이지 이동 도우미 */
	var searchValue = "${searchValue}";
	var biGenre = "${biGenre}";
	console.log(searchValue)
	console.log(biGenre)	
	function searchListPage(pageNum){
		
		if((biGenre == "" || biGenre == null) && (searchValue == "" || searchValue == null)){
			window.location.href = "${pageContext.request.contextPath}/BookList/best100.web?nowPage="+pageNum
		}
		
		
		else if((biGenre != "" || biGenre != null) && (searchValue == "" || searchValue == null)){
			window.location.href = "${pageContext.request.contextPath}/BookList/bookList.web?nowPage="+pageNum+"&biGenre="+biGenre;	
		
		}
		else if((biGenre == "" || biGenre == null) && (searchValue != "" || searchValue != null)){
			window.location.href = "${pageContext.request.contextPath}/BookList/searchList.web?nowPage="+pageNum+"&searchValue="+searchValue;
			
		}
		
		
	}


</script>

</head>
<body>

		<table border="1" align="center">
		
			<h1 align="center">
				<c:if test="${biGenre eq 'A0' }">
					베스트
				</c:if>
				<c:if test="${biGenre eq 'A1' }">
					소설
				</c:if>
				<c:if test="${biGenre eq 'A2' }">
					잡지
				</c:if>
				<c:if test="${biGenre eq 'A3' }">
					만화
				</c:if>
				<c:if test="${biGenre eq 'A4' }">
					종교
				</c:if>
				<c:if test="${biGenre eq 'A5' }">
					IT / 컴퓨터
				</c:if>
				<c:if test="${biGenre eq 'A6' }">
					취미
				</c:if>
				<c:if test="${biGenre eq 'A7' }">
					건강
				</c:if>
				<c:if test="${biGenre eq 'A8' }">
					청소년
				</c:if>
				<c:if test="${biGenre eq 'A9' }">
					예술
				</c:if>
				<c:if test="${biGenre eq 'A10' }">
					사회
				</c:if>
			</h1>
		
		<c:forEach items="${list }" var="item">
		<tr>
			<td>
				<a href="${pageContext.request.contextPath}/order/hit.web?biNo=${item.biNo }">
					<img src="${item.biImg }" alt="img" style="size: 25px;">
				</a>
			</td>

			<td>
				<a href="${pageContext.request.contextPath}/order/hit.web?biNo=${item.biNo }">
					${item.biTitle}
				</a>
				
				 <br/>
				${item.biWriter}<br/>
				<fmt:formatDate var="date" value="${item.biDate}" pattern="yyyy-MM-dd"/>
					출판일 : ${date}<br/>
				출판사 : ${item.biPub}<br/>
			</td>
			<td>
				<fmt:formatNumber value="${item.avg }" var="avg" pattern="0.0"/>
				평점:${avg }
				(${item.count })<br/>
			</td>
			<td>
				${item.biPrice}원
			</td>
			
		</tr>
		</c:forEach>
	</table>
	
	<!-- 페이지 이동 버튼 만들기 -->
	<c:if test="${nowPage != null}">
		<ul id="page" align="center"><li>100<li></ul>
	</c:if>

</body>
</html>