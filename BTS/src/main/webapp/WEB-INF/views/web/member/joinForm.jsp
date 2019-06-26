<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/web/css/joinPage.css" rel="stylesheet">
<!-- 다음 주소 API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>

<script type="text/javascript">
	
	function execPostCode() {
         new daum.Postcode({
             oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                console.log(data.zonecode);
                console.log(fullRoadAddr);
                
                
                
                
                $("[name=mAddr1]").val(data.zonecode);
                $("[name=mAddr2]").val(fullRoadAddr);
                $("[name=mSido]").val(data.sido);
                
                /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
                document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
            }
         }).open();
     }

	// ------------------------------------
	// 유효성검사
	function checks(){
		  
		  var mIdCheck = RegExp(/^[a-zA-Z][a-zA-Z0-9]{3,19}$/);
		  var mPwCheck = RegExp(/^[a-zA-Z0-9]{4,20}$/);
		  var mNameCheck = RegExp(/^[가-힣]+$/);
		  var mBirthyyCheck = RegExp(/^[0-9]{4}$/);
		  var mBirthddCheck = RegExp(/^[1-9]{1}$|^[1-2]{1}[0-9]{1}$|^30|^31$/);
		  var mMailCheck = RegExp(/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/);
		  var mPhoneCheck = RegExp(/^[0-9]{1,13}$/);
		  
		  // 아이디 공백
		  if($("#mId").val()==""){
			  alert("아이디를 입력해주세요.");
		      $("#mId").focus();
		      return false;
		  }
		  // 아이디 유효성
		  if(!idCheck.test($("#mId").val())){
			  alert("형식에 맞게 입력해주세요.");
		      $("#mId").val("");
		      $("#mId").focus();
		      return false;
		  }
		  
		  // 비밀번호 공백
		  if($("#mPw").val()==""){
			  alert("비밀번호를 입력해주세요.");
		      $("#mPw").focus();
		      return false;
		  }
		  // 비밀번호 유효성
	      if(!pwCheck.test($("#mPw").val())){
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
		  
		  // 아이디 비밀번호 같음 확인
	      if($("#mId").val() == $("#mPw").val()){
	        alert("아이디와 비밀번호가 같습니다.");
	        $("#mPw").val("");
	        $("#mPw").focus();
	        return false;
	      }
		  
	   	  // 이름 공백
		  if($("#mName").val()==""){
			  alert("이름을 입력해주세요.");
		      $("#mName").focus();
		      return false;
		  }
	   	  // 이름 유효성검사
		  if(!nameCheck.test($("#mName").val())){
		        alert("형식에 맞게 입력해주세요");
		        $("#mName").val("");
		        $("#mName").focus();
		        return false;
		  }
		  // 생년월일 공백
		  if($("#mBirthyy").val()==""){
			  alert("생년월일을 입력해주세요.");
		      $("#mBirthyy").focus();
		      return false;
		  }
		  if($("#mBirthmm").val()==""){
			  alert("생년월일을 입력해주세요.");
		      $("#mBirthmm").focus();
		      return false;
		  }
		  if($("#mBirthdd").val()==""){
			  alert("생년월일을 입력해주세요.");
		      $("#mBirthdd").focus();
		      return false;
		  }
	   	  // 생년월일 유효성검사
		  if(!birthyyCheck.test($("#mBirthyy").val())){
		        alert("형식에 맞게 입력해주세요");
		        $("#mBirthyy").val("");
		        $("#mBirthyy").focus();
		        return false;
		  }
		  if(!birthddCheck.test($("#mBirthdd").val())){
		        alert("형식에 맞게 입력해주세요");
		        $("#mBirthdd").val("");
		        $("#mBirthdd").focus();
		        return false;
		  }
		  
		  // 이메일 공백
		  if($("#mMail").val()==""){
			  alert("이메일을 입력해주세요.");
		      $("#mMail").focus();
		      return false;
		  }
	   	  // 이메일 유효성검사
		  if(!emailCheck.test($("#mMail").val())){
		        alert("형식에 맞게 입력해주세요");
		        $("#mMail").val("");
		        $("#mMail").focus();
		        return false;
		  }
		  // 전화번호 공백
		  if($("#mPhone").val()==""){
			  alert("전화번호를 입력해주세요.");
		      $("#mPhone").focus();
		      return false;
		  }
	   	  // 전화번호 유효성검사
		  if(!telCheck.test($("#mPhone").val())){
		        alert("형식에 맞게 입력해주세요");
		        $("#mPhone").val("");
		        $("#mPhone").focus();
		        return false;
		  }
	   	  
		  // 주소 공백
		  if($("#mAaddr2").val()==""){
			  alert("주소를 입력해주세요.");
		      $("#mAaddr2").focus();
		      return false;
		  }
		  // 주소 공백
		  if($("#mAddr3").val()==""){
			  alert("상세주소를 입력해주세요.");
		      $("#mAddr3").focus();
		      return false;
		  }
		  
	  }
	
	
	$(function(){
		$("#idCheck").on("click", function(){
			var mId = $("#mId").val();
			console.log(mId);
			 
			$.ajax({
				url : "${pageContext.request.contextPath}/member/idCheck.web",
			  	type : "post",
			  	data : {"mId" : mId},
			  	success : function(data) {
			  		if(data == 0) {
			  		    $("#msg").text("사용 가능");
			  		    $("#msg").attr("style", "color:#00f");
		  		   	} else {
			  		    $("#msg").text("사용 불가");
			  		    $("#msg").attr("style", "color:#f00");    
			  		}
			  	},
			  	error : function(xhr, status){
			  		alert(xhr+":"+status)
			  	}
			 })
		})
		
	})// function
	
	
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
			<form method="POST" align="center" action="${pageContext.request.contextPath}/member/joinProc.web" style="text-align: left;" onsubmit="return checks()">
				<div class="contact-form">
				
					<div class="form-group row">
					  <label class="control-label col-sm-3" for="mName" style="text-align: center; margin-top: 6px;">이름</label>
					  <div class="col-sm-9 row">          
						<input type="text" class="form-control" id="mName" name="mName" required="required" pattern="^[가-힣]+$" autocomplete="off" placeholder="이름">
					  </div>
					</div>
					
					<div class="form-group row">
					  <label class="control-label col-sm-3" for="mMail" style="text-align: center; margin-top: 6px;">이메일</label>
					  <div class="col-sm-9 row">
						<input type="text" class="form-control" id="mMail" name="mMail" placeholder="이메일" required="required" pattern="^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$" autocomplete="off">
					  </div>
					</div>
					
					<div class="form-group row">
					  <label class="control-label col-sm-3" for="mId" style="text-align: center; margin-top: 6px;">아이디</label>
					  <div class="col-sm-9 row">          
						<input type="text" style="width: 200px" class="form-control" required="required" id="mId" name="mId" placeholder="아이디" pattern="^[a-zA-Z0-9]{4,19}" maxlength="20" autocomplete="off">
					  	<button type="button" id="idCheck">중복확인</button>
					  </div>
					</div>
					
					<div class="form-group row">
					  <label class="control-label col-sm-3" for="mId" style="text-align: center; margin-top: 6px;"></label>
					  <div class="col-sm-9 row">          
					  	<div id="msg">중복확인 버튼을 눌러주세요.</div>
					  </div>
					</div>
					
					<div class="form-group row">
					  <label class="control-label col-sm-3" for="mPw" style="text-align: center; margin-top: 6px;">비밀번호</label>
					  <div class="col-sm-9 row">          
						<input type="password" class="form-control" id="mPw" name="mPw" required="required" pattern="^[a-zA-Z0-9]{4,20}$" maxlength="20" autocomplete="off" placeholder="4자리 이상">
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
					
					<!-- 주소 -->
					<div class="form-group row">
					  <label class="control-label col-sm-3" for="mAddr1" style="text-align: center; margin-top: 6px;">주소</label>
					  <div class="col-sm-4 row">
					  	<input type="text" class="form-control" id="mAddr1" name="mAddr1" required="required" readonly="readonly" placeholder="우편번호">          
					  </div>
  						<button type="button" onclick="execPostCode();" class="btn btn-default col-sm-2">주소검색</button>
					</div>
					<div class="form-group row">
					  <label class="control-label col-sm-3" for="mAddr2" style="text-align: center; margin-top: 6px;"></label>
					  <div class="col-sm-9 row">
					  	<input type="text" class="form-control" id="mAddr2" name="mAddr2" required="required" readonly="readonly" placeholder="도로명 주소">
					  </div>
					</div>
					<div class="form-group row">
					  <label class="control-label col-sm-3" for="mAddr3" style="text-align: center; margin-top: 6px;"></label>
					  <div class="col-sm-9 row">
					  	<input type="text" class="form-control" id="mAddr3" name="mAddr3" required="required" autocomplete="off" placeholder="상세주소">
					  </div>
					</div>
					<input type="hidden" name="mSido" id="mSido" /> 
					<!-- 주소 -->
					
					<div class="form-group row">
					  <label class="control-label col-sm-3" style="text-align: center; margin-top: 6px;">생년월일</label>
					  <div class="col-sm-3 row">          
						<input type="text" class="form-control" id="mBirthyy" name="mBirthyy" required="required" pattern="[0-9]{4}" autocomplete="off" maxlength="4" placeholder="(예) 1991">
					  </div>
		  	  		  <select id="mBirthmm" name="mBirthmm" required="required" class="col-sm-3" style="border-radius: 3px;">
						<option selected disabled hidden="hidden">월</option>
						<option value="01" >01</option>
						<option value="02" >02</option>
						<option value="03" >03</option>
						<option value="04" >04</option>
						<option value="05" >05</option>
						<option value="06" >06</option>
						<option value="07" >07</option>
						<option value="08" >08</option>
						<option value="09" >09</option>
						<option value="10" >10</option>
						<option value="11" >11</option>
						<option value="12" >12</option>
					  </select>
					  <div class="col-sm-3 row">          
						<input type="text" class="form-control" id="mBirthdd" name="mBirthdd" required="required" pattern="^[1-9]{1}$|^[1-2]{1}[0-9]{1}$|^30|^31$" autocomplete="off" maxlength="2" placeholder="일">
					  </div>
					</div>	
					<div class="form-group">        
					  <div class="col-sm-offset-2 col-sm-12" style="text-align: right;">
						<button type="submit" class="btn btn-default">회원가입</button>
					  </div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- 유명기 작업 코드
	<div>
		<h2 align="center">회원가입</h2>
	</div>

	
	<form method="POST" align="center" action="../member/joinProc.do">
	
		<input type="hidden" name="mSido" id="mSido" /> 
		<div>
	      	<label for="mName">이름:</label>
	        <input type="text" id="mName" name="mName" required="required" pattern="^[가-힣]+$" autocomplete="off" placeholder="한글 ">
    	</div>
      	<div>
			<label for="mId">아이디:</label>
	        <input type="text" id="mId" name="mId" required="required" pattern="[a-zA-Z0-9]{4,19}" maxlength="20" placeholder="4자이상 " autocomplete="off">
	       	<font id="idcheck" size="2" ></font>
      	</div>
      	<div>
			<label for="mEmail" >이메일:</label>
	        <input type="text" class="form-control" id="mMail" name="mMail" required="required" pattern="^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$" autocomplete="off">
      	</div>
      	<div>
	      	<label for="mPw">비밀번호:</label>
	        <input type="password" id="mPw" name="mPw" required="required" pattern="^[a-zA-Z0-9]{4,20}$" maxlength="20" placeholder="4자이상" />
    	</div>
    	<div>
	      	<label for="pwc">비밀번호 확인:</label>
	        <input type="password" id="pwc" name="pwc" required="required" pattern="^[a-zA-Z0-9]{4,20}$" maxlength="20">
	        <font id="pwcheck" size="2" color="red"></font>
      	</div>
      	<div>
	     	<label for="mPhone">전화번호:</label>
	        <input type="text" id="mPhone" name="mPhone" maxlength="13" pattern="^[0-9]{1,13}$" placeholder="숫자(13자리까지)" required="required" autocomplete="off">
    	</div>
    	<div>
    	
    	
    	<div>
	    	주소:
				<input style="width: 90px; display: inline;" placeholder="우편번호" name="mAddr1" id="mAddr1" type="text" readonly="readonly" >
				<button type="button" onclick="execPostCode();">우편번호 찾기</button>                               
				<div>
				    <input style="top: 5px;" placeholder="도로명 주소" name="mAddr2" id="mAddr2" type="text" readonly="readonly" required="required" autocomplete="off" />
				</div>
				<div>
				    <input placeholder="상세주소" name="mAddr3" id="mAddr3" type="text" required="required" autocomplete="off" />
				</div>
    	</div>
    	
    	<div>
      		<label for="mBirthyy">생년월일:</label>
        	<input type="text" style="width: 90px" class="form-control" id="mBirthyy" name="mBirthyy" placeholder="년(4자)" maxlength="4" required="required" pattern="[0-9]{4}" autocomplete="off">
        	
	  		<select id="mBirthmm" name="mBirthmm" required="required">
			<option value="">월</option>
				<option value="01" >01</option>
				<option value="02" >02</option>
				<option value="03" >03</option>
				<option value="04" >04</option>
				<option value="05" >05</option>
				<option value="06" >06</option>
				<option value="07" >07</option>
				<option value="08" >08</option>
				<option value="09" >09</option>
				<option value="10" >10</option>
				<option value="11" >11</option>
				<option value="12" >12</option>
			</select>
        	<input type="text" style="width: 90px" id="mBirthdd" name="mBirthdd" placeholder="일" maxlength="2" required="required" pattern="^[1-9]{1}$|^[1-2]{1}[0-9]{1}$|^30|^31$" autocomplete="off" >
    	</div>
    
    	<div>        
      		<div>
        	<button type="submit" >회원가입</button>
      		</div>
    	</div>
	</form>
 -->	
	
</body>
</html>