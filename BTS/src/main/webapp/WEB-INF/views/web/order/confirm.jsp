<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	<script>
	$(document).ready(function(){
		$(".fBtn").click(function(){//구매확정
			var boNo=$(this).attr("param");
			$(location).attr("href","${pageContext.request.contextPath}/order/fix.web?boNo="+boNo);
		});
		$(".cBtn").click(function(){//구매취소
			var boNo=$(this).attr("param");
			if(!confirm("구매를 정말 취소하시겠습니까?")) return false;									
			$(location).attr("href","${pageContext.request.contextPath}/order/cancel.web?boNo="+boNo);
		});
	});			
	</script>
</head>
<body>  
<!-- 유저가 오늘 구매한 항목만 보여줄 예정 (sql문 통해서 적용)-->
<div class="container">
	  <h4>구매 확인</h4>
	  <c:forEach items="${BUY}" var="item">
		  <table class="table">
		      <tr>
		        <th rowspan="5"><img alt="img" src="${item.biImg}" height="180"/></th>
		        <td style="width:70%">${item.biTitle}</td>
		      </tr>
		      <tr>
		        <td>${item.boPrice}원 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${item.boDate}</td>
		      </tr>
		      <tr>
		        <td>${item.boAddr}</td>
		      </tr>
			  <c:if test="${item.boCheck eq 'W'}">
			  <tr>
			  	<td>
				  	<input type="button" class="btn btn-outline-primary fBtn" param="${item.boNo}" value="구매확정">
				  	<input type="button" class="btn btn-outline-info cBtn" param="${item.boNo}" value="구매취소">
			  	</td>
			  </tr>
			  </c:if>
			  <c:if test="${item.boCheck eq 'Y'}">
			  	<tr>
			  		<td>구매확정일 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${item.boConfirm}</td>
			  	</tr>
			  </c:if>	
		  </table>
	  </c:forEach>
</div>
</body>
</html>
