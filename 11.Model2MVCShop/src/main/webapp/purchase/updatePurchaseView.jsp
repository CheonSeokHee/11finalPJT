<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>

<html lang="ko">

<head>
<meta charset="EUC-KR">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


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

function fncUpdatePurchase(){

	
	$("form").attr("method" , "POST").attr("action" ,"/purchase/updatePurchase?tranNo="+${purchase.tranNo}).submit();
	
	
}

$(function() {
	
	//alert($( "td.ct_btn01:contains('����')" ).val());
	
	console.log("hihi");
	
	$("#datePicker").datepicker({		
		  showOn: "button",
		  dateFormat: 'yy-mm-dd',
	      buttonImage: "../images/ct_icon_date.gif",
	      buttonImageOnly: true,
	      buttonText: "Select date"
	 });
	
	 $("button.btn.btn-primary"  ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('����')" ).html() );
			fncUpdatePurchase();
		});
	 
	 $("a[href='#' ]" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('���')" ).html() );
			history.go(-1);
		});
	
});

function execPostCode() {
	
    new daum.Postcode({
    	
        oncomplete: function(data) {
           // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

           // ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
           // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
           var fullRoadAddr = data.roadAddress; // ���θ� �ּ� ����
           var extraRoadAddr = ''; // ���θ� ������ �ּ� ����

           // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
           // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
           if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // ���θ�, ���� ������ �ּҰ� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // ���θ�, ���� �ּ��� ������ ���� �ش� ������ �ּҸ� �߰��Ѵ�.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
           $("[name=addr1]").val(data.zonecode);
           $("[name=addr2]").val(fullRoadAddr);
           
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5�ڸ� �������ȣ ���
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}


</script>

</head>
<body>

<jsp:include page="/layout/toolbar.jsp" />
	
	<div class="container">
	
	<div class="page-header text-center">
	       <h3 class=" text-info">������������</h3>
	       <h5 class="text-muted">����������<strong class="text-danger"> ����</strong>�� �ּ���.</h5>
	    </div>
<form class="form-horizontal">

<div class="form-group">

		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">�����ھ��̵�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="buyerId" name="buyerId" value="${purchase.buyer.userId }" readonly>
		    </div>
		  </div>
		  
		<div class="form-group">
		    <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">���Ź��</label>
		    <div class="col-sm-4">	    
		     <select 	name="paymentOption" class="form-control">
				<option value="1" selected="selected">���ݱ���</option>
				<option value="2">�ſ뱸��</option>
			</select>
	    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">�������̸�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverName" name="receiverName" value="${purchase.receiverName}">
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">�����ڿ���ó</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${purchase.receiverPhone}">
		    </div>
		  </div>
		  
		  
		  
	 <div class="form-group">
	  <label for="receiverAddr" class="col-sm-offset-1 col-sm-3 control-label">�������ּ�</label>
	  
	<div class="col-sm-4">                 		 
	<input class="form-control" style="width: 40%; display: inline;" placeholder="�����ȣ" name="addr1" id="addr1" type="text" readonly="readonly" >
	
    <button type="button" class="btn btn-default" onclick="execPostCode();">
    <i class="fa fa-search"></i> �����ȣ ã��</button>                               
		</div>
		
	<div class="col-sm-4">
    <input class="form-control" style="top: 5px;" placeholder="���θ� �ּ�" name="addr2" id="addr2" type="text" readonly="readonly" />
	 </div>
	 
	<div class="col-sm-4">
    <input class="form-control" placeholder="���ּ�" name="addr3" id="addr3" type="text"  />
	</div>
	</div>
	
	
<!-- 		  <div class="form-group"> -->
<!-- 		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">�������ּ�</label> -->
<!-- 		    <div class="col-sm-4"> -->
<%-- 		      <input type="text" class="form-control" id="receiverAddr" name="receiverAddr" value="${purchase.divyAddr}"> --%>
<!-- 		    </div> -->
<!-- 		  </div> -->
		  
		  
		  <div class="form-group">
		    <label for="receiverRequest" class="col-sm-offset-1 col-sm-3 control-label">���ſ�û����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverRequest" name="receiverRequest" value="${purchase.divyRequest}">
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">����������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" name="divyDate" id="datePicker" readonly="readonly" >
		    </div>
		  </div>

 		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >��&nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
		    </div>
		  </div>	

</form>
</div>
</body>
</html>