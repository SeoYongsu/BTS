<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<script>

	$(function(){
		
		$("#btn_back").on("click", function(){
			window.history.back();
		})
		
		$("#btn_delete").on("click", function(){
			var nNo = ${detail.nNo};
			window.location.href = "${pageContext.request.contextPath}/notice/delete.web?nNo="+nNo;
		})
		
		$("#btn_modify").on("click", function(){
			var nNo = ${detail.nNo};
			var frmData = $("#notice_submit").serialize();
			$.ajax({
				url : "${pageContext.request.contextPath}/notice/update.web",
				type : "POST", 
				data : frmData,
				success : function(){
					alert("공지사항이 수정되었습니다.");
					window.location.href = "${pageContext.request.contextPath}/notice/detail.web?nNo="+nNo;
				},
				error : function(xhr, status){
					alert(xhr+":"+status);
				}
			})
			
		})
		
	})

</script>

<body>
<br>
<div class="container">
    <div class="row">
      <div class="col-lg-12 col-lg-offset-2">
      	<form id="notice_submit">
        <div class="controls">
          <div class="row" style="margin-bottom: 20px;">
            <div class="col-md-9">
            	<input type="text" name="nNo" value="${detail.nNo}" hidden="hidden">
                <input type="text" id="nTitle" name="nTitle" value="${detail.nTitle }" class="form-control" style="width: 100%;">
            </div>
            <div class="col-md-3" style="text-align: center; padding-top: 10px;">
                <span style="font-size: 15px;">작성일 :  ${detail.strDate } / 조회수 : ${detail.nHit }</span>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <div class="form-group">
                <textarea id="nBody" name="nBody" class="form-control" rows="20" style="resize: none; background-color: white;">${detail.nBody }</textarea>
              </div>
            </div>
            <div class="col-md-12" style="text-align: right;">
              <input id="btn_modify" type="button" class="btn btn-secondary btn-send" value="수정완료">
              <input id="btn_delete" type="button" class="btn btn-secondary btn-send" value="삭제">
              <input id="btn_back" type="button" class="btn btn-secondary btn-send" value="취소">
            </div>
          </div>
        </div>
        </form>
      	<br>
      </div>
    </div>
  </div>

</body>