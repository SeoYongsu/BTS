<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>

	$(function(){
		
		$("#btn_back").on("click", function(){
			window.location.href = "${pageContext.request.contextPath}/notice/list.web"
		})
		
		$("#btn_delete").on("click", function(){
			var nNo = ${detail.nNo};
			window.location.href = "${pageContext.request.contextPath}/notice/delete.web?nNo="+nNo;
		})
		
		$("#btn_modify").on("click", function(){
			var nNo = ${detail.nNo};
			window.location.href = "${pageContext.request.contextPath}/notice/modify.web?nNo="+nNo;
		})
		
	})

</script>


<body>
<br>
<div class="container">
    <div class="row">
      <div class="col-lg-12 col-lg-offset-2">
        <div class="messages"></div>
        <div class="controls">
          <div class="row" style="margin-bottom: 20px;">
            <div class="col-md-9">
                <span style="font-size: 23px;">${detail.nTitle }</span>
            </div>
            <div class="col-md-3" style="text-align: center; padding-top: 10px;">
                <span style="font-size: 15px;">작성일 :  ${detail.strDate } / 조회수 : ${detail.nHit }</span>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <div class="form-group">
                <textarea id="form_message" name="message" class="form-control" rows="20"  readonly="readonly" style="resize: none; background-color: white;">${detail.nBody }</textarea>
              </div>
            </div>
            <div class="col-md-12" style="text-align: right;">
               <c:if test="${mGrade eq 0 }">
              <input id="btn_modify" type="button" class="btn btn-secondary btn-send" value="수정">
              <input id="btn_delete" type="button" class="btn btn-secondary btn-send" value="삭제">
              </c:if>
              <input id="btn_back" type="button" class="btn btn-secondary btn-send" value="목록">
            </div>
          </div>
        </div>
      	<br>
      </div>
    </div>
  </div>

</body>
