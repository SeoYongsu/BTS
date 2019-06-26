<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<link href="${pageContext.request.contextPath}/resources/web/css/homeMain.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/web/js/homeMain.js"></script>


<body>
<!-- 실시간 검색어 -->
<div class="col-md-9 col-lg-10 pl-md-4 py-2" style="height: 40px" align="right">
	<span class="font-weight-bold">실검 TOP5</span>
	<div class="breaking-box">
		<div id="carouselbreaking" class="carousel slide" data-ride="carousel">
			<!--breaking news-->
			<div class="carousel-inner" style="height: 40px">
				<!--post-->
				<div class="carousel-item">
					<span class="position-relative mx-2 badge badge-primary rounded-0">2위</span>
					${silgum[1].searchValue }                                 
				</div>
				<!--post-->
				<div class="carousel-item">
					<span class="position-relative mx-2 badge badge-primary rounded-0">3위</span>
					${silgum[2].searchValue }                                   
				</div>
				<!--post-->
				<div class="carousel-item">
					<span class="position-relative mx-2 badge badge-primary rounded-0">4위</span>
					${silgum[3].searchValue }                                  
				</div>
				<!--post-->
				<div class="carousel-item">
					<span class="position-relative mx-2 badge badge-primary rounded-0">5위</span>
					${silgum[4].searchValue }                               
				</div>
				<!--post-->
				<div class="carousel-item active">
					<span class="position-relative mx-2 badge badge-primary rounded-0">1위</span>
					${silgum[0].searchValue }                                 
				</div>
			</div>
		<!--end breaking news-->        
		</div>
	</div>
</div>


<!--Choice 3 슬라이드형 -->
<div class="container">
	<h1 class="my-3">실시간 클릭 click!! TOP 5
		<small style="font-size: 20px">
			<fmt:formatDate value="${realtime[0].now}" pattern="yyyy년  MM월  dd일 KK:mm"/>
		</small>
	</h1>
	
	<div id="myCarousel" class="carousel slide carousel-fade" data-ride="carousel">
	  <div class="carousel-inner">
	 
	  	<!-- 슬라이드 아이템 1 -->
	    <div class="carousel-item active">
	      <div class="mask flex-center">
	        <div class="container">
	          <div class="row align-items-center">
	            <div class="col-md-7 col-12 order-md-1 order-2">
	              <h4>${realtime[0].biTitle }<br><small style="font-size: 20px;">${realtime[0].biWriter } 作</small></h4>
	              <p>${realtime[0].biInfo }</p>
	              <a href=" ${pageContext.request.contextPath}/order/hit.web?biNo=${realtime[0].biNo }">바로구매</a> </div>
	            <div class="col-md-5 col-12 order-md-2 order-1">
	            	<img src="${realtime[0].biImg }" class="mx-auto" alt="slide">
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	    
	    <!-- 슬라이드 아이템 2 -->
	    <div class="carousel-item">
	      <div class="mask flex-center">
	        <div class="container">
	          <div class="row align-items-center">
	            <div class="col-md-7 col-12 order-md-1 order-2">
	              <h4>${realtime[1].biTitle }<br><small style="font-size: 20px;">${realtime[1].biWriter } 作</small></h4>
	              <p>${realtime[1].biInfo }</p>
	              <a href=" ${pageContext.request.contextPath}/order/hit.web?biNo=${realtime[1].biNo }">바로구매</a> </div>
	            <div class="col-md-5 col-12 order-md-2 order-1">
	            	<img src="${realtime[1].biImg }" class="mx-auto" alt="slide">
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	    
	    <!-- 슬라이드 아이템 3 -->
	    <div class="carousel-item">
	      <div class="mask flex-center">
	        <div class="container">
	          <div class="row align-items-center">
	            <div class="col-md-7 col-12 order-md-1 order-2">
	              <h4>${realtime[2].biTitle }<br><small style="font-size: 20px;">${realtime[2].biWriter } 作</small></h4>
	              <p>${realtime[2].biInfo }</p>
	              <a href=" ${pageContext.request.contextPath}/order/hit.web?biNo=${realtime[2].biNo }">바로구매</a> </div>
	            <div class="col-md-5 col-12 order-md-2 order-1">
	            	<img src="${realtime[2].biImg }" class="mx-auto" alt="slide">
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	    
	    <!-- 슬라이드 아이템 4 -->
	    <div class="carousel-item">
	      <div class="mask flex-center">
	        <div class="container">
	          <div class="row align-items-center">
	            <div class="col-md-7 col-12 order-md-1 order-2">
	              <h4>${realtime[3].biTitle }<br><small style="font-size: 20px;">${realtime[3].biWriter } 作</small></h4>
	              <p>${realtime[3].biInfo }</p>
	              <a href=" ${pageContext.request.contextPath}/order/hit.web?biNo=${realtime[3].biNo }">바로구매</a> </div>
	            <div class="col-md-5 col-12 order-md-2 order-1">
	            	<img src="${realtime[3].biImg }" class="mx-auto" alt="slide">
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	    
	    <!-- 슬라이드 아이템 5 -->
	    <div class="carousel-item">
	      <div class="mask flex-center">
	        <div class="container">
	          <div class="row align-items-center">
	            <div class="col-md-7 col-12 order-md-1 order-2">
	              <h4>${realtime[4].biTitle }<br><small style="font-size: 20px;">${realtime[4].biWriter } 作</small></h4>
	              <p>${realtime[4].biInfo }</p>
	              <a href=" ${pageContext.request.contextPath}/order/hit.web?biNo=${realtime[4].biNo }">바로구매</a> </div>
	            <div class="col-md-5 col-12 order-md-2 order-1">
	            	<img src="${realtime[4].biImg }" class="mx-auto" alt="slide">
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	  
	  <!-- prev / next -->
	  <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev"> 
	  	<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="sr-only">Previous</span> 
	  </a> 
	  <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next"> 
	  <span class="carousel-control-next-icon" aria-hidden="true"></span> 
	  <span class="sr-only">Next</span> </a> 
	</div>
