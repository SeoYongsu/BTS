<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestList</title>
</head>
<body>

	<h3>testList</h3>
	
	<span>이름 : ${list[0].name }</span>
	<br>
	<span>나이 : ${list[0].age }</span>
	<br>
	<span> -------------------</span>
	<br>
	<span>이름 : ${list[1].name }</span>
	<br>
	<span>나이 : ${list[1].age }</span>
	
</body>
</html>