<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>

#navbarResponsive ul ul {
	display:none;
	position:absolute;
	background-color:#353535;
}
#navbarResponsive ul li:hover ul {
 	display: block;
}
#nav_menu ul ul li {
	float:none;
}

</style>
<!-- 네이게이터 -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" style="height: 50px;">
  	<!-- 좌측상단 로고/프로젝트명 -->
    <a class="navbar-brand" href="${pageContext.request.contextPath}/main"><strong>&nbsp;&nbsp;&nbsp;B.T.S</strong></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
    <div class="collapse navbar-collapse" id="navbarResponsive" style="margin: auto;">
      <ul class="navbar-nav ml-auto">
      	<!-- 우측상단 메인메뉴 -->
      	<c:if test="${ empty sessionScope.mNo  }">
	        <li class="nav-item">
	          <a class="nav-link" href="${pageContext.request.contextPath}/member/loginForm.web">로그인<span class="sr-only">(current)</span></a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="${pageContext.request.contextPath}/member/joinForm.web">회원가입</a>
	        </li>
        </c:if>
        
        <c:if test="${ not empty sessionScope.mNo  }">
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/member/logout.web">로그아웃</a>
        </li>
        <li class="nav-item">
          <p class="nav-link">마이페이지</p>
          <ul class="navbar-nav ml-auto">
          	<li class="nav-item">
          		<a class="nav-link" href="${pageContext.request.contextPath}/member/myPage.web">내정보수정</a>
          	</li>
          	<li class="nav-item">
          		<a class="nav-link" href="${pageContext.request.contextPath}/member/pwConfirm.web">비밀번호변경</a>
          	</li>
          	<li class="nav-item">
          		<a class="nav-link" href="${pageContext.request.contextPath}/member/myOrder.web">주문목록</a>
          	</li>
          	<li class="nav-item">
          		<a class="nav-link" href="${pageContext.request.contextPath}/member/buyList.web">구매목록</a>
          	</li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/order/cart.web">장바구니</a>
        </li>
        </c:if>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/notice/list.web">공지사항</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/help/center.web">고객센터</a>
        </li>
      </ul>
    </div>
</nav>
<!-- 이벤트 슬라이드 -->
<header id="header">
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
	  <ol class="carousel-indicators">
	    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
	    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
	    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
	  </ol>
	  <div class="carousel-inner" role="listbox">
	    <!-- 1 슬라이드 -->
	    <div class="carousel-item active" style="background-image: url('https://source.unsplash.com/RCAhiGJsUUE/1920x1080')">
	      <div class="carousel-caption d-none d-md-block">
	        <h3 class="display-4">B.T.S</h3>
	        <p class="lead">Team.PB product</p>
	      </div>
	    </div>
	    <!-- 2 슬라이드 -->
	    <div class="carousel-item" style="background-image: url('https://source.unsplash.com/wfh8dDlNFOk/1920x1080')">
	      <div class="carousel-caption d-none d-md-block">
	        <h3 class="display-4">Book Tree Store</h3>
	        <p class="lead">다양한 도서를 한곳에</p>
	      </div>
	    </div>
	    <!-- 3 슬라이드 -->
	    <div class="carousel-item" style="background-image: url('https://source.unsplash.com/O7fzqFEfLlo/1920x1080')">
	      <div class="carousel-caption d-none d-md-block">
	        <h3 class="display-4">B.T.S EVENT</h3>
	        <p class="lead">이벤트 따위는 없습니데 닝겐</p>
	      </div>
	    </div>
	  </div>
	  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
	        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	        <span class="sr-only">Previous</span>
	      </a>
	  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
	        <span class="carousel-control-next-icon" aria-hidden="true"></span>
	        <span class="sr-only">Next</span>
	      </a>
	</div>
	
	<!-- 하단 서브 메뉴바 -->
	<nav id="under_navbar" class="navbar navbar-expand-lg navbar-light bg-light">
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          장르별보기
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="${pageContext.request.contextPath}/BookList/bookList.web?nowPage=1&biGenre=A0">베스트셀러</a>
	          <a class="dropdown-item" href="${pageContext.request.contextPath}/BookList/bookList.web?nowPage=1&biGenre=A1">소설</a>
	          <a class="dropdown-item" href="${pageContext.request.contextPath}/BookList/bookList.web?nowPage=1&biGenre=A2">잡지</a>
	          <a class="dropdown-item" href="${pageContext.request.contextPath}/BookList/bookList.web?nowPage=1&biGenre=A3">만화</a>
	          <a class="dropdown-item" href="${pageContext.request.contextPath}/BookList/bookList.web?nowPage=1&biGenre=A4">종교</a>
	          <a class="dropdown-item" href="${pageContext.request.contextPath}/BookList/bookList.web?nowPage=1&biGenre=A5">IT</a>
	          <a class="dropdown-item" href="${pageContext.request.contextPath}/BookList/bookList.web?nowPage=1&biGenre=A6">취미</a>
	          <a class="dropdown-item" href="${pageContext.request.contextPath}/BookList/bookList.web?nowPage=1&biGenre=A7">건강</a>
	          <a class="dropdown-item" href="${pageContext.request.contextPath}/BookList/bookList.web?nowPage=1&biGenre=A8">청소년</a>
	          <a class="dropdown-item" href="${pageContext.request.contextPath}/BookList/bookList.web?nowPage=1&biGenre=A9">예술</a>
	          <a class="dropdown-item" href="${pageContext.request.contextPath}/BookList/bookList.web?nowPage=1&biGenre=A10">사회</a>
	        </div>
	     	      <li class="nav-item">
	        <a class="nav-link" href="${pageContext.request.contextPath}/BookList/best100.web?nowPage=1">Best Book</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="${pageContext.request.contextPath}/BookList/newBook.web?nowPage=1">New Book</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">Hot Book</a>
	      </li>
	    </ul>
	    
	    <form action="${pageContext.request.contextPath}/BookList/searchList.web"  class="form-inline my-2 my-lg-0" method="get">
	      <input type="text" name="nowPage" hidden="hidden" value="1">
	      <input class="form-control mr-sm-2" name="searchValue" type="search" placeholder="도서검색" aria-label="Search">
	      <button id="btn_search2" class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
	    </form>
	  </div>
	</nav>
	
	<div style="position: fixed; bottom: 20px; right: 20px;">
		<a href="#header"><i class="fas fa-arrow-up"></i></a>
	</div>
</header>
    