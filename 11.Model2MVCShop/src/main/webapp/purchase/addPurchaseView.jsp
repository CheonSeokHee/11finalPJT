<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>

<html lang="ko">

<head>
<meta charset="EUC-KR">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<title>상품등록</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"> </script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>

	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>

<script type="text/javascript">




function fncAddPurchase() {
	
var addr1 = $("input:text[name='addr1']").val();
var addr2 = $("input:text[name='addr2']").val();
var addr3 = $("input:text[name='addr3']").val();

// alert(addr1);
// alert(addr2);
// alert(addr3);

if(addr1 == null ){
	alert("1 주소를 반드시 입력해주세요.");
	return;
}
if(addr2 == null){
	alert("2 주소를 반드시 입력해주세요.");
	return;
}
if(addr3 == null){
	alert("상세 주소를 반드시 입력해주세요.");
	return;
}

	 $("form").attr("method" , "POST").attr("action" ,"/purchase/addPurchase").submit();
}

$(function() {
	
	//alert($( "td.ct_btn01:contains('구매')" ).val());
	
	console.log("hihi");
	
	$("#datePicker").datepicker({		
		  showOn: "button",
		  dateFormat: 'yy-mm-dd',
	      buttonImage: "../images/ct_icon_date.gif",
	      buttonImageOnly: true,
	      buttonText: "Select date"
	 });
	
	 $( "button.btn.btn-primary").on("click" , function() {
		//alert("바보");
		 fncAddPurchase();
	});
	 
	 $("a[href='#' ]").on("click" , function() {

		//alert("메롱");
	 		history.go(-1);
	 		
	});
	
});

