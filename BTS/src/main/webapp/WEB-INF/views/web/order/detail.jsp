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
			$("#sBtn").click(function(){//바로구매
				$("#sFrm").submit();
			});
			$("#mBtn").click(function(){//장바구니
				var boOrdercount=$("#boOrdercount").val();
				$(location).attr("href","${pageContext.request.contextPath}/order/cartput.web?biNo=${VIEW.biNo}&boOrdercount="+boOrdercount);
			});
			$("#rBtn").click(function(){//리뷰작성
				if($("#brRe").val()==""){//무결성 검사 리뷰 내용이 비었을경우
					$("#brRe").focus();
					return;
				}
				$("#rFrm").submit();
			});
			$("#dBtn").click(function(){//리뷰삭제
				if(!confirm("정말 삭제하시겠습니까?")) return false;									
				$(location).attr("href","${pageContext.request.contextPath}/order/delete.web?biNo=${VIEW.biNo}");
			});
			$("#cBtn").click(function(){//리뷰수정
				$(location).attr("href","${pageContext.request.contextPath}/order/change.web?biNo=${VIEW.biNo}");
			});			
		});
	</script>

</head>
<body>
<div class="container">
<!-- 도서 상세정보 -->
	<form action="${pageContext.request.contextPath}/order/buy.web" id="sFrm" method="post">
	  <table class="table">
	    <tbody>
	      <tr>
	      	<td rowspan="5"><img alt="img" src="${VIEW.biImg}" style="size: 25px;"></td>      
	        <td>${VIEW.biTitle}</td>
	      </tr>
	      <tr>
	        <td>저자 ${VIEW.biWriter}	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
	        	출판사 ${VIEW.biPub} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 출간일 ${VIEW.biDate}</td>
	      </tr>
	      <tr>
	        <td>정가 ${VIEW.biPrice}</td>
	      </tr>
	      <tr>
	        <td>판매가 ${VIEW.biSalPrice}원&nbsp;&nbsp;&nbsp;<c:if test="${VIEW.bmSale ne 0}">[${VIEW.bmSale}%할인]</c:if></td>
	      </tr>
	      <tr>
	        <td>
	        	수량<input type="number" min="1" max="100" value="1" name="boOrdercount" id="boOrdercount"/>
		        <input type="hidden" name="biNo" value="${VIEW.biNo}"/>
	        </td>
	      </tr>
	      <c:if test="${mNo!=null}">
	      <tr>
	        <td colspan="2">
	        	<button type="button" class="btn btn-primary btn-lg" id="sBtn">바로구매</button>&nbsp;&nbsp;&nbsp;
	        	<button type="button" class="btn btn-info btn-lg" id="mBtn">장바구니</button>
	        </td>
	      </tr>
	      </c:if>
	      <tr>
	      	<td><h5>소개</h5></td>
	      	<td>${VIEW.biInfo}</td>
	      </tr>
	      <tr>
	      	<td></td>
	      	<td></td>
	      </tr>
	    </tbody>
	  </table>	
	</form>
</div>

<div class="container">
<!-- 유저가 이 책을 구매 확정하였고 리뷰를 이미 쓰지 않았을 경우 리뷰 작성 폼이 뜬다 -->
	<c:if test="${SHOW eq true}">
		<form action="${pageContext.request.contextPath}/order/review.web" id="rFrm">
		<table>
			<tr>
				<td>
					<h5>리뷰쓰기</h5>
				</td>
			</tr>
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
		      	<textarea class="form-control" rows="3" name="brRe" cols="150" id="brRe"></textarea>
		    </div>
				</td>
			</tr>
			<tr>
				<td>
					<input type="hidden" name="biNo" value="${VIEW.biNo}"/>
		    <button type="button" class="btn btn-primary" id="rBtn">등록</button>
				</td>
			</tr>
		</table>
		</form>
	</c:if>
</div>
<!-- 리뷰 목록 -->
<div class="container" id="rTa">
<hr/>
<h5>구매평</h5>
	<c:if test="${empty REVIEW}">
	아직 리뷰가 없습니다.
	</c:if>
  <c:forEach items="${REVIEW}" var="review">
	  <table class="table">
	      <tr>
	        <td>${review.brSco}점&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        ${review.brDate}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${review.mId}
	        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        <c:if test="${review.brMno eq mNo}">
	        <!-- 세션유저와 리뷰 작성자가 같을 경우에만 버튼이 뜬다 -->
	        <div style="float:right;">
		        <button type="button" class="btn btn-outline-primary" id="cBtn">수정</button>
		        &nbsp;
		        <button type="button" class="btn btn-outline-warning" id="dBtn">삭제</button>
	        </div>
	        </c:if>
	        </td>
	      </tr>
	      <tr>
	        <td>${review.brReBr}
	        </td>
	      </tr>
	  </table>
  </c:forEach>
</div>

</body>
</html>