<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

<script>
	alert("요청결과가 정상적으로 처리되었습니다.");
	location.href="${pageContext.request.contextPath}/member/myOrder.web";
</script>

</body>
</html>