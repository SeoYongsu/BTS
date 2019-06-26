
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>test DB List</h3>
	
	<c:forEach var="test" varStatus="testNo" items="${list }">
	<span>${testNo.count }번째 등장인물의 이름은 ${test.name } 나이는 ${test.age }</span><br/>
	</c:forEach>


</body>
</html>