<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/web/css/joinPage.css" rel="stylesheet">
</head>
<body>

	<div class="container contact">
	<div class="row">
		<!-- ���� BTS �Ұ� -->
		<div class="col-md-3">
			<div class="contact-info">
				<img src="${pageContext.request.contextPath}/resources/web/image/BTSLogo.png" alt="image"/>
				<h2>Welcome</h2>
				<h4>Team. PB</h4>
			</div>
		</div>
		
		<!-- ���� ������ -->
		<div class="col-md-9" style="text-align: left;">
			<form action="${pageContext.request.contextPath}/member/findIdProc.web">
	
			<div class="form-group row">
				<label class="control-label col-sm-3" style="text-align: center; margin-top: 6px;">ȸ������ ��й�ȣ��</label>
				<div class="col-sm-9 row">          
					${FINDPW.mPw } �Դϴ�
				</div>
			</div>
							
		</form>
		</div>
	</div>
	</div>
	
</body>
</html>