function execPostCode() {
	
    new daum.Postcode({
    	
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
           $("[name=addr1]").val(data.zonecode);
           $("[name=addr2]").val(fullRoadAddr);
           
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}


</script>
</head>

<body>


<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">몽돌샵</a>
   		</div>
   	</div>
   	
   	
 <div class="container">
   	
 	<h1 class="bg-primary text-center">상품 구매</h1>   
		
	<form class="form-horizontal">  	
	
	<div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품번호</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodNo" name="prodNo" value="${product.prodNo}"  readonly>		     
		    </div>	
		  </div>
	
		
	<div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName}" readonly>		     
		    </div>	
		  </div>
		  
		  
	 <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품 상세정보</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" value="${product.prodDetail }" readonly>
		    </div>
		  </div>
	
	 <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조 일자</label>
		    <div class="col-sm-4">
		      <input type="text" name ="manuDate" id="manuDate" class="form-control" value="${product.manuDate}" readonly>
		    </div>
		  </div>
	
	
	 <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">
		      <input type="text" name ="price" id="price" class="form-control" value="${product.price}" readonly>
		    </div>
		  </div>
	
	 	<div class="form-group">
		    <label for="regDate" class="col-sm-offset-1 col-sm-3 control-label">등록일자</label>
		    <div class="col-sm-4">
		      <input type="text" name ="regDate" id="regDate" class="form-control" value="${product.regDate}" readonly>
		    </div>
		  </div>
	
	<div class="form-group">
		    <label for="buyerId" class="col-sm-offset-1 col-sm-3 control-label">구매자아이디</label>
		    <div class="col-sm-4">
		      <input type="text" name ="buyerId" id="buyerId" class="form-control" value="${user.userId}" readonly>
		    </div>
		  </div>
	
	<div class="form-group">
		    <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
		    <div class="col-sm-4">
		    
		     <select 	name="paymentOption" class="form-control">
				<option value="1" selected="selected">현금구매</option>
				<option value="2">신용구매</option>
			</select>
	    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">구매자이름</label>
		    <div class="col-sm-4">
		      <input type="text" name ="receiverName" id="receiverName" class="form-control" >
		    </div>
		  </div>
		
		  
		  <div class="form-group">
		    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">구매자연락처</label>
		    <div class="col-sm-4">
		      <input type="text" name ="receiverPhone" id="receiverPhone" class="form-control" >
		    </div>
		  </div>
		  
		  
<!-- 		  <div class="form-group"> -->
<!-- 		    <label for="receiverAddr" class="col-sm-offset-1 col-sm-3 control-label">구매자주소</label> -->
<!-- 		    <div class="col-sm-4"> -->
<!-- 		      <input type="text" name ="receiverAddr" id="receiverAddr" class="form-control" > -->
<!-- 		    </div> -->
<!-- 		  </div> -->



	<div class="form-group">
	  <label for="receiverAddr" class="col-sm-offset-1 col-sm-3 control-label">구매자주소</label>
	  
	<div class="col-sm-4">                 		 
	<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="addr1" id="addr1" type="text" readonly="readonly" >
	
    <button type="button" class="btn btn-default" onclick="execPostCode();">
    <i class="fa fa-search"></i> 우편번호 찾기</button>                               
		</div>
		
	<div class="col-sm-4">
    <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="addr2" id="addr2" type="text" readonly="readonly" />
	 </div>
	 
	<div class="col-sm-4">
    <input class="form-control" placeholder="상세주소" name="addr3" id="addr3" type="text"  />
	</div>
	</div>


		  
		    <div class="form-group">
		    <label for="receiverRequest" class="col-sm-offset-1 col-sm-3 control-label">구매자요청사항</label>
		    <div class="col-sm-4">
		      <input type="text" name ="receiverRequest" id="receiverRequest" class="form-control" >
		    </div>
		  </div>
		  
		    <div class="form-group">
		    <label for="receiverDate" class="col-sm-offset-1 col-sm-3 control-label">배송희망일자</label>
		    <div class="col-sm-4">
		      <input type="text" name ="receiverDate" id="datePicker" class="form-control" >
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >구&nbsp;매</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>	
	
	
	
   	</form>
</div>
</body>
</html>
<!-- <form name="detailForm" > -->

<!-- <table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0"> -->
<!-- 	<tr> -->
<!-- 		<td width="15" height="37"> -->
<!-- 			<img src="/images/ct_ttl_img01.gif" width="15" height="37"> -->
<!-- 		</td> -->
<!-- 		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;"> -->
<!-- 			<table width="100%" border="0" cellspacing="0" cellpadding="0"> -->
<!-- 				<tr> -->
<!-- 					<td width="93%" class="ct_ttl01">상품상세조회</td> -->
<!-- 					<td width="20%" align="right">&nbsp;</td> -->
<!-- 				</tr> -->
<!-- 			</table> -->
<!-- 		</td> -->
<!-- 		<td width="12" height="37"> -->
<!-- 			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/> -->
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- </table> -->

<%-- <input type="hidden" name="prodNo" value="${product.prodNo}" /> --%>

<!-- <table width="600" border="0" cellspacing="0" cellpadding="0"	align="center" style="margin-top: 13px;"> -->
<!-- 	<tr> -->
<!-- 		<td height="1" colspan="3" bgcolor="D6D6D6"></td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td width="300" class="ct_write"> -->
<!-- 			상품번호 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/> -->
<!-- 		</td> -->
<!-- 		<td bgcolor="D6D6D6" width="1"></td> -->
<!-- 		<td class="ct_write01" width="299"> -->
<!-- 			<table width="100%" border="0" cellspacing="0" cellpadding="0"> -->
<!-- 				<tr> -->
<%-- 					<td width="105">${product.prodNo}</td> --%>
<!-- 				</tr> -->
<!-- 			</table> -->
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td height="1" colspan="3" bgcolor="D6D6D6"></td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td width="104" class="ct_write"> -->
<!-- 			상품명 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/> -->
<!-- 		</td> -->
<!-- 		<td bgcolor="D6D6D6" width="1"></td> -->
<%-- 		<td class="ct_write01">${product.prodName}</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td height="1" colspan="3" bgcolor="D6D6D6"></td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td width="104" class="ct_write"> -->
<!-- 			상품상세정보 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/> -->
<!-- 		</td> -->
<!-- 		<td bgcolor="D6D6D6" width="1"></td> -->
<%-- 		<td class="ct_write01">${product.prodDetail }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td height="1" colspan="3" bgcolor="D6D6D6"></td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td width="104" class="ct_write">제조일자</td> -->
<!-- 		<td bgcolor="D6D6D6" width="1"></td> -->
<%-- 		<td class="ct_write01">${product.manuDate}</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td height="1" colspan="3" bgcolor="D6D6D6"></td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td width="104" class="ct_write">가격</td> -->
<!-- 		<td bgcolor="D6D6D6" width="1"></td> -->
<%-- 		<td class="ct_write01">${product.price}</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td height="1" colspan="3" bgcolor="D6D6D6"></td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td width="104" class="ct_write">등록일자</td> -->
<!-- 		<td bgcolor="D6D6D6" width="1"></td> -->
<%-- 		<td class="ct_write01">${product.regDate }</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td height="1" colspan="3" bgcolor="D6D6D6"></td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td width="104" class="ct_write"> -->
<!-- 			구매자아이디 <img 	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/> -->
<!-- 		</td> -->
<!-- 		<td bgcolor="D6D6D6" width="1"></td> -->
<%-- 		<td class="ct_write01">${user.userId}</td> --%>
		
<%-- 		<input type="hidden" name="buyerId" value="${user.userId}" /> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td height="1" colspan="3" bgcolor="D6D6D6"></td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td width="104" class="ct_write">구매방법</td> -->
<!-- 		<td bgcolor="D6D6D6" width="1"></td> -->
<!-- 		<td class="ct_write01"> -->
<!-- 			<select 	name="paymentOption"		class="ct_input_g"  -->
<!-- 							style="width: 100px; height: 19px" maxLength="20"> -->
<!-- 				<option value="1" selected="selected">현금구매</option> -->
<!-- 				<option value="2">신용구매</option> -->
<!-- 			</select> -->
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td height="1" colspan="3" bgcolor="D6D6D6"></td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td width="104" class="ct_write">구매자이름</td> -->
<!-- 		<td bgcolor="D6D6D6" width="1"></td> -->
<!-- 		<td class="ct_write01"> -->
<!-- 			<input type="text" name="receiverName" 	class="ct_input_g"  -->
<%-- 						style="width: 100px; height: 19px" maxLength="20" value="${user.userName}" /> --%>
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td height="1" colspan="3" bgcolor="D6D6D6"></td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td width="104" class="ct_write">구매자연락처</td> -->
<!-- 		<td bgcolor="D6D6D6" width="1"></td> -->
<!-- 		<td class="ct_write01"> -->
<!-- 			<input 	type="text" name="receiverPhone" class="ct_input_g"  -->
<%-- 							style="width: 100px; height: 19px" maxLength="20" value="${user.phone}" /> --%>
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td height="1" colspan="3" bgcolor="D6D6D6"></td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td width="104" class="ct_write">구매자주소</td> -->
<!-- 		<td bgcolor="D6D6D6" width="1"></td> -->
<!-- 		<td class="ct_write01"> -->
<!-- 			<input 	type="text" name="receiverAddr" class="ct_input_g"  -->
<%-- 							style="width: 100px; height: 19px" maxLength="20" 	value="${user.addr}" /> --%>
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td height="1" colspan="3" bgcolor="D6D6D6"></td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td width="104" class="ct_write">구매요청사항</td> -->
<!-- 		<td bgcolor="D6D6D6" width="1"></td> -->
<!-- 		<td class="ct_write01"> -->
<!-- 			<input		type="text" name="receiverRequest" 	class="ct_input_g"  -->
<!-- 							style="width: 100px; height: 19px" maxLength="20" /> -->
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td height="1" colspan="3" bgcolor="D6D6D6"></td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td width="104" class="ct_write">배송희망일자</td> -->
<!-- 		<td bgcolor="D6D6D6" width="1"></td> -->
<!-- 		<td width="200" class="ct_write01"> -->
<!-- 			<input 	type="text" readonly="readonly" name="receiverDate" id="datePicker"  class="ct_input_g"  -->
<!-- 							style="width: 100px; height: 19px" maxLength="20"/> -->
							
<!-- 					 -		
<!-- 			<img src="../images/ct_icon_date.gif" width="15" height="15"	 -->
<!-- 						onclick="show_calendar('document.addPurchase.receiverDate', document.addPurchase.receiverDate.value)"/> -->
<!-- 						 -->	 -->
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td height="1" colspan="3" bgcolor="D6D6D6"></td> -->
<!-- 	</tr> -->
<!-- </table> -->

<!-- <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;"> -->
<!-- 	<tr> -->
<!-- 		<td width="53%"></td> -->
<!-- 		<td align="center"> -->
<!-- 			<table border="0" cellspacing="0" cellpadding="0"> -->
<!-- 				<tr> -->
<!-- 					<td width="17" height="23"> -->
<!-- 						<img src="/images/ct_btnbg01.gif" width="17" height="23"/> -->
<!-- 					</td> -->
<!-- 					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;"> -->
<!-- 						구매 -->
<!-- 					</td> -->
<!-- 					<td width="14" height="23"> -->
<!-- 						<img src="/images/ct_btnbg03.gif" width="14" height="23"/> -->
<!-- 					</td> -->
<!-- 					<td width="30"></td> -->
<!-- 					<td width="17" height="23"> -->
<!-- 						<img src="/images/ct_btnbg01.gif" width="17" height="23"/> -->
<!-- 					</td> -->
<!-- 					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;"> -->
<!-- 						취소 -->
<!-- 					</td> -->
<!-- 					<td width="14" height="23"> -->
<!-- 						<img src="/images/ct_btnbg03.gif" width="14" height="23"/> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 			</table> -->
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- </table> -->

<!-- </form> -->