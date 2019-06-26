<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<script>

	$(function(){
		
		$("#btn_back").on("click", function(){
			window.history.back();
		})
		
		
		$("#btn_upload").on("click", function(){
			var title = $("#nTitle").val();
			var body = $("#nBody").val();
			console.log(title);
			console.log(body);
			
			if(title=="" || title == null || body == "" || body == null){
				return;
			}
			
			$("#notice_frm").submit();
		})
		
	})

</script>

<body>
<br>
<div class="container">
    <div class="row">
      <div class="col-lg-12 col-lg-offset-2">
      	<form id="notice_frm" action="${pageContext.request.contextPath}/notice/writeProc.web">
        <div class="controls">
          <div class="row" style="margin-bottom: 20px;">
            <div class="col-md-12">
                <input type="text" id="nTitle" name="nTitle" value="" class="form-control" style="width: 100%;" placeholder="제목을 작성해주세요.">
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <div class="form-group">
                <textarea id="nBody" name="nBody" class="form-control" rows="20" style="resize: none; background-color: white;"></textarea>
              </div>
            </div>
            <div class="col-md-12" style="text-align: right;">
              <input id="btn_upload" type="button" class="btn btn-secondary btn-send" value="등록">
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