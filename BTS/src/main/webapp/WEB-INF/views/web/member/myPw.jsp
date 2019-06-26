<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/web/css/joinPage.css" rel="stylesheet">
<script type="text/javascript">
//유효성검사
function checks(){
	  var mPwCheck = RegExp(/^[a-zA-Z0-9]{4,20}$/);
	  // 비밀번호 공백
	  if($("#mPw").val()==""){
		  alert("비밀번호를 입력해주세요.");
	      $("#mPw").focus();
	      return false;
	  }
	  // 비밀번호 유효성
      if(!mPwCheck.test($("#mPw").val())){
        alert("형식에 맞게 입력해주세요");
        $("#mPw").val("");
        $("#mPw").focus();
        return false;
      }
	  
	  // 비밀번호 확인 공백
	  if($("#pwc").val()==""){
		  alert("비밀번호확인란 을 입력해주세요.");
	      $("#pwc").focus();
	      return false;
	  }
	  // 비밀번호 서로확인
      if($("#mPw").val() != $("#pwc").val()){
          alert("비밀번호가 일치하지 않습니다.");
          $("#mPw").val("");
          $("#pwc").val("");
          $("#mPw").focus();
          return false;
      }
	  
  }
</script>
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
			<form method="POST" align="center" action="${pageContext.request.contextPath}/member/myPwProc.web" style="text-align: left;" onsubmit="return checks()">
				<div class="contact-form">
				
					<div class="form-group row">
					  <label class="control-label col-sm-3" for="mPw" style="text-align: center; margin-top: 6px;">비밀번호</label>
					  <div class="col-sm-9 row">          
						<input type="password" class="form-control" id="mPw" name="mPw" required="required" pattern="^[a-zA-Z0-9]{4,20}$" maxlength="20" autocomplete="off" placeholder="새로운 비밀번호(4자리 이상)">
					  </div>
					</div>
					
					<div class="form-group row">
					  <label class="control-label col-sm-3" for="pwc" style="text-align: center; margin-top: 6px;">비밀번호 확인</label>
					  <div class="col-sm-9 row">          
						<input type="password" class="form-control" id="pwc" name="pwc" required="required" pattern="^[a-zA-Z0-9]{4,20}$" maxlength="20" autocomplete="off" placeholder="새로운 비밀번호(4자리 이상)">
					  </div>
					</div>
					
					<div class="form-group">        
					  <div class="col-sm-offset-2 col-sm-12" style="text-align: right;">
						<button type="submit" class="btn btn-default">수정하기</button>
					  </div>
					</div>
					
				</div>
			</form>
		</div>
	</div>
</div>
	
</body>
</html>