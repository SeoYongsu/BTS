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
		$("#gBtn").click(function(){//구매내역 확인
			$("#gFrm").submit();
		});
		$("#mBtn").click(function(){//메인으로 가기
			$(location).attr("href","${pageContext.request.contextPath}");
		});
	});		
	</script>
</head>
<body>  
	<form action="${pageContext.request.contextPath}/order/confirm.web" id="gFrm" method="post">	
		<table class="table table-borderless">		
			<tr>
			  <td align="center"><h1>구매가 완료되었습니다</h1></td>
			</tr>
			<tr>
			  <td align="center">
			  	<button type="button" class="btn btn-success btn-lg" id="mBtn">메인으로 가기</button>
			  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-info btn-lg" id="gBtn">구매내역 보기</button>
			  </td>
			</tr>
		</table>
	</form>
</body>
</html>
