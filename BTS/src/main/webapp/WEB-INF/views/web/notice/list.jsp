<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
#page {
	list-style:none;
	display:inline;
	align-content: center;
}

#page li{	
	margin:10px;
	float: left;
}

#page li a {
	float: left;
	padding:4px;
	margin-right:3px;
	width:15px;
	text-align:center;
	text-decoration:none;
}
</style>

<script>

	$(function(){
		
		var totalCount = "${page.totalCnt}";
		var nowPage = "${page.nowPage}";
		var page = new Page('page', totalCount, 10, 10, nowPage);
		page.setFunc("noticePage");
		page.regPaging();
		
		
		$("#btn_search").on("click", function(){
			var searchValue = $("#in_searchValue").val();
			if(searchValue == null || searchValue==""){
				return
			}
			window.location.href = "${pageContext.request.contextPath}/notice/list.web?searchValue="+searchValue
		})
		
		$("#btn_notice").on("click", function(){
			window.location.href = "${pageContext.request.contextPath}/notice/write.web";
		})
			
	})

		var category = "${page.category}";
		var searchValue = "${page.searchValue}"
		function noticePage(pageNum){
			if(category == "" || category == null){
				window.location.href = "${pageContext.request.contextPath}/notice/list.web?nowPage="+pageNum;			
			}else{
				window.location.href = "${pageContext.request.contextPath}/notice/list.web?searchValue="+searchValue+"&nowPage="+pageNum;
			}
		}
		
</script>


<body>

<br/>

<div class="container">
	<div class="row">
		<div class="col-md-3" style="text-align: center;">
			<a href="${pageContext.request.contextPath}/notice/list.web" style="font-size: 30px; color: black; text-decoration: none;">공 지 사 항</a>
		</div>
		<div class="col-md-3">
			<c:if test="${mGrade eq 0 }">
			<button id="btn_notice" type="button" class="btn btn-secondary btn-lg btn-block">공지작성</button>
			</c:if>
		</div>
		<div class="input-group col-md-6">
		   <div class="input-group-prepend">
    			<span class="input-group-text" id="inputGroup-sizing-default">제목 / 내용</span>
  		  </div>
		  <input type="text" id="in_searchValue" name="searchValue" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2" autocomplete="off" style="height: 48px;">
		  <div class="input-group-append">
		    <button id="btn_search" class="btn btn-outline-secondary" type="button" id="button-addon2" style="height: 48px;">검색</button>
		  </div>
		</div>
	</div>
</div>

<br/>

<div id="div_inquiryList" class="container">
    <div style="border-radius: 5px; border: 1px solid #343a40; padding-top: 10px; background-color: #343a40; color: white;">
		<!-- 문의내역 / 답글 폼 -->
			<table id="myInquiryList" class="table table-dark" style="text-align: center; margin-top: 10px;">
			  <thead>
			    <tr>
			      <th scope="col" style="width: 70%;">제목</th>
			      <th scope="col" style="width: 20%;">작성일</th>
			      <th scope="col" style="width: 10%;">조회수</th>
			    </tr>
			  </thead>
			  <tbody>
				  <c:forEach items="${list }" var="list">
				    <tr>
				      <td scope="row" style="text-align: left;"><a href="${pageContext.request.contextPath}/notice/detail.web?nNo=${list.nNo }" style="color: white;">${list.nTitle }</a></td>
				      <td>${list.strDate }</td>
				      <td>${list.nHit }</td>
					</tr>
				  </c:forEach>
			  <tr>
			  	<td colspan="4" style="text-align: center;"><ul id="page"><li>100<li></ul></td>
			  </tr>
			  </tbody>
			</table>
	</div>
</div>


</body>