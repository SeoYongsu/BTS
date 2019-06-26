<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>test DB - Book List</h3>
	
	<table border="1">
		<thead>
			<tr>
				<th>이미지</th>
				<th>장르</th>
				<th>제목</th>
				<th>저자</th>
				<th>출판일</th>
				<th>출판사</th>
				<th>정가</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="item">
				<tr>
 					<td>
						<img src="${item.biImg }" alt="img" style="size: 25px;">
					</td>
					<td>${item.biGenre}</td>
					<td>${item.biTitle}</td> 
					<td>${item.biWriter}</td>
					<td>${item.biDate}</td>
					<td>${item.biPub}</td>
					<td>${item.biPrice}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>


</body>
</html>