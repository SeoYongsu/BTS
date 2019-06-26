<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<script>
	$(document).ready(function(){
		$("#cBtn").click(function(){//장바구니 보기
			$(location).attr("href","${pageContext.request.contextPath}/order/cart.web");
		});
		$("#sBtn").click(function(){//계속 쇼핑하기
			$("#gFrm").submit();//다시 상품 상세보기 창으로 돌아간다
		});
	});		
	</script>
</head>
<body>
	<form action="${pageContext.request.contextPath}/order/detail.web" id="gFrm" method="post">	
		<table class="table table-borderless">		
			<tr>
			  <td align="center"><h1>상품이 장바구니에 담겼습니다.<br/>지금 확인하시겠습니까?</h1></td>
			</tr>
			<tr>
			  <td align="center">
			  	<input type="hidden" name="biNo" value="${biNo}"/>
			  	<button type="button" class="btn btn-success btn-lg" id="cBtn">장바구니 보기</button>
			  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-info btn-lg" id="sBtn">계속 쇼핑하기</button>
			  </td>
			</tr>
		</table>
	</form>
	
</body>
</html>
