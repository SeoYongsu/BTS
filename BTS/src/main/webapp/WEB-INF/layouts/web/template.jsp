<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="t"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html lang="kr">

<head>
	<meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/web/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/web/css/header.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/web/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/web/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/web/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/web/js/all.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/web/js/pageUtil.js"></script>
	
	<title>Book Tree Store</title>

<body>


<c:if test="${sessionScope.mGrade eq 0}">  
<table>
   <tr>
   	<th colspan="2" width="100%">
       <t:insertAttribute name="header"/>
   	</th>
   </tr>
   <tr>
      <td valign="top"><t:insertAttribute name="left"/></td>
      <td width="100%"><t:insertAttribute name="content"/></td>
   </tr>
</table>
</c:if>  
<c:if test="${sessionScope.mGrade ne 0}">  
       <t:insertAttribute name="header"/>
      <td><t:insertAttribute name="content"/></td>
</c:if>
</body>
</html>