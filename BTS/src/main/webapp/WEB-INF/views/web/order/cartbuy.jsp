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

	<!-- 다음 주소 API -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="/resources/js/addressapi.js"></script>

	<script>

	
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
	
	
		$(document).ready(function(){
			$("#bBtn").click(function(){//결제처리
				if($("#boName").val()==""){//무결성 검사
					$("#boName").focus();
					return;
				}else if($("#boPhone").val()==""){
					$("#boPhone").focus();
					return;					
				}else if($("#boAddr").val()==""){
					$("#boAddr").focus();
					return;										
				}
				$("#bFrm").submit();
			});
		});	
	</script>
</head>
<body>
	<div class="container">
	  <h4>주문 상품 확인</h4>
	  <table class="table">
	    <thead>
	      <tr>
	        <th>상품</th>
	        <th>수량</th>
	        <th>주문금액</th>
	      </tr>
	    </thead>
	    <tbody>
	    <c:forEach var="item" items="${ORDER}">
	      <tr>
	        <td><img alt="img" src="${item.biImg}" height="70"/>&nbsp;&nbsp;&nbsp; ${item.biTitle}</td>
	        <td>${item.boOrdercount}</td>
	        <td>${(item.biSalPrice) *item.boOrdercount}</td>
	      </tr>
	    </c:forEach>
			<tr>
			   <td colspan="3" align="right">
			   	<h5>합계&nbsp;&nbsp;&nbsp; ${SUM}
			   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			   	</h5>
			   </td>
			</tr>
	    </tbody>
	  </table>
	</div>
	
	<!-- 배송정보 수정 -->
	<div class="container">
		<form action="${pageContext.request.contextPath}/order/cartguide.web" id="bFrm" method="post">		
		  <h4>배송 정보</h4>
		  <table class="table">
	      <tr>
	        <th>받으실 분</th>
	        <td><input type="text" class="form-control" value="${USER.mName}" name="boName" id="boName"/></td>
	      </tr>
	      <tr>
	        <th>휴대폰</th>
	        <td>
		     	<select class="form-control"  style="width: 90px;float:left" id="mPhone1" name="mPhone1" required="required">
					<option value="010" selected="selected">010</option>
					<option value="019" >019</option>
					<option value="011" >011</option>
				</select>
	        	<input type="text" class="form-control" value="${USER.mPhone2}" style="width: 90px;float:left; padding:10px;" id="mPhone2" name="mPhone2" placeholder="중간번호" 
	        	maxlength="4" required="required" pattern="^[0-9]{4}" autocomplete="off" >
	        	<input type="text" class="form-control" value="${USER.mPhone3}" style="width: 90px;float:left" id="mPhone3" name="mPhone3" placeholder="끝번호"
	        	maxlength="4" required="required" pattern="^[0-9]{4}" autocomplete="off" >    
	        </td>
	      </tr>	      
	      <tr>
	        <th rowspan="3">주소</th>
	        <td>
	        	<input type="text" class="form-control" value="${USER.mAddr1}" name="mAddr1" id="mAddr1" required="required" readonly="readonly" placeholder="우편번호" style="float:left;width:50%"/>
				<button type="button" onclick="execPostCode();" class="btn btn-success" style="float:left">주소검색</button>	        
	        </td>
	      </tr>
	      <tr>
	      	<td>
			  	<input type="text" class="form-control" value="${USER.mAddr2}" id="mAddr2" name="mAddr2" required="required" readonly="readonly" placeholder="도로명 주소">
	      	</td>
	      </tr>
	      <tr>
	      	<td>
			  	<input type="text" class="form-control" value="${USER.mAddr3}" id="mAddr3" name="mAddr3" required="required" autocomplete="off" placeholder="상세주소">
	      	</td>
	      </tr>	      
	      <tr>
	      	<td colspan="2">
	      		<input type="hidden" name=boUser value="${USER.boUser}"/>	      		
	      		<button class="btn btn-danger" id="bBtn" type="button">결제하기</button>
	      	</td>
	      </tr>
		  </table>
	  </form>
	</div>	
</body>
</html>
