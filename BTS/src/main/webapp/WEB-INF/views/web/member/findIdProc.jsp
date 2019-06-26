<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/web/css/joinPage.css" rel="stylesheet">
</head>
<body>




<div class="container contact">
	<div class="row">
		<!-- 좌측 BTS 소개 -->
		<div class="col-md-3">
			<div class="contact-info">
				<img src="${pageContext.request.contextPath}/resources/web/image/BTSLogo.png" alt="image"/>
				<h2>Welcome</h2>
				<h4>Team. PB</h4>
			</div>
		</div>
		
		<!-- 우측 가입폼 -->
		<div class="col-md-9" style="text-align: left;">
			<form action="${pageContext.request.contextPath}/member/findIdProc.web">
	
			<div class="form-group row">
				<label class="control-label col-sm-3" style="text-align: center; margin-top: 6px;">회원님의 아이디는</label>
				<div class="col-sm-9 row">          
					${FINDID.mId } 입니다
				</div>
			</div>
							
		</form>
		</div>
	</div>
</div>

	
</body>
</html>