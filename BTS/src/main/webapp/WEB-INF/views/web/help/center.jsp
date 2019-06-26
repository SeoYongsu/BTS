<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="${pageContext.request.contextPath}/resources/web/css/helpCenter.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/web/js/helpCenter.js"></script>

<script>

	$(function(){
		
		$("#btn_inquiry").on("click", function(){
			$("#div_inquiryList").css("display", "none");
			$("#div_inquiry").toggle();
		})
		
		$("#btn_inquiryList").on("click", function(){
			$("#div_inquiry").css("display", "none");
			$("#div_inquiryList").toggle();
		})
		
		$(".btn_open").on("click", function(){
			var target = $(this).parent().attr("id");
			console.log(target);
			$("#answer"+target).toggle();
		})
		
		$(".btn_close").on("click", function(){
			 var target = $(this).parent().attr("id");
			 $("#answer"+target).css("display", "none");
			 
		})
		

	})

</script>

<body>

<!-- 1:1 문의접수 메세지 -->


<!-- 상단 뉴스바 -->
<div class="container" style="margin-bottom: -50px;">
	<div class="row mb-5">
	    <div class="col-12 py-4 bg-dark">
    	    <div class="row">
                <!--Breaking box-->
                <div class="col-md-3 col-lg-2 pr-md-0" style="height: 40px">
                    <div class="p-2 bg-primary text-white text-center breaking-caret"><span class="font-weight-bold">B.T.S</span></div>
                </div>
                <!--end breaking box-->
                <!--Breaking content-->
                <div class="col-md-9 col-lg-10 pl-md-4 py-2" style="height: 40px">
                    <div class="breaking-box">
                        <div id="carouselbreaking" class="carousel slide" data-ride="carousel">
                            <!--breaking news-->
                            <div class="carousel-inner" style="height: 40px">
                                <!--post-->
                                <div class="carousel-item">
                                    <a href="${pageContext.request.contextPath}/notice/list">
                                    <span class="position-relative mx-2 badge badge-primary rounded-0">Notice</span>
                                    </a> 
                                    <a class="text-white" href="${pageContext.request.contextPath}/notice/detail.web?nNo=${notice[0].nNo }">( ${notice[0].strDate } )&nbsp;${notice[0].nTitle }</a>
                                </div>
                                <!--post-->
                                <div class="carousel-item">
                                    <a href="${pageContext.request.contextPath}/notice/list">
                                    <span class="position-relative mx-2 badge badge-primary rounded-0">Notice</span>
                                    </a>
                                    <a class="text-white" href="${pageContext.request.contextPath}/notice/detail.web?nNo=${notice[1].nNo }">( ${notice[1].strDate } )&nbsp;${notice[1].nTitle }</a>
                                </div>
                                <!--post-->
                                <div class="carousel-item">
                                    <a href="${pageContext.request.contextPath}/notice/list">
                                    <span class="position-relative mx-2 badge badge-primary rounded-0">Notice</span>
                                    </a> 
                                    <a class="text-white" href="${pageContext.request.contextPath}/notice/detail.web?nNo=${notice[2].nNo }">( ${notice[2].strDate } )&nbsp;${notice[2].nTitle }</a>
                                </div>
                                <!--post-->
                                <div class="carousel-item">
                                    <a href="${pageContext.request.contextPath}/notice/list">
                                    <span class="position-relative mx-2 badge badge-primary rounded-0">Notice</span>
                                    </a> 
                                    <a class="text-white" href="${pageContext.request.contextPath}/notice/detail.web?nNo=${notice[3].nNo }">( ${notice[3].strDate } )&nbsp;${notice[3].nTitle }</a>
                                </div>
                                <!--post-->
                                <div class="carousel-item active">
                                    <a href="${pageContext.request.contextPath}/notice/list">
                                    <span class="position-relative mx-2 badge badge-primary rounded-0">Notice</span>
                                    </a>
                                    <a class="text-white" href="${pageContext.request.contextPath}/notice/detail.web?nNo=${notice[4].nNo }">( ${notice[4].strDate } )&nbsp;${notice[4].nTitle }</a>
                                </div>
                            </div>
                            <!--end breaking news-->
                            
                            <!--navigation slider-->
                            <div class="navigation-box p-2 d-none d-sm-block">
                                <!--nav left-->
                                <a class="carousel-control-prev text-primary" href="#carouselbreaking" role="button" data-slide="prev">
                                    <i class="fa fa-angle-left" aria-hidden="true"></i>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <!--nav right-->
                                <a class="carousel-control-next text-primary" href="#carouselbreaking" role="button" data-slide="next">
                                    <i class="fa fa-angle-right" aria-hidden="true"></i>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                            <!--end navigation slider-->
                        </div>
                    </div>
                </div>
			</div>
		</div>
	</div>
