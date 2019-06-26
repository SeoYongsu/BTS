<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<link href="${pageContext.request.contextPath}/resources/web/css/login.css" rel="stylesheet">

<script type="text/javascript">
	//아이디 공백
	if($("#mId").val()==""){
		  alert("아이디를 입력해주세요.");
	    $("#mId").focus();
	    return false;
	}
	
	//비밀번호 공백
	if($("#mPw").val()==""){
		  alert("비밀번호를 입력해주세요.");
	    $("#mPw").focus();
	    return false;
	}
</script>

<body>


<div class="container">
	<div class="d-flex justify-content-center" style="margin-top: -80px;">
		<div class="card">
			<div class="card-header">
				<h3>B.T.S Login</h3>
			</div>
			<div class="card-body">
				<form method="POST" action="${pageContext.request.contextPath}/member/loginProc.web">
					<!-- 아이디 form 그룹 -->
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" id="mId" name="mId" class="form-control" placeholder="아이디" autocomplete="off" maxlength="20" pattern="[a-zA-Z0-9]{4,19}" required="required">
					</div>
					<!-- 비밀번호 form 그룹 -->
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" id="mPw" name="mPw" required="required" class="form-control" pattern="^[a-zA-Z0-9]{4,20}$" maxlength="20" placeholder="비밀번호">
					</div>
					<div class="form-group">
						<input type="submit" value="로그인" class="btn float-right login_btn">
					</div>
				</form>
			</div>
			<div class="card-footer">
				<div class="d-flex justify-content-center links">
					지금 BTS에 가입해보시겠어요?<a href="${pageContext.request.contextPath}/member/joinForm.web">회원가입</a>
				</div>
				<div class="d-flex justify-content-center">
					<a href="${pageContext.request.contextPath}/member/findId.web">아이디를 잃어버렸나요?</a>
				</div>
				<div class="d-flex justify-content-center">
					<a href="${pageContext.request.contextPath}/member/findPw.web">비밀번호를 잃어버렸나요?</a>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- 명기가 짠 코드 원본
	<h2 align="center">로그인</h2>
	<%
	  	Integer mNo = (Integer)session.getAttribute("mNo");
		Integer mGrade = (Integer)session.getAttribute("mGrade");
	 %>
	<%= mNo %><br>
	<%= mGrade %>
	<form method="POST" align="center" action="../member/loginProc.web">
		<div>
			아이디 : 
			<input type="text" id="mId" name="mId" required="required" 
	        pattern="[a-zA-Z0-9]{4,19}" maxlength="20" placeholder="4자이상 " autocomplete="off">
		</div>
		<div>
			비밀번호 : 
			<input type="password" id="mPw" name="mPw" required="required"
	        pattern="^[a-zA-Z0-9]{4,20}$" maxlength="20" placeholder="4자이상" />
		</div>
		<div>
        	<button type="submit" >로그인</button>
		</div>
	</form>
-->	
</body>
</html>