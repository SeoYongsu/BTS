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
				<label class="control-label col-sm-3" for="mName" style="text-align: center; margin-top: 6px;">이름</label>
				<div class="col-sm-9 row">          
					<input type="text" class="form-control" id="mName" name="mName" required="required" pattern="^[가-힣]+$" autocomplete="off" placeholder="이름">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="control-label col-sm-3" for="mPhone" style="text-align: center; margin-top: 6px;">전화번호</label>
				<div class="col-sm-9 row"> 
			     	<select class="form-control"  style="width: 90px" id="mPhone1" name="mPhone1" required="required">
						<option value="010" selected="selected">010</option>
						<option value="019" >019</option>
						<option value="011" >011</option>
					</select>
		        	<input type="text" class="form-control"  style="width: 90px" id="mPhone2" name="mPhone2" placeholder="중간번호" maxlength="4" required="required" 
		        	pattern="^[0-9]{4}" autocomplete="off" >
		        	<input type="text" class="form-control"  style="width: 90px" id="mPhone3" name="mPhone3" placeholder="끝번호" maxlength="4" required="required" 
		        	pattern="^[0-9]{4}" autocomplete="off" >
		        </div>
			</div>
			
			<div class="form-group">        
			 	<div class="col-sm-offset-2 col-sm-12" style="text-align: right;">
					<button type="submit" class="btn btn-primary">아이디찾기</button>
			  	</div>
			</div>
							
		</form>
		</div>
	</div>
</div>

	
</body>
</html>