</div>

<!-- 중단메뉴바 -->
<div class="container">
      <div class="row">
        <div style="width: 100%">
          <nav>
            <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
              <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">로그인</a>
              <a class="nav-item nav-link" id="nav-about-tab" data-toggle="tab" href="#nav-about1" role="tab" aria-controls="nav-about" aria-selected="false">구매</a>
              <a class="nav-item nav-link" id="nav-about-tab" data-toggle="tab" href="#nav-about2" role="tab" aria-controls="nav-about" aria-selected="false">회원</a>
			  <!--               
			  <a class="nav-item nav-link" id="nav-about-tab" data-toggle="tab" href="#nav-about3" role="tab" aria-controls="nav-about" aria-selected="false">4</a>
              <a class="nav-item nav-link" id="nav-about-tab" data-toggle="tab" href="#nav-about4" role="tab" aria-controls="nav-about" aria-selected="false">5</a>
              <a class="nav-item nav-link" id="nav-about-tab" data-toggle="tab" href="#nav-about5" role="tab" aria-controls="nav-about" aria-selected="false">6</a>
               -->
            </div>
          </nav>
          <div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent">
          
            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
            	<ol style="margin-top: 20px;">
            		<li>회원가입을 아직 하지 않으셨나요? <a href="${pageContext.request.contextPath}/member/joinForm.web">&nbsp;여기를 클릭해 가입해보세요!</a></li>
            		<li>아이디를 잃어버리셨나요?<a href="${pageContext.request.contextPath}/member/findId.web">&nbsp;여기를 클릭해 찾아보세요!</a></li>
            		<li>비밀번호를 잃어버리셨나요?<a href="${pageContext.request.contextPath}/member/findPw.web">&nbsp;여기를 클릭해 찾아보세요!</a></li>
            	</ol>
            </div>
            
            <div class="tab-pane fade" id="nav-about1" role="tabpanel" aria-labelledby="nav-profile-tab">
              	<ol style="margin-top: 20px;">
            		<li>여러 상품을 둘러보시고 장바구니에 담아보세요!</li>
            		<li>할인중인 상품이 있습니다.</li>
            		<li>메인페이지에 추천상품을 확인해보세요!</li>
            		<li>진행중인 구매목록을 확인해보세요!<a href="${pageContext.request.contextPath}/member/myOrder.web">&nbsp;여기를 클릭해 확인해보세요!</a></li>
            		<li>구매내역을 확인해보세요!<a href="${pageContext.request.contextPath}/member/buyList.web">&nbsp;여기를 클릭해 확인해보세요!</a></li>
            		<li>구매취소를 하고싶으신가요?<a href="${pageContext.request.contextPath}/member/myOrder.web">&nbsp;여기를 클릭해 취소해보세요!</a></li>
            	</ol>
            </div>
            
            <div class="tab-pane fade" id="nav-about2" role="tabpanel" aria-labelledby="nav-contact-tab">
                 <ol style="margin-top: 20px;">
            		<li>회원탈퇴를 하고싶으신가요?<a href="${pageContext.request.contextPath}/member/myPage.web">&nbsp;여기를 클릭해 확인해보세요!</a></li>
            		<li>개인정보를 변경하고싶으신가요?<a href="${pageContext.request.contextPath}/member/myPage.web">&nbsp;여기를 클릭해 변경해보세요!</a></li>
            	</ol>
            </div>
            
			<!--             
			<div class="tab-pane fade" id="nav-about3" role="tabpanel" aria-labelledby="nav-about-tab">
            4라나온 자가 읎다
            </div>
            
            <div class="tab-pane fade" id="nav-about4" role="tabpanel" aria-labelledby="nav-about-tab">
            5늘까지 많은 이가 도전했지만
            </div>
            
            <div class="tab-pane fade" id="nav-about5" role="tabpanel" aria-labelledby="nav-about-tab">
            6월이 되서 이교육원을 떠날때 까지 이긴자는 없을 것이다
            </div> 
            -->
      
          </div>
        </div>
      </div>
