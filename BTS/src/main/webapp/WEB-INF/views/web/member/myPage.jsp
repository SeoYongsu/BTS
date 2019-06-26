<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/web/css/joinPage.css" rel="stylesheet">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
<script type="text/javascript">
	  
	  // 비밀번호 확인 실시간 확인
	  $('#pw').keyup(function(){
	   $('#pwcheck').text('');
	  });

	  $('#pwc').keyup(function(){
	   if($('#pw').val()!=$('#pwc').val()){
	    	$('#pwcheck').text('');
	    	$('#pwcheck').html("비밀번호가 일치하지 않습니다.");
	   }else{
	    	$('#pwcheck').text('');
	   }
	  });
	
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
		  
		  var mMailCheck = RegExp(/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/);
		  var mPhoneCheck = RegExp(/^[0-9]{1,13}$/);
		  
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
			<form method="POST" align="center" action="${pageContext.request.contextPath}/member/updateMyPage.web" style="text-align: left;">
				<div class="contact-form">
				
					<div class="form-group row">
					  <label class="control-label col-sm-3" for="mName" style="text-align: center; margin-top: 6px;"></label>
					  <div class="col-sm-9 row">          
						<label class="control-label col-sm-3" for="mName" style="text-align: center; margin-top: 6px;">
						${MEMBER.mName} 님의 MyPage 
						</label>
					  </div>
					</div>
					
					<div class="form-group row">
					  <label class="control-label col-sm-3" for="mMail" style="text-align: center; margin-top: 6px;">이메일</label>
					  <div class="col-sm-9 row">
						<input type="text" class="form-control" id="mMail" name="mMail" required="required" pattern="^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$" 
						value="${MEMBER.mMail }">
					  </div>
					</div>
					
					<div class="form-group row">
					  <label class="control-label col-sm-3" for="mId" style="text-align: center; margin-top: 6px;">아이디</label>
					  <div class="col-sm-9 row">          
						<input type="text" class="form-control" id="mId" name="mId" placeholder="아이디" pattern="[a-zA-Z0-9]{4,19}" maxlength="4자리 이상"
						value="${MEMBER.mId }" readonly="readonly">
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
				        	pattern="^[0-9]{4}" autocomplete="off" value="${MEMBER.mPhone2 }" >
				        	<input type="text" class="form-control"  style="width: 90px" id="mPhone3" name="mPhone3" placeholder="끝번호" maxlength="4" required="required" 
				        	pattern="^[0-9]{4}" autocomplete="off"  value="${MEMBER.mPhone3 }">
				        </div>
		    		</div>
					
					<!-- 주소 -->
					<div class="form-group row">
					  <label class="control-label col-sm-3" for="mAddr1" style="text-align: center; margin-top: 6px;">주소</label>
					  <div class="col-sm-4 row">
					  	<input type="text" class="form-control" id="mAddr1" name="mAddr1" required="required" 
						readonly="readonly" value="${MEMBER.mAddr1 }">          
					  </div>
  						<button type="button" onclick="execPostCode();" class="btn btn-default col-sm-2">주소검색</button>
					</div>
					<div class="form-group row">
					  <label class="control-label col-sm-3" for="mAddr2" style="text-align: center; margin-top: 6px;"></label>
					  <div class="col-sm-9 row">
					  	<input type="text" class="form-control" id="mAddr2" name="mAddr2" required="required" 
						readonly="readonly" value="${MEMBER.mAddr2 }">
					  </div>
					</div>
					<div class="form-group row">
					  <label class="control-label col-sm-3" for="mAddr3" style="text-align: center; margin-top: 6px;"></label>
					  <div class="col-sm-9 row">
					  	<input type="text" class="form-control" id="mAddr3" name="mAddr3" required="required" autocomplete="off"
					  	value="${MEMBER.mAddr3 }">
					  </div>
					</div>
					<input type="hidden" name="mSido" id="mSido" /> 
					<!-- 주소 -->
					
			    	<div class="form-group row">
					  <label class="control-label col-sm-3" for="mBirth" style="text-align: center; margin-top: 6px;">생년월일:</label>
					  <div class="col-sm-9 row">          
						<input type="text" class="form-control" id="mBirth" name="mBirth" required="required" pattern="^[0-9]{1,13}$" maxlength="13"
						value="${MEMBER.mBirth }"  readonly="readonly">
					  </div>
					</div>
					
					<div class="form-group row">
			    		<label class="control-label col-sm-3" for="mUse" style="text-align: center; margin-top: 6px;">탈퇴여부:</label>
			    		<select id="mUse" name="mUse" required="required">
				    		<option value="N">N</option>
				    		<option value="Y">Y</option>
			    		</select>
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


<%-- 	<form method="POST" action="#"
	class="form-inline">
		<input type="hidden" name="mSido" id="mSido" />
		<div>
	      	<label for="mName">이름:</label>
	        <input type="text" id="mName" name="mName" required="required"
	         pattern="^[가-힣]+$" autocomplete="off" placeholder="한글 " 
	         value="${MEMBER.mName }" readonly="readonly" >
    	</div>
      	<div>
			<label for="mId">아이디:</label>
	        <input type="text" id="mId" name="mId" required="required" 
	        pattern="[a-zA-Z0-9]{4,19}" maxlength="20" placeholder="4자이상 " autocomplete="off"
	        value="${MEMBER.mId }" readonly="readonly" >
	       	<font id="idcheck" size="2" ></font>
      	</div>
      	<div>
			<label for="mEmail" >이메일:</label>
	        <input type="text" class="form-control" id="mMail" name="mMail" required="required" 
	        pattern="^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$" autocomplete="off"
	        value="${MEMBER.mMail }">
      	</div>
      	<div>
	     	<label for="mPhone">전화번호:</label>
	        <input type="text" id="mPhone" name="mPhone" maxlength="13" pattern="^[0-9]{1,13}$" 
	        placeholder="숫자(13자리까지)" required="required" autocomplete="off"
	        value="${MEMBER.mPhone }" >
    	</div>
    	<div>
    	<div>
	    	주소:
				<input style="width: 90px; display: inline;" placeholder="우편번호" name="mAddr1" id="mAddr1" 
				type="text" readonly="readonly" value="${MEMBER.mAddr1 }" >
				<button type="button" onclick="execPostCode();">우편번호 찾기</button>                               
				<div>
				    <input style="top: 5px;" placeholder="도로명 주소" name="mAddr2" id="mAddr2" 
				    type="text" readonly="readonly" required="required" autocomplete="off" 
				    value="${MEMBER.mAddr2 }" >
				</div>
				<div>
				    <input placeholder="상세주소" name="mAddr3" id="mAddr3" type="text"  
				    required="required" autocomplete="off" 
				    value="${MEMBER.mAddr3 }">
				</div>
    	</div>
    	
    	<div>
      		<label for="mBirthyy">생년월일:</label>
        	<input type="text" style="width: 120px" class="form-control" id="mBirthyy" name="mBirthyy" 
        	placeholder="년(4자)" maxlength="4" required="required"
        	pattern="[0-9]{4}" autocomplete="off"
        	value="${MEMBER.mBirth }"  readonly="readonly" >
    	</div>
    
    	<div>        
      		<div>
        	<button type="submit" >변경하기</button>
      		</div>
    	</div>
	</form> --%>
	
</body>
</html>