<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


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
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
<script type="text/javascript">


function fncdeleteUser() {
	
// 	var password = document.getElementById("password").value;
// 	var errorMag = document.getElementById("error-message");
	
	var password =$("input[name='password']").val();
	//var errorMag =$("#error-message").val();
	 
	alert(password);
	
		
	if(${user.password} != password){
		
		alert("비밀번호가 잘못 되었습니다.");
		
	//alert(errorMag);
	
	}else{
		alert("다시 보는날이 또 오겠죠?");
		
		$("form").attr("method" , "POST").attr("action" , "/user/deleteUser").submit();	
	}		
}

$(function() {
	 
	
 	$( "#button1" ).on("click" , function() {
		
 		fncdeleteUser();
 		
	});
	
 	$( "#button2" ).on("click" , function() {
		
 		history.go(-1);
 		
	});			
});

</script>

</head>
<!-- <table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0"> -->
<!-- 	<tr> -->
<!-- 		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"	width="15" height="37"></td> -->
<!-- 		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;"> -->
<!-- 			<table width="100%" border="0" cellspacing="0" cellpadding="0"> -->
<!-- 				<tr> -->
<!-- 					<td width="93%" class="ct_ttl01">회원 탈퇴</td> -->
<!-- 					<td width="20%" align="right">&nbsp;</td> -->
<!-- 				</tr> -->
<!-- 			</table> -->
<!-- 		</td> -->
<!-- 		<td width="12" height="37"> -->
<!-- 			<img src="/images/ct_ttl_img03.gif"  width="12" height="37"/> -->
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- </table>	 -->
	<body>
	
	
	<div class="container">
	
		<h1 class="bg-primary text-center">회 원 탈 퇴</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		<div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">아이디</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" value="${user.userId}"  readonly>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">패스워드</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호 확인">
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userName" name="userName" value="${user.userName}" readonly>
		    </div>
		  </div>
		
			<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" id="button1" class="btn btn-primary">회원탈퇴</button>
	  		</div>
		</div>
		
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" id="button2" class="btn btn-primary">취소</button>
	  		</div>
		</div>
		
		</form>
	</div>
	
		
	</body>
	
</html>
	
<!-- 			<form name="detailForm" action="/user/deleteUser" method="post"> -->
			
<!-- 					<label class="control-label" for="userId">아이디</label> -->
<%-- 					<input class="form-control" type="text" id="userId" name="userId" value="${user.userId}" readonly="readonly"/> --%>
				
				
<!-- 					<label class="control-label" for="password">패스워드</label> -->
<!-- 					<input class="form-control" type="password" id="password" name="password" /> -->
				
				
<!-- 					<label class="control-label" for="userName">성명</label> -->
<%-- 					<input class="form-control" type="text" id="userName" name="userName" value="${user.userName}" readonly="readonly"/> --%>
				
				
<!-- 				<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;"> -->
<!-- 	<tr> -->
<!-- 		<td width="53%"></td> -->
<!-- 		<td align="right"> -->
<!-- 			<table border="0" cellspacing="0" cellpadding="0"> -->
<!-- 				<tr> -->
<!-- 					<td width="17" height="23"> -->
<!-- 						<img src="/images/ct_btnbg01.gif" width="17" height="23"/> -->
<!-- 					</td> -->
<!-- 					<td background="/images/ct_btnbg02.gif" class="ct_btn01"	style="padding-top: 3px;"> -->
<!-- 						<a href="javascript:fncGetUserList()">회원탈퇴</a> -->
<!-- 					</td> -->
<!-- 					<td width="14" height="23"> -->
<!-- 						<img src="/images/ct_btnbg03.gif" width="14" height="23"/> -->
<!-- 					</td> -->
<!-- 					<td width="30"></td> -->
<!-- 					<td width="17" height="23"> -->
<!-- 						<img src="/images/ct_btnbg01.gif"width="17" height="23"/> -->
<!-- 					</td> -->
<!-- 					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;"> -->
<!-- 						<a href="javascript:history.go(-1)">취소</a> -->
<!-- 					</td> -->
<!-- 					<td width="14" height="23"> -->
<!-- 						<img src="/images/ct_btnbg03.gif" width="14" height="23"/> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 			</table> -->
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- </table> -->
<!-- 			</form> -->
			