</div>

<br/>

<c:if test="${mNo ne null }">
<div class="container">
	<div class="row">
		<div class="col-md-6">
			<button id="btn_inquiry" type="button" class="btn btn-secondary btn-lg btn-block">1 : 1 문의</button>
		</div>
		<div class="col-md-6">
			<button id="btn_inquiryList" type="button" class="btn btn-secondary btn-lg btn-block">1 : 1 문의내역</button>
		</div>
	</div>
</div>
</c:if>

<br/>

<div id="div_inquiry" class="container" style="display: none;">
    <div class="row" style="border-radius: 5px; border: 1px solid #343a40; padding-top: 10px; background-color: #343a40; color: white;">
      <div class="col-lg-12 col-lg-offset-2" style="width:100%;">
        <form id="frm_inquiry" method="post" action="${pageContext.request.contextPath}/help/inquiry.web">
        <div class="controls" style="padding: 10px;">
          <div class="row">
            <div class="col-md-9">
              <div class="form-group">
                <label for="mmTitle">문의제목</label>
                <input type="text" name="mmTitle" class="form-control" placeholder="제목을 입력하세요." required="required">
              </div>
            </div>
            <div class="col-md-3">
              <div class="form-group">
                <label for="mmCode">문의항목</label><br>
                <select name="mmCode" class="form-control">
                	<option value="B" selected="selected">제품문의</option>
                	<option value="A">시스템</option>
                	<option value="C">기타</option>
                </select>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <div class="form-group">
                <label for="mmBody">문의내용</label>
                <textarea name="mmBody" class="form-control" placeholder="내용을 작성해주세요." rows="4" style="resize: none;"></textarea>
              </div>
            </div>
            <div class="col-md-12" style="text-align: right;">
              <input type="submit" class="btn btn-success btn-send" value="문의제출">
            </div>
          </div>
        </div>
        </form>
      </div>
    </div>
  </div>
<br/>

<div id="div_inquiryList" class="container" style="display: none;">
    <div style="border-radius: 5px; border: 1px solid #343a40; padding-top: 10px; background-color: #343a40; color: white;">
		<!-- 본인 문의내역 -->
			<table id="myInquiryList" class="table table-dark" style="text-align: center; margin-top: 10px;">
			  <thead>
			    <tr>
			      <th scope="col" style="width: 15%;">문의일</th>
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
				      <td>${list.mmTitle }</td>
				      <td>${list.mmBody }</td>
				      <c:choose>
					  	<c:when  test="${list.mmUse eq 'Y'}">
					  		<td id="${index.index }"><button type="button" class="btn btn-success btn-sm btn_open">답변보기</button></td>
					  	</c:when>
					  	<c:when  test="${list.mmUse eq 'N'}">
					  		<td><button type="button" class="btn btn-secondary btn-sm" disabled="disabled">처리중</button></td>
					  	</c:when>
				 	  </c:choose>
				 	  </tr>
				 	  <c:if	test="${list.mmUse eq 'Y'}">
				 	  <tr id="answer${index.index }" style="background-color: #f2f2f2; color: black; display: none;">
				 	  	<td><i class="fas fa-check" style="color: green;"></i></td>
				 	  	<td>${list.mmReTitle }</td>
				 	  	<td>${list.mmReBody }</td>
				 	  	<td id="${index.index }"><button type="button" class="btn btn-warning btn-sm btn_close">닫기</button></td>
				 	  </tr>
				 	  </c:if>
				  </c:forEach>
			  </c:if>
			  </tbody>
			</table>
		<!-- 본인 문의내역 -->
	</div>
</div>

<br/>

</body>
