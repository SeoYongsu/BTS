<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
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


/* 테이블 - CSS */
.table > tbody > tr > td {
     vertical-align: middle;
}

</style>
<script type="text/javascript">


	$(function(){
		var totalCount = "${page.totalCnt}";
		var nowPage = "${page.nowPage}";
		var page = new Page('page', totalCount, 10, 10, nowPage);
		page.setFunc("bookManagePage");
		page.regPaging();
		
		
		$(".btn_modifyMod").on("click", function(){

			$("#modi_frm").remove();
			
			var targetIndex = $(this).parents("tr").attr("id");
			var bmNo = $("#bmNo"+targetIndex).html();
			var biTitle = $("#biTitle"+targetIndex).html();
			var biPub = $("#biPub"+targetIndex).html();
			var biPrice = $("#biPrice"+targetIndex).html();
			var bmHave = $("#bmHave"+targetIndex).html();
			var bmCount = $("#bmCount"+targetIndex).html();
			var bmHit = $("#bmHit"+targetIndex).html();
			var biGenre = $("#biGenre"+targetIndex).html();
			var bmSale = $("#bmSale"+targetIndex).html();
			var bmUse = $("#bmUse"+targetIndex).html();
			var biUse = $("#biUse"+targetIndex).html();
			
			
			var modiHtml ="<tr id='modi_frm' style='background-color: grey;'>"+
			"<td><input type='text' name='bmNo' value='"+bmNo+"' readonly='readonly' hidden='hidden' /><i class='fas fa-exchange-alt'></i></td>"+
			"<td>"+biTitle+"</td>"+
			"<td>"+biGenre+"</td>"+
			"<td>"+biPub+"</td>"+
			"<td>"+biPrice+"</td>"+
			"<td><input id='in_bmHave' type='text' name='bmHave' value='"+bmHave+"' maxlength = '3' onkeypress='keyFilter(this)' /></td>"+
			"<td>"+bmCount+"</td>"+
			"<td>"+bmHit+"</td><td>"
							

			switch (bmSale) {
					case '0':
				    modiHtml = modiHtml+"<select name='bmSale'>"+
													"<option value='0' selected='selected'>0</option>"+
													"<option value='10'>10%</option>"+
													"<option value='20'>20%</option>"+
													"<option value='30'>30%</option>"+
													"<option value='50'>50%</option>"+
													"</select></td>";
													  break;
		 	 		case '10%':
				    modiHtml = modiHtml+"<select name='bmSale'>"+
				   									"<option value='0'>0</option>"+
													"<option value='10' selected='selected'>10%</option>"+
													"<option value='20'>20%</option>"+
													"<option value='30'>30%</option>"+
													"<option value='50'>50%</option>"+
													"</select></td>";
													  break;
					case '20%':
				    modiHtml = modiHtml+"<select name='bmSale'>"+
													"<option value='0'>0</option>"+
													"<option value='10'>10%</option>"+
													"<option value='20' selected='selected'>20%</option>"+
													"<option value='30'>30%</option>"+
													"<option value='50'>50%</option>"+
													"</select></td>";
													 break;
					case '30%':
				    modiHtml = modiHtml+"<select name='bmSale'>"+
													"<option value='0'>0</option>"+
													"<option value='10'>10%</option>"+
													"<option value='20'>20%</option>"+
													"<option value='30' selected='selected'>30%</option>"+
													"<option value='50'>50%</option>"+
													"</select></td>";
			   										 break;						
					case '50%':
				    modiHtml = modiHtml+"<select name='bmSale'>"+
													"<option value='0'>0</option>"+
													"<option value='10'>10%</option>"+
													"<option value='20'>20%</option>"+
													"<option value='30'>30%</option>"+
													"<option value='50' selected='selected'>50%</option>"+
													"</select></td>";
													 break;
				}
			
				if(bmUse == 'Y'){
				modiHtml	= modiHtml+"<td><select name='bmUse'>"+
												"<option value='Y' selected='selected'>Y</option>"+
												"<option value='N'>N</option>"+
												"</select></td>"
				}else{
					modiHtml = modiHtml+"<td><select name='bmUse'>"+
													"<option value='Y'>Y</option>"+
													"<option value='N' selected='selected'>N</option>"+
													"</select></td>"
				}
												
				if(biUse == 'Y'){
					modiHtml	= modiHtml+"<td><select name='biUse'>"+
													"<option value='Y' selected='selected'>Y</option>"+
													"<option value='N'>N</option>"+
													"</select></td>"
				}else{
					modiHtml = modiHtml+"<td><select name='biUse'>"+
													"<option value='Y'>Y</option>"+
													"<option value='N' selected='selected'>N</option>"+
													"</select></td>"
				}
				
				modiHtml = modiHtml+"<td><button id='"+targetIndex+"' type='button' class='btn btn-light btn-sm btn_modifySubmit'>수정완료</button></td>";
				$("#"+targetIndex).after(modiHtml);
		}); /* 수정폼 생성 */
		
		
		/* ajax */
		$(document).on("click", ".btn_modifySubmit", function(){
			var frmData = $("#frm_bm").serialize();
			$.ajax({
				url : "${pageContext.request.contextPath}/manage/modiBook.web",
				type : "POST", 
				data : frmData,
				success : function(){
					$("#modi_frm").remove();
					location.reload();
					alert("정보가 수정되었습니다.");
				},
				error : function(xhr, status){
					alert(xhr+":"+status);
				}
			});
		}) /* 정보수정 */
		
				
	});
	
	/* 페이지 이동 도우미 */
	var category = "${page.category}";
	var searchValue = "${page.searchValue}"
	
	function bookManagePage(pageNum){
		if(category == "" || category == null){
			window.location.href = "${pageContext.request.contextPath}/manage/book.web?&nowPage="+pageNum;			
		}else{
			window.location.href = "${pageContext.request.contextPath}/manage/book.web?category="+category+"&searchValue="+searchValue+"&nowPage="+pageNum;
		}
	}
	
	/* 기본정렬 */
	function basicPage(){
		window.location.href = "${pageContext.request.contextPath}/manage/book.web"
	}
	
	/* 장르선택 페이지 */
	function genrePage(){
		var searchValue = $("#genre_selector option:selected").val();
		window.location.href = "${pageContext.request.contextPath}/manage/book.web?category=genre&searchValue="+searchValue;
	}
	
	/* 유저 검색 페이지 */
	function userSearchPage(){
		var category = $("#category_selector option:selected").val();
		var searchValue = $("#searchValue").val();
		window.location.href = "${pageContext.request.contextPath}/manage/book.web?category="+category+"&searchValue="+searchValue;
	}
	
	/* 책 정보 수정 */
	function checkFrm(){
		var targetIndex = $(".btn_modifySubmit").attr("id");
		var ori_bmHave = $("#bmHave"+targetIndex).html();
		var in_bmHave = $("#in_bmHave").val();
		
		if(ori_bmHave > in_bmHave){
			alert("현재수량보다 낮게 설정할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	/* 재고수정란 숫자입력만 가능한 필터 */
	function keyFilter(key) {
		    if (event.keyCode >= 48 && event.keyCode <= 57) {
		        return true;
		    } else {
		        event.returnValue = false;
		    }
	}


</script>

<body>

<div class="my-3 p-3 bg-white rounded shadow-sm" style="width: auto;">
	<h3 class="border-bottom border-gray pb-2 mb-0">도서재고관리</h3>
	<form id="frm_bm" name="frm_bm" onsubmit="return checkFrm();">
		<table class="table table-dark rounded"  style="text-align: center;">
		  <thead>
					<tr>
						<th scope="col">코드</th>
						<th scope="col">제목</th>
						<th scope="col">장르</th>
						<th scope="col">출판사</th>
						<th scope="col">정가</th>
						<th scope="col">재고수량</th>
						<th scope="col">누적판매량</th>
						<th scope="col">조회수</th>
						<th scope="col">할인율</th>
						<th scope="col">노출여부</th>
						<th scope="col">판매여부</th>
						<th scope="col">수정</th>
					</tr>
		  </thead>
		  <tbody>
					<c:forEach items="${list }" var="items" varStatus="numbering">
					<tr id="${numbering.index }">
						<td id="bmNo${numbering.index }">${items.bmNo }</td>
						<td id="biTitle${numbering.index }">${items.biTitle }</td>
						<c:choose>
							<c:when  test="${items.biGenre eq 'A0'}"><td id='biGenre${numbering.index }'>베스트</td></c:when>
							<c:when  test="${items.biGenre eq 'A1'}"><td id='biGenre${numbering.index }'>소설</td></c:when>
							<c:when  test="${items.biGenre eq 'A2'}"><td id='biGenre${numbering.index }'>잡지</td></c:when>
							<c:when  test="${items.biGenre eq 'A3'}"><td id='biGenre${numbering.index }'>만화</td></c:when>
							<c:when  test="${items.biGenre eq 'A4'}"><td id='biGenre${numbering.index }'>종교</td></c:when>
							<c:when  test="${items.biGenre eq 'A5'}"><td id='biGenre${numbering.index }'>IT</td></c:when>
							<c:when  test="${items.biGenre eq 'A6'}"><td id='biGenre${numbering.index }'>취미</td></c:when>
							<c:when  test="${items.biGenre eq 'A7'}"><td id='biGenre${numbering.index }'>건강</td></c:when>
							<c:when  test="${items.biGenre eq 'A8'}"><td id='biGenre${numbering.index }'>청소년</td></c:when>
							<c:when  test="${items.biGenre eq 'A9'}"><td id='biGenre${numbering.index }'>역사</td></c:when>
							<c:when  test="${items.biGenre eq 'A10'}"><td id='biGenre${numbering.index }'>사회</td></c:when>
						</c:choose>
						<td id="biPub${numbering.index }">${items.biPub }</td>
						<td id="biPrice${numbering.index }">${items.biPrice }</td>
						<td id="bmHave${numbering.index }">${items.bmHave }</td>
						<td id="bmCount${numbering.index }">${items.bmCount }</td>
						<td id="bmHit${numbering.index }">${items.bmHit }</td>
						<c:if test="${items.bmSale eq 0}">
							<td id='bmSale${numbering.index }'>${items.bmSale }</td>
						</c:if>
						<c:if test="${items.bmSale ne 0}">
							<td id='bmSale${numbering.index }'>${items.bmSale }%</td>
						</c:if>
						<td id='bmUse${numbering.index }'>${items.bmUse }</td>
						<td id='biUse${numbering.index }'>${items.biUse }</td>
						<td><button type="button" class="btn btn-light btn-sm btn_modifyMod">수정</button></td>
					</tr>
					</c:forEach>		
					<tr>
						<td colspan="4"><ul id="page"><li>100<li></ul></td>
						<td colspan="2">
							<div style="margin-top: 13px;">
								<button type="button" onclick="basicPage();">기본조회</button>
							</div>
						</td>
						<td colspan="2">
							<div style="margin-top: 13px;">
								<select id="genre_selector">
									<option value="A0">베스트</option>
									<option value="A1">소설</option>
									<option value="A2">잡지</option>
									<option value="A3">만화</option>
									<option value="A4">종교</option>
									<option value="A5">IT</option>
									<option value="A6">취미</option>
									<option value="A7">건강</option>
									<option value="A8">청소년</option>
									<option value="A9">역사</option>
									<option value="A10">사회</option>
								</select>
								<button type="button" onclick="genrePage();">장르조회</button>
							</div>
						</td>
						<td colspan="4">
							<div style="margin-top: 13px;">
								<select id="category_selector">
									<option value="title" selected="selected">제목</option>
									<option value="writer">저자</option>
									<option value="pub">출판사</option>
								</select>
								<input id="searchValue" type="text"/>
								<button type="button" onclick="userSearchPage();">조회</button>
							</div>
						</td>
					</tr>
		  </tbody>
		</table>
	</form>
</div>


	
	
</body>
