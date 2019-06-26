<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript">



</script>


</head>
<body>

	
	<table class="table table-bordered">
		<h1 align="center">베스트 상품</h1>
	    <thead>
	      <tr align="center">
	      	<th>실시간 Click</th>
	        <th>월간 판매순위</th>
	        <th>주간 판매순위</th>
	        <th>일간 판매순위</th>
	      </tr>
	    </thead>
	    <tbody>
	      <tr align="center">
	      	<td>
	        	<table>	        		
		        	<c:forEach items="${realTime }" var="realTime">
		        	<tr>
		        		<td>
		        			<c:set var="rankRealTime" value="${rankRealTime + 1}" />
		        			${rankRealTime }위
		        		</td>
		        		<td width="50" height="100">
		        			<a href=" ${pageContext.request.contextPath}/order/hit.web?biNo=${realTime.biNo }">
				        		<img class="card-img-top" src="${realTime.biImg }" alt="${realTime.biTitle }">
				        	</a>
		        		</td>
		        		<td>
		        			<h6 class="card-title">
					            <a href=" ${pageContext.request.contextPath}/order/hit.web?biNo=${realTime.biNo }">${realTime.biTitle }</a>
					        </h6>
		        		</td>
		        	</tr>
		        	</c:forEach>
	        	</table>
	        </td>
	        <td>
	        	<table>	        		
		        	<c:forEach items="${month }" var="month">
		        	<tr>
		        		<td>
		        			<c:set var="rankMonth" value="${rankMonth + 1}" />
		        			${rankMonth }위
		        		</td>
		        		<td width="50" height="100">
		        			<a href=" ${pageContext.request.contextPath}/order/hit.web?biNo=${month.biNo }">
				        		<img class="card-img-top" src="${month.biImg }" alt="${month.biTitle }">
				        	</a>
		        		</td>
		        		<td>
		        			<h6 class="card-title">
					            <a href=" ${pageContext.request.contextPath}/order/hit.web?biNo=${month.biNo }">${month.biTitle }</a>
					        </h6>
		        		</td>
		        	</tr>
		        	</c:forEach>
	        	</table>
	        </td>
	        <td>
	        	<table>	        		
		        	<c:forEach items="${weekly }" var="weekly">
		        	<tr>
		        		<td>
		        			<c:set var="rankWeek" value="${rankWeek + 1}" />
		        			${rankWeek }위
		        		</td>
		        		<td width="50" height="100">
		        			<a href=" ${pageContext.request.contextPath}/order/hit.web?biNo=${weekly.biNo }">
				        		<img class="card-img-top" src="${weekly.biImg }" alt="${weekly.biTitle }">
				        	</a>
		        		</td>
		        		<td>
		        			<h6 class="card-title">
					            <a href=" ${pageContext.request.contextPath}/order/hit.web?biNo=${weekly.biNo }">${weekly.biTitle }</a>
					        </h6>
		        		</td>
		        	</tr>
		        	</c:forEach>
	        	</table>
	        </td>
	        <td>
	        	<table>
		        	<c:forEach items="${day }" var="day">
		        	<tr>
		        		<td>
		        			<c:set var="rankDay" value="${rankDay + 1}" />
		        			${rankDay }위
		        		</td>
		        		<td width="50" height="100">
		        			<a href=" ${pageContext.request.contextPath}/order/hit.web?biNo=${day.biNo }">
				        		<img class="card-img-top" src="${day.biImg }" alt="${day.biTitle }">
				        	</a>
		        		</td>
		        		<td>
		        			<h6 class="card-title">
					            <a href=" ${pageContext.request.contextPath}/order/hit.web?biNo=${day.biNo }">${day.biTitle }</a>
					        </h6>
		        		</td>
		        	</tr>
		        	</c:forEach>
	        	</table>
	        </td>
	      </tr>
	    
	    </tbody>
	</table>
	
	
</body>
</html>