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
		$(".cBtn").click(function(){//장바구니 수량 수정
			var biNo=$(this).attr("param");
			var boOrdercount=$(this).siblings("input").val();
			$(location).attr("href","${pageContext.request.contextPath}/order/cartcha.web?biNo="+biNo+"&boOrdercount="+boOrdercount);
		});
		$(".dBtn").click(function(){//장바구니 상품 삭제
			var biNo=$(this).attr("param");
			$(location).attr("href","${pageContext.request.contextPath}/order/cartdel.web?biNo="+biNo);
		});
		$("#bBtn").click(function(){//결제창으로 이동
			$(location).attr("href","${pageContext.request.contextPath}/order/cartbuy.web");
		});
	});		
	</script>
</head>
<body>
 <div class="container">
  <h4>장바구니</h4>
  <table class="table">
    <thead>
      <tr>
        <th>상품</th>
        <th>가격</th>
        <th>수량</th>
        <th>합계</th>
        <th>삭제</th>
      </tr>
    </thead>
    <tbody>
	<c:forEach var="item" items="${CART}">
      <tr>
        <td><img alt="img" src="${item.biImg}" height="70"> ${item.biTitle}</td>
        <td>정가&nbsp;&nbsp;&nbsp; ${item.biPrice}<br/>판매가&nbsp;&nbsp;&nbsp;${item.biSalPrice}</td>
        <td><input type="number" value="${item.boOrdercount}" min="1" max="100" name="boOrdercount"><br/>
        <button type="button" class="btn btn-outline-info cBtn" param="${item.biNo}">수정</button></td>
        <td>${item.biSalPrice*item.boOrdercount}</td>
        <td>
        	<button type="button" class="btn btn-outline-danger dBtn" param="${item.biNo}" name="">삭제</button>
        </td>
      </tr>
	</c:forEach>
      <tr>
      	<td colspan="5" align="right"><h5>합계&nbsp;&nbsp;&nbsp; ${SUM}&nbsp;&nbsp;&nbsp;
      	<button type="button" class="btn btn-outline-primary" id="bBtn">모두 구매</button>
      	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h5></td>
      </tr>
    </tbody>
  </table>
</div>

</body>
</html>
