<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<body>

   <div class="bg-light border-right" id="sidebar-wrapper" style="width: 200px; text-align: center;">
      <div class="sidebar-heading" style="height: 50px;"><strong style="margin-top: 10px; margin-bottom:10px; font-size: 30px;">관리자 메뉴</strong></div>
      <div class="list-group list-group-flush">
        <a href="${pageContext.request.contextPath}/notice/list" class="list-group-item list-group-item-action bg-light">공지사항</a>
        <a href="${pageContext.request.contextPath}/chart/chartForm" class="list-group-item list-group-item-action bg-light">차트</a>
        <a href="${pageContext.request.contextPath}/manage/book" class="list-group-item list-group-item-action bg-light">제품관리</a>
        <a href="${pageContext.request.contextPath}/member/orderList" class="list-group-item list-group-item-action bg-light">주문리스트</a>
        <a href="${pageContext.request.contextPath}/member/memberList" class="list-group-item list-group-item-action bg-light">회원리스트</a>
        <a href="${pageContext.request.contextPath}/help/answer" class="list-group-item list-group-item-action bg-light">1:1문의</a>
      </div>
    </div>


</body>