<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
        
    .ui-autocomplete {
    max-height: 100px;
    overflow-y: auto;
    /* prevent horizontal scrollbar */
    overflow-x: hidden;
  }
  /* IE 6 doesn't support max-height
   * we use height instead, but this forces the menu to always be this tall
   */
  * html .ui-autocomplete {
    height: 100px;
    
    </style>
    
    
<script type="text/javascript">

// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
function fncGetUserList(currentPage) {
	$("#currentPage").val(currentPage)
	
	var menu = $("#menu111").attr("data-menu");
	
	alert($("#menu111").attr("data-menu"));
	
	$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu="+menu).submit();
  	
}

$(function() {
	 
	var menu = $("#menu111").attr("data-menu");
	
	 $( "button.btn.btn-default" ).on("click" , function() {
		//Debug..
		//alert(  $( "td.ct_btn01:contains('검색')" ).html() );
		fncGetUserList(1);
	});
	
	 
	if(menu== "search"){
				
		$( "td:nth-child(2)").on("click" , function() {
		//console.log($(this).prevAll());
		
 		var proTranCode = $(this).attr("data-proTranCode");
		
		//alert(proTranCode);
 		
 		if(proTranCode == '000'){
			
				//Debug..
				alert( $( this ).text().trim() );
				
				self.location ="/product/getProduct?prodNo="+$(this).attr("data-prodNo");
				
		}if(proTranCode != '000'){
			
 		alert("품절된 상품입니다");
		}
		});
		
		$( "td:nth-child(2)" ).css("color" , "red");
		$( "td:nth-child(2)" ).css("background-color" , "yellow");
		
// 		$( "td:nth-child(2)" ).css("color" , "blue");
// 		$( "td:nth-child(2)" ).css("background-color" , "yellow");
		
// 		if(proTranCode != '000'){
// 		}
		}
	
	 
	if(menu=="manage"){
		
		
	$( "td:nth-child(2)" ).on("click" , function() {
		
	var proTranCode = $(this).attr("data-proTranCode");
	
	if(proTranCode == '000'){
			//Debug..
			
			//alert( $( this ).text().trim() );
			
			
			
			var prodNo = $(this).attr("data-prodNo");
			
			
			//alert("prodNo: " + prodNo);
			
			$.ajax(
			  {
				url: "/product/json/getProduct/"+prodNo,
				method: "GET",
				dataType: "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				
				success :  function(JSONData , status) {
					
					//alert("JSONData : \n"+JSONData);
					
					var displayValue = "<h6>"
					
						+"상품번호 : "+JSONData.prodNo+"<br/>"
						+"상품명: "+JSONData.prodName+"<br/>"
						+"상품 상세정보: "+JSONData.prodDetail+"<br/>"
						+"가격 : "+JSONData.price+"<br/>"
						+"제조일자 : "+JSONData.manuDate+"<br/>"
						+"<br/>"
						+"<br/>"
						+"<a href=\"/product/updateProduct?prodNo="+JSONData.prodNo+"\">수정하기</a>" + "<br/>"					
						+"</h6>"
						
						//alert(displayValue);
						
					$("h6").remove();
					$( "#"+prodNo+"" ).html(displayValue);
				}								
			});	
			
	} if(proTranCode == '003'){
		
		
		alert("상품수정이 불가합니다");
	}
			//self.location ="/product/updateProduct?prodNo="+$(this).find("input[name=prodNo]").val();
			
	
	});
	
	$("td:nth-child(2)" ).css("color" , "blue");
	$( "td:nth-child(2) " ).css("background-color" , "gray");
	
	
	$( "td:nth-child(6)"  ).on("click" , function() {
		//Debug..
		alert( $( this ).text().trim());
		
		alert($(this).attr("data-menu"));
		
	    self.location ="/purchase/updateTranCodeByProd?ProTranCode=" +$(this).attr("data-proTranCode") +
	    		                                                 "&prodNo=" + $(this).attr("data-prodNo") + "&menu=" +$(this).attr("data-menu");				
		//self.location ="/purchase/updateTranCodeByProd?ProTranCode="+$(this).attr(data-proTranCode)+$(this).attr(data-tranNo);
				
});
		
	}
	

	
	//==> UI 수정 추가부분  :  userId LINK Event End User 에게 보일수 있도록 
	
	$( "td:nth-child(6)"  ).css("color" , "green");
	
	$("h7").css("color" , "red");
	
	
	//==> 아래와 같이 정의한 이유는 ??
	//==> 아래의 주석을 하나씩 풀어 가며 이해하세요.					
	$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
	//console.log ( $(".ct_list_pop:nth-child(1)" ).html() );
	//console.log ( $(".ct_list_pop:nth-child(2)" ).html() );
	//console.log ( $(".ct_list_pop:nth-child(3)" ).html() );
	//console.log ( $(".ct_list_pop:nth-child(4)" ).html() ); //==> ok
	//console.log ( $(".ct_list_pop:nth-child(5)" ).html() ); 
	//console.log ( $(".ct_list_pop:nth-child(6)" ).html() ); //==> ok
	//console.log ( $(".ct_list_pop:nth-child(7)" ).html() ); 
});	

$( function() {
    var availableTags = [
      "애견패드 소형 50매",
      "구루머스 치킨 우유껌 7개입",
      "페페로니 오메가3 소고기",
      "도모다찌 고구마 사시미",
      "카리에스 덴탈껌 6개",
      "네튜럴코어 홀리스틱 베네 M32 멀티프로테스인",
      "네튜럴코어 시니어 오리 고구마",
      "네튜럴코어 퍼피 작은 알갱이"     
    ];
    $( "#searchKeyword" ).autocomplete({
      source: availableTags
    });
  } );
  
</script>
</head>

<body>
<jsp:include page="/layout/toolbar.jsp" />

<div class="container">

<input type="hidden" name="menu" id="menu" value="${param.menu}"> 

<div class="page-header text-info">

	     	<c:if test="${menu=='manage' }"> 
						<h3>상품 관리</h3>
					
					</c:if> 
					
 					<c:if test="${menu=='search' }"> 
 					
								<h3>상품 목록조회</h3>

			</c:if> 
</div>

		<div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>

	<div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			
			
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
					<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
				    <option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
				    <option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>상품가격</option>
					</select>
				  </div>
				  
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    
				    <div class="ui-widget">
				    <input class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    					 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				   </div>
				  </div>
				  
				    <button type="button" class="btn btn-default">검색</button>
				    
				     <input type="hidden" id="currentPage" name="currentPage" value=""/>
				    
</form>
</div>
</div>

 <table class="table table-hover table-striped" >
			
  		<thead>
          <tr>
            <th align="center">상품번호</th>         
            <th align="left" >상품명</th>         
            <th align="left">가격</th>           
            <th align="left">등록일</th>           
            <th align="left">현재상태</th>            
            <th align="left">배송상태</th>  
          </tr>
        </thead>

<tbody>


	     <c:set var="i" value="0" />
            <%--i에 0값을 넣고 prod에서 list사이즈까지 돈다
            도는데 i에 값을 1씩 추가 한다.  --%>
        <c:forEach var="product" items="${list}">
             
        <c:set var="i" value="${ i+1 }" />
        <tr>
        <td align="center">${ i }</td>   
        <td align="left"  class="prodNo"  title="Click : 상품정보 확인" data-prodNo="${product.prodNo}" data-proTranCode="${product.proTranCode}" > ${product.prodName}
        
        <i id="${product.prodNo}" > </i> 
                      
        <input type="hidden" class="prodNo" data-prodNo="${product.prodNo}" >
        
        </td>
        
<%--         <i class="click" id="${product.prodNo}"> --%>
            
        
<!--         </i>                                    	 -->      
		<td align="left">${product.price }</td>
		<td align="left">${product.regDate }</td>		
		
		<td align="left" class="proTranCode" >
		
		<c:if test = "${product.proTranCode=='000'}">
			
			판매중
			
			</c:if>
			
			<c:if test = "${product.proTranCode=='001'}">
			
			구매완료 
			
			<c:if test="${menu=='manage' }">
			
			<td align="left" data-proTranCode="${product.proTranCode}" data-prodNo="${product.prodNo}" data-menu="${menu}">	
			
	<!-- 	<a href="/purchase/updateTranCodeByProd?ProTranCode=${product.proTranCode}&prodNo=${product.prodNo}&menu=manage">
			
			</a>-->
			
			배송하기
			
		 </td>
			</c:if>
			</c:if>
			
		<c:if test = "${product.proTranCode=='002'}">
			
			배송중
		</c:if>
		<c:if test = "${product.proTranCode=='003'}">
			
			판매완료
		</c:if>
		</td>	
	
<!-- 			  		<i class="click"></i> -->
<%-- 			  		<input type="hidden" value="${product.prodNo}"> --%>
<!-- 			  		</td> -->
	</tr>
	
<!-- 	<tr> -->
			
<%-- 		<td id="${product.prodNo}" colspan="11" bgcolor="D6D7D6" height="1"> --%>

<!-- 		</td> -->
<!-- 	</tr> -->
	
	</c:forEach>

</tbody>

 </table>

</div>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center" id="menu111" data-menu="${menu}">
			 <input type="hidden" id="currentPage" name="currentPage" value=""/>
		
			<jsp:include page="../common/pageNavigator_new.jsp"/>
    	</td>
	</tr>
</table>


</body>
</html>


<!-- <div style="width:98%; margin-left:10px;"> -->

<!-- <form name="detailForm" > -->

<!-- <table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0"> -->
<!-- 	<tr> -->
<!-- 		<td width="15" height="37"> -->
<!-- 			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/> -->
<!-- 		</td> -->
<!-- 		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;"> -->
<!-- 			<table width="100%" border="0" cellspacing="0" cellpadding="0"> -->
<!-- 				<tr> -->
<!-- 					<td width="93%" class="ct_ttl01"> -->
					
					
<%-- 					<c:if test="${menu=='manage' }"> --%>
<!-- 							상품 관리 -->
					
<%-- 					</c:if> --%>
<%-- 					<c:if test="${menu=='search' }"> --%>
<!-- 							상품 목록 조회 -->
<%-- 					</c:if> --%>
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 			</table> -->
<!-- 		</td> -->
<!-- 		<td width="12" height="37"> -->
<!-- 			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/> -->
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- </table> -->


<!-- <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;"> -->
<!-- 	<tr> -->

	
<!-- 		<td align="right"> -->
<!-- 			<select name="searchCondition" class="ct_input_g" style="width:80px"> -->
<%-- 				<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option> --%>
<%-- 				<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option> --%>
<%-- 				<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>상품가격</option> --%>
		
<!-- 		</select> -->
<%-- 		<input type="text" name="searchKeyword" value="${! empty search.searchKeyword ? search.searchKeyword : ""}"   class="ct_input_g" style="width:200px; height:19px" > --%>
<!-- 		</td> -->
		
		
		
<!-- 		<td align="right" width="70"> -->
<!-- 			<table border="0" cellspacing="0" cellpadding="0"> -->
<!-- 				<tr> -->
<!-- 					<td width="17" height="23"> -->
<!-- 						<img src="/images/ct_btnbg01.gif" width="17" height="23"> -->
<!-- 					</td> -->
<!-- 					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;"> -->
<!-- 						검색 -->
<!-- 					</td> -->
<!-- 					<td width="14" height="23"> -->
<!-- 						<img src="/images/ct_btnbg03.gif" width="14" height="23"> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 			</table> -->
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- </table> -->


<!-- <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;"> -->
<!-- 	<tr> -->
<%-- 		<td colspan="11" >전체  ${resultPage.totalCount } 건수, 현재 ${resultpage.currentPage } 페이지</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td class="ct_list_b" width="100">상품번호</td> -->
<!-- 		<td class="ct_line02"></td> -->
<!-- 		<td class="ct_list_b" width="150">상품명</td> -->
<!-- 		<td class="ct_line02"></td> -->
<!-- 		<td class="ct_list_b" width="150">가격</td> -->
<!-- 		<td class="ct_line02"></td> -->
<!-- 		<td class="ct_list_b">등록일</td>	 -->
<!-- 		<td class="ct_line02"></td> -->
<!-- 		<td class="ct_list_b">현재상태</td>	 -->
<!-- 		<td class="ct_list_b">배송상태</td>	 -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td colspan="11" bgcolor="808285" height="1"></td> -->
<!-- 	</tr> -->
	
	
	
<%-- 				<c:set var="i" value="0" /> --%>
<%--             i에 0값을 넣고 prod에서 list사이즈까지 돈다
<%--             도는데 i에 값을 1씩 추가 한다.  --%> 
<%--              <c:forEach var="product" items="${list}"> --%>
             
<%--                <c:set var="i" value="${ i+1 }" /> --%>
<!--                <tr class="ct_list_pop"> -->
<%--                   <td align="center">${ i }</td> --%>
<!--                   <td></td> -->
                  
<!--                    <td align="left"> -->
                  
<%--                   ${product.prodName} --%>
                  
<%--                   <input type="hidden" id="prodNo" name="prodNo" value="${product.prodNo}" /> --%>
                 
                  
<!-- 				</td> -->
		
<!-- 		<td></td> -->
<%-- 		<td align="left">${product.price }</td> --%>
<!-- 		<td></td> -->
<%-- 		<td align="left">${product.regDate }</td> --%>
<!-- 		<td></td> -->
<!-- 		<td align="left"> -->
		
<%-- 		<c:if test = "${product.proTranCode=='000'}"> --%>
			
<!-- 			판매중 -->
<%-- 			</c:if> --%>
<%-- 			<c:if test = "${product.proTranCode=='001'}"> --%>
			
<!-- 			구매완료  -->
			
<%-- 				<c:if test="${menu=='manage' }"> --%>
<%-- 			<td align="left" data-proTranCode="${product.proTranCode}" data-prodNo="${product.prodNo}" data-menu="${menu}">	 --%>
			
<!-- 	<!-- 	<a href="/purchase/updateTranCodeByProd?ProTranCode=${product.proTranCode}&prodNo=${product.prodNo}&menu=manage"> -->
			
<!-- 			</a>--> 
			
<!-- 			배송하기 -->
			
<!-- 		 </td> -->
<%-- 			</c:if> --%>
<%-- 			</c:if> --%>
			
<%-- 		<c:if test = "${product.proTranCode=='002'}"> --%>
			
<!-- 			배송중 -->
<%-- 		</c:if> --%>
<%-- 		<c:if test = "${product.proTranCode=='003'}"> --%>
			
<!-- 			판매완료 -->
<%-- 		</c:if> --%>
<!-- 		</td>	 -->
<!-- 	</tr> -->
	
<!-- 	<tr> -->
			
<%-- 		<td id="${product.prodNo}" colspan="11" bgcolor="D6D7D6" height="1"> --%>

<!-- 		</td> -->
<!-- 	</tr> -->
	
<%-- 	</c:forEach> --%>
<!-- </table> -->

<!-- <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;"> -->
<!-- 	<tr> -->
<%-- 		<td align="center" id="menu111" data-menu="${menu}"> --%>
<!-- 			 <input type="hidden" id="currentPage" name="currentPage" value=""/> -->
		
<%-- 			<jsp:include page="../common/pageNavigator.jsp"/>	 --%>
<!--     	</td> -->
<!-- 	</tr> -->
<!-- </table> -->
<!-- <!--  페이지 Navigator 끝 --> 

<!-- </form> -->

<!-- </div> -->












