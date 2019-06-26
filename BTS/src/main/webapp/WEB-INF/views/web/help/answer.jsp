<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
#page {
	list-style:none;
	display:inline;
}

#page li{	
	margin:10px;
    float: left;
}

#page li a {
	float:left;
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
		page.setFunc("bookManagePage");
		page.regPaging();
		
		$(".btn_open").on("click", function(){
			var target = $(this).parent().attr("id");
			$("#answer"+target).toggle();
		});
		
		$(".btn_submit").on("click", function(){
			var target = $(this).parent().attr("id");
			var mmReTitle = $("#mmReTitle"+target).val();
			var mmReBody = $("#mmReBody"+target).val();
			
			$.ajax({
				url : "${pageContext.request.contextPath}/help/answerSubmit.web",
				type : "POST", 
				data : {"mmNo" : target, "mmReTitle" : mmReTitle , "mmReBody" : mmReBody},
				success : function(){
					$(this).parents("tr").css("display", "none");
					location.reload();
					alert("답변을 등록하였습니다.");
				},
				error : function(xhr, status){
					alert(xhr+":"+status);
				}
			})
		});
		
		$("#btn_inquiryN").on("click", function(){
			window.location.href = "${pageContext.request.contextPath}/help/answer.web"
		});
		
		$("#btn_inquiryY").on("click", function(){
			window.location.href = "${pageContext.request.contextPath}/help/answer.web?category=use&searchValue=Y"	
		});
		
		$(".btn_close").on("click", function(){
			 $(this).parents("tr").toggle();
		});
		
		
		$("#btn_search").on("click", function(){
			var searchValue = $("#in_searchValue").val();
			
			if(searchValue == null || searchValue == ""){
				return
			}else{
			 window.location.href = "${pageContext.request.contextPath}/help/answer.web?category=name&searchValue="+searchValue;
			}
			
		});
		
	})

		var category = "${page.category}";
		var searchValue = "${page.searchValue}"
		function bookManagePage(pageNum){
			if(category == "" || category == null){
				window.location.href = "${pageContext.request.contextPath}/help/answer.web?nowPage="+pageNum;			
			}else{
				window.location.href = "${pageContext.request.contextPath}/help/answer.web?category="+category+"&searchValue="+searchValue+"&nowPage="+pageNum;
			}
		}
		
</script>


<body>

<br/>

<div class="container">
	<div class="row">
		<div class="col-md-3">
			<button id="btn_inquiryN" type="button" class="btn btn-secondary btn-lg btn-block">1 : 1 문의(미답변)</button>
		</div>
		<div class="col-md-3">
			<button id="btn_inquiryY" type="button" class="btn btn-secondary btn-lg btn-block">1 : 1 문의(답변)</button>
		</div>
		<div class="input-group col-md-6">
		   <div class="input-group-prepend">
    			<span class="input-group-text" id="inputGroup-sizing-default">유저명</span>
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
			      <th scope="col" style="width: 10%;">문의일</th>
			      <th scope="col" style="width: 10%;">작성자</th>
			      <th scope="col" style="width: 20%;">제목</th>
			      <th scope="col" style="width: 50%;">내용</th>
			      <th scope="col" style="width: 10%;">처리여부</th>
			    </tr>
			  </thead>
			  <tbody>
			  <c:if test="${list ne null }">
				  <c:forEach items="${list }" var="list" varStatus="index">
				    <tr>
				      <td scope="row">${list.strDate }</td>
				      <td>${list.mName }</td>
				      <td>${list.mmTitle }</td>
				      <td>${list.mmBody }</td>
				      <c:if test="${list.mmUse eq 'N' }">
				  		  <td id="${index.index }"><button type="button" class="btn btn-success btn-sm btn_open">답변작성</button></td>
				  		  
					 	  <tr id="answer${index.index }" style="background-color: #f2f2f2; color: black; display: none;">
					 	  	<td colspan="2"><i class='fas fa-exchange-alt'></i></td>
					 	  	<td><input type="text" id="mmReTitle${list.mmNo }" name="mmReTitle" value="${list.mName }님의 문의답변입니다."  style="width: 100%"></td>
					 	  	<td><input type="text" id="mmReBody${list.mmNo }" name="mmReBody" value="" style="width: 100%"></td>
					 	  	<td id="${list.mmNo }"><button type="button" class="btn btn-warning btn-sm btn_submit">답변등록</button></td>
					 	  </tr>	
					 	  	 	  
				      </c:if>
				      <c:if test="${list.mmUse eq 'Y' }">
				  		  <td id="${index.index }"><button type="button" class="btn btn-success btn-sm btn_open">답변보기</button></td>  
				  		  
					  		<tr id="answer${index.index }" style="background-color: #f2f2f2; color: black; display: none;">
					 	  	<td colspan="2"><i class="fas fa-check" style="color: green;"></i></td>
					 	  	<td>${list.mmReTitle }</td>
					 	  	<td>${list.mmReBody }</td>
					 	  	<td><button type="button" class="btn btn-warning btn-sm btn_close">닫기</button></td>
				 	  </tr>
				      </c:if>
				 	  </tr>
				  </c:forEach>
			  </c:if>
			  <tr style="text-align: center;">
			  	<td colspan="4"><ul id="page"><li>100<li></ul></td>
			  </tr>
			  </tbody>
			</table>
	</div>
</div>


</body>