</div>
<!--slide end--> 


<!-- 유저별 추천 도서 4 -->

<c:if test="${sessionScope.mNo ne null }">
	<c:if test="${fn:length(recomend) ne 0 }">
	<div  class="container">
	  <h3 class="my-4">${mName}님을 위한 추천도서</h3>
	  <div class="row">
		<c:forEach items="${recomend }" var="list">
		    <div class="col-md-3 col-sm-6 mb-4">
		      <div class="card h-100">
		        <a href=" ${pageContext.request.contextPath}/order/hit.web?biNo=${list.biNo }">
		        	<img class="card-img-top" src="${list.biImg }"  alt="${list.biTitle }" width="250" height="340">
		        </a>
		        <div class="card-body">
		          <h4 class="card-title">
		            <a href=" ${pageContext.request.contextPath}/order/hit.web?biNo=${list.biNo }">${list.biTitle }</a>
		          </h4>
		          <p class="card-text">${list.biInfo }</p> 
		        </div>
		      </div>
		    </div>	
		</c:forEach>
	  </div>
	</div>
	</c:if>
</c:if>


<!-- BEST 4 카드형 -->
<div class="container">

	<h1 class="my-3">B.T.S  Best 4
		<small style="font-size: 20px">최다 초이스</small>
	</h1>
	
	 <div class="row">
	 	<c:forEach items="${best4 }" var="best">
		    <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
		      <div class="card h-100">
		        <a href=" ${pageContext.request.contextPath}/order/hit.web?biNo=${best.biNo }">
		        	<img class="card-img-top" src="${best.biImg }"  alt="${best.biTitle }" width="250" height="340">
		        </a>
		        <div class="card-body">
		          <h4 class="card-title">
		            <a href=" ${pageContext.request.contextPath}/order/hit.web?biNo=${best.biNo }">${best.biTitle }</a>
		          </h4>
		          <p class="card-text">${best.biInfo }</p> 
		        </div>
		      </div>
		    </div>
  		</c:forEach>
	</div>
</div>

<hr/>

<!-- 밑으로 개인작업용 페이지 링크 -->
<!-- 서용수 주간 판매량 -->
	<div class="container">

	<h1 class="my-3">B.T.S  Best 4
		<small style="font-size: 20px">주간 판매순위</small>
	</h1>
	
	 <div class="row">
	 
	    <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
	      <div class="card h-100">
	        <a href=" ${pageContext.request.contextPath}/order/hit.web?biNo=${weekly5[0].biNo }">
	        	<img class="card-img-top" src="${weekly5[0].biImg }"  alt="${weekly5[0].biTitle }" width="250" height="340">
	        </a>
	        <div class="card-body">
	          <h4 class="card-title">
	            <a href=" ${pageContext.request.contextPath}/order/hit.web?biNo=${weekly5[0].biNo }">${weekly5[0].biTitle }</a>
	          </h4>
	          <p class="card-text">${weekly5[0].biInfo }</p> 
	        </div>
	      </div>
	    </div>
	    
	    <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
	      <div class="card h-100">
	        <a href=" ${pageContext.request.contextPath}/order/hit.web?biNo=${weekly5[1].biNo }">
	        	<img class="card-img-top" src="${weekly5[1].biImg }" alt="${weekly5[1].biTitle }" width="250" height="340">
	        </a>
	        <div class="card-body">
	          <h4 class="card-title">
	            <a href=" ${pageContext.request.contextPath}/order/hit.web?biNo=${weekly5[1].biNo }">${weekly5[1].biTitle }</a>
	          </h4>
	          <p class="card-text">${weekly5[1].biInfo }</p>
	        </div>
	      </div>
	    </div>
	    
	    <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
	      <div class="card h-100">
	        <a href=" ${pageContext.request.contextPath}/order/hit.web?biNo=${weekly5[2].biNo }">
	        	<img class="card-img-top" src="${weekly5[2].biImg }" alt="${weekly5[2].biTitle }" width="250" height="340">
	        </a>
	        <div class="card-body">
	          <h4 class="card-title">
	            <a href=" ${pageContext.request.contextPath}/order/hit.web?biNo=${weekly5[2].biNo }">${weekly5[2].biTitle }</a>
	          </h4>
	          <p class="card-text">${weekly5[2].biInfo }</p>
	        </div>
	      </div>
	    </div>
	    
	    <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
	      <div class="card h-100">
	        <a href=" ${pageContext.request.contextPath}/order/hit.web?biNo=${weekly5[3].biNo }">
	        	<img class="card-img-top" src="${weekly5[3].biImg }" alt="${weekly5[3].biTitle }" width="250" height="340">
	        </a>
	        <div class="card-body">
	          <h4 class="card-title">
	            <a href=" ${pageContext.request.contextPath}/order/hit.web?biNo=${weekly5[3].biNo }">${weekly5[3].biTitle }</a>
	          </h4>
	          <p class="card-text">${weekly5[3].biInfo }</p>
	        </div>
	      </div>
	    </div>
	</div>
</div>

<hr/>
<!-- 서용수 주간 판매량 -->
<!-- 서용수 일간 판매량 (ex오늘의책)-->
	<div class="container">

	<h1 class="my-3">B.T.S  Best 4
		<small style="font-size: 20px">오늘의 책!!!</small>
	</h1>
	
	 <div class="row">
	 
	    <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
	      <div class="card h-100">
	        <a href=" ${pageContext.request.contextPath}/order/hit.web?biNo=${day5[0].biNo }">
	        	<img class="card-img-top" src="${day5[0].biImg }"  alt="${day5[0].biTitle }" width="250" height="340">
	        </a>
	        <div class="card-body">
	          <h4 class="card-title">
	            <a href=" ${pageContext.request.contextPath}/order/hit.web?biNo=${day5[0].biNo }">${day5[0].biTitle }</a>
	          </h4>
	          <p class="card-text">${day5[0].biInfo }</p> 
	        </div>
	      </div>
	    </div>
	    
	    <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
	      <div class="card h-100">
	        <a href=" ${pageContext.request.contextPath}/order/hit.web?biNo=${day5[1].biNo }">
	        	<img class="card-img-top" src="${day5[1].biImg }" alt="${day5[1].biTitle }" width="250" height="340">
	        </a>
	        <div class="card-body">
	          <h4 class="card-title">
	            <a href=" ${pageContext.request.contextPath}/order/hit.web?biNo=${day5[1].biNo }">${day5[1].biTitle }</a>
	          </h4>
	          <p class="card-text">${day5[1].biInfo }</p>
	        </div>
	      </div>
	    </div>
	    
	    <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
	      <div class="card h-100">
	        <a href=" ${pageContext.request.contextPath}/order/hit.web?biNo=${day5[2].biNo }">
	        	<img class="card-img-top" src="${day5[2].biImg }" alt="${day5[2].biTitle }" width="250" height="340">
	        </a>
	        <div class="card-body">
	          <h4 class="card-title">
	            <a href=" ${pageContext.request.contextPath}/order/hit.web?biNo=${day5[2].biNo }">${day5[2].biTitle }</a>
	          </h4>
	          <p class="card-text">${day5[2].biInfo }</p>
	        </div>
	      </div>
	    </div>
	    
	    <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
	      <div class="card h-100">
	        <a href=" ${pageContext.request.contextPath}/order/hit.web?biNo=${day5[3].biNo }">
	        	<img class="card-img-top" src="${day5[3].biImg }" alt="${day5[3].biTitle }" width="250" height="340">
	        </a>
	        <div class="card-body">
	          <h4 class="card-title">
	            <a href=" ${pageContext.request.contextPath}/order/hit.web?biNo=${day5[3].biNo }">${day5[3].biTitle }</a>
	          </h4>
	          <p class="card-text">${day5[3].biInfo }</p>
	        </div>
	      </div>
	    </div>
	</div>
</div>

</body>
</html>
