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
			$("#cBtn").click(function(){//리뷰수정
				if($("#brRe").val()==""){//무결성 검사 리뷰 내용이 비었을경우
					$("#brRe").focus();
					return;
				}
				$("#cFrm").submit();
			});		
		});
	</script>
</head>
<body>
<!-- 리뷰 수정폼-->
 <div class="container" id="cTa">
	<form action="${pageContext.request.contextPath}/order/changeproc.web" id="cFrm">
	<h5>리뷰수정</h5>
	<table>
		<tr>
			<td>
				평점
				<select name="brSco" id="brSco">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>
	    <div class="form-group">
	      	<textarea class="form-control" rows="3" name="brRe" cols="150" id="brRe">${change.brRe}</textarea>
	    </div>
			</td>
		</tr>
		<tr>
			<td>
				<input type="hidden" name="biNo" value="${biNo}"/>
	    		<button type="button" class="btn btn-primary" id="cBtn">수정</button>
			</td>
		</tr>
	</table>
	</form>
</div>

</body>
</html>