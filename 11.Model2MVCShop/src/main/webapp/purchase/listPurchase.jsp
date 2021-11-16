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
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
<script type="text/javascript">


function fncGetUserList(currentPage) {
	
	$("#currentPage").val(currentPage)
	
	var menu = $("#menu111").attr("data-menu");
			
	$("form").attr("method" , "POST").attr("action" ,"/purchase/listPurchase" ).submit();
  		
}

$(function() {
	 
	var menu = $("#menu111").attr("data-menu");
	
	 $( "button.btn.btn-default").on("click" , function() {
		//Debug..
		//alert(  $( "td.ct_btn01:contains('검색')" ).html() );
		fncGetUserList(1);
});

	 $(".tranNo" ).on("click" , function() {
			//Debug..
			
			alert("---tranNo---"+ $(this).attr("data-tranNo") );
			
			var tranNo =  $(this).attr("data-tranNo");
						
			$.ajax(
					  {
						url: "/purchase/json/getPurchase/"+tranNo,
						method: "GET",
						dataType: "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success :  function(JSONData , status) {
							
						//	alert("JSONData : \n"+JSONData);
							
							var displayValue = "<h6>"
							
								+"물품번호 : "+JSONData.purchaseProd.prodNo+"<br/>"
								+"구매자아이디: "+JSONData.buyer.userId+"<br/>"
								+"구매방법: "+JSONData.paymentOption+"<br/>"
								+"구매자이름 : "+JSONData.receiverName+"<br/>"
								+"구매자연락처 : "+JSONData.receiverPhone+"<br/>"
								+"구매자주소 : "+JSONData.divyAddr+"<br/>"
								+"구매 요청사항 : "+JSONData.divyRequest+"<br/>"
								+"주문일: "+JSONData.orderDate+"<br/>"
								+"배송 희망일 : "+JSONData.divyDate+"<br/>"
								+"<br/>"
								+"<br/>"
								+"<a href=\"/purchase/updatePurchase?tranNo="+JSONData.tranNo+"\">구매정보 수정하기</a>	" + "<br/>"					
								+"</h3>"
								
								//alert(displayValue);
								
							$("h6").remove();
							$( "#"+tranNo+"" ).html(displayValue);
						}								
					});			
			
			//누르면 getPurchase로 가고 가서 수정 버튼 누르면 updatePurchase
			
			//self.location ="/purchase/getPurchase?tranNo="+$(this).attr("data-tranNo");
		
			
	});
	 
	 $("td:nth-child(2)").on("click" , function() {
			//Debug..
			alert( $(this).attr("data-userId"));
			
			var userId =  $(this).attr("data-userId");
						
			$.ajax(
					  {
						url: "/user/json/getUser/"+userId,
						method: "GET",
						dataType: "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success :  function(JSONData , status) {
							
						//	alert("JSONData : \n"+JSONData);
							
							var displayValue = "<h6>"
							
								+"아이디 : "+JSONData.userId+"<br/>"
								+"이  름 : "+JSONData.userName+"<br/>"
								+"이메일 : "+JSONData.email+"<br/>"
								+"ROLE : "+JSONData.role+"<br/>"
								+"등록일 : "+JSONData.regDateString+"<br/>"
								+"<br/>"
								+"<br/>"
								+"<a href=\"/user/updateUser?userId="+JSONData.userId+"\">회원정보 수정하기</a>" + "<br/>"					
								+"</h3>"
								
								//alert(displayValue);
								
							$("h6").remove();
							$( "#"+userId+"" ).html(displayValue);
						}								
					});			
			//self.location ="/user/getUser?userId="+$(this).attr("data-userId");
			//userId 누르면 getUser 수정버튼 누르면 UpdateUser
						
	});
	 
	 $("td:nth-child(6)").on("click" , function() {
			//Debug..
			
			if($(this).attr("data-delivered") != '003'){
				
						
			alert( $( this ).text().trim());
			
			
			//alert($(this).attr("data-menu"));
			
		    self.location ="/purchase/updateTranCode?TranCode=" +$(this).attr("data-TranCode") 
		    		                                            +"&tranNo=" + $(this).attr("data-tranNo") + "&menu=" +$(this).attr("data-menu");
			}	
			//self.location ="/purchase/updateTranCodeByProd?ProTranCode="+$(this).attr(data-proTranCode)+$(this).attr(data-tranNo);
			
	});
	 
		 $(".tranNo" ).css("color" , "pink");
		 $(".tranNo" ).css("background-color" , "black");
		 
		 $( "td:nth-child(2)").css("color" , "white");
		 $( "td:nth-child(2)").css("background-color" , "brown");
		 
		 $("td:nth-child(6)").css("color" , "yellow");
		 $("td:nth-child(6)").css("background-color" , "gray");
		 
		 $("h7").css("color" , "red");
		
		
		//==> 아래와 같이 정의한 이유는 ??
		//==> 아래의 주석을 하나씩 풀어 가며 이해하세요.					
		$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
	 
});
	
	 

</script>
</head>

<body>
<jsp:include page="/layout/toolbar.jsp" />

<div class="container">

<div class="page-header text-info">

	     	구매이력조회
</div>

<div class="row">
	    
		<div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
	 </div>
		    
		    
</div>

 <table class="table table-hover table-striped" >
			
  		<thead>
          <tr>
         
            <th align="center">NO</th>   
            <th align="left" >회원ID</th>        
            <th align="left">회원명</th>         
            <th align="left">전화번호</th>          
            <th align="left">배송현황</th>           
            <th align="left">배송정보수정</th>  
          </tr>
        </thead>

<tbody>

<c:set var="i" value="0" />

	<c:forEach var="purchase" items="${list}">
	
		<c:set var="i" value="${i+1}"/>
        <tr>
       
		<td align="left" class="tranNo"  title="Click : 상품정보 확인" data-tranNo="${purchase.tranNo}">${ i }
<%-- 		<td align="left"  class="tranNo"  title="Click : 상품정보 확인" data-tranNo="${purchase.tranNo}" > --%>
        
        <i id="${purchase.tranNo}" > </i> 
        
<%-- 		<td align="center" data-tranNo="${purchase.tranNo}">${ i }</td>  --%>
<!-- 		<td> -->	 
   		<input type="hidden" class="tranNo" data-tranNo="${purchase.tranNo}" />
		 
		</td>
		
		<td align="left"  class="userId"  title="Click : 상품정보 확인" data-userId="${purchase.buyer.userId}">${purchase.buyer.userId}
        
        <i id="${purchase.buyer.userId}" > </i> 
                      
  		<input type="hidden" class="userId" value="${purchase.buyer.userId}" />
        
        </td>
        

<%-- 		<td align="left" data-userId="${purchase.buyer.userId}"> --%>
		
<%-- 			${purchase.buyer.userId} --%>
			
<%-- 			<input type="hidden" name="userId" value="${purchase.buyer.userId}" /> --%>
		
<!-- 			<!--  <a href="/user/getUser?userId=${purchase.buyer.userId}">${purchase.buyer.userId}</a>--> 
			
<!-- 		</td> -->
<!-- 		<td></td> -->
		
		<td align="left">${purchase.receiverName}</td>
		<td align="left">${purchase.receiverPhone}</td>
		<td align="left">현재
				
		<c:if test = "${purchase.tranCode=='000'}">
			
			판매중
			
		</c:if>
		<c:if test = "${purchase.tranCode=='001'}">
			
			구매 완료
						
		</c:if>
			
		<c:if test = "${purchase.tranCode=='002'}">
			
			배송중
		</c:if>
		<c:if test = "${purchase.tranCode=='003'}">
			
			배송 완료
		</c:if>
		
				상태 입니다.
<!-- 				</td> -->
				
<!-- 		<td></td> -->
		
		<c:if test = "${purchase.tranCode=='002'}">
		
		<td align="left" data-TranCode="${purchase.tranCode}" data-tranNo="${purchase.tranNo}">
		
		
<!-- 	<a href="/purchase/updateTranCode?TranCode=${purchase.tranCode}&tranNo=${purchase.tranNo}">
		</a>
	 -->			
		물건도착
			
		</td>
		</c:if>
		
		
	  <c:if test = "${purchase.tranCode=='003'}">
	  
			<td align="left" id="delivered" data-delivered="${purchase.tranCode}">
			배송 완료
			</td>
		</c:if>
			
<!-- 	<tr> -->
			
<%-- 		<td id="${purchase.tranNo}" colspan="11" bgcolor="D6D7D6" height="1"> --%>

<!-- 		</td> -->
		
<!-- 		<tr> -->
			
<%-- 		<td id="${purchase.buyer.userId}" colspan="11" bgcolor="D6D7D6" height="1"> --%>

<!-- 		</td> -->
<!-- 	</tr> -->
		</tr>
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
