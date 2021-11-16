<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>



<html lang="ko">


<head>
<meta charset="EUC-KR">


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"> </script>
	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>

	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
<script type="text/javascript">


	$(function() {
		
		console.log("hihi");
		
		
		 $( "#button1" ).on("click" , function() {
			

		 	self.location ="/purchase/updatePurchase?tranNo=${purchase.tranNo}";
		});
		 
		 $( "#button2").on("click" , function() {
		
			 self.location ="/purchase/listPurchase";
		});
	});	

</script>
</head>
<body >


<jsp:include page="/layout/toolbar.jsp" />

<div class="container">

<div class="page-header">
	       <h3 class=" text-info">�������� Ȯ��</h3>
	       <h5 class="text-muted">�����Ͻ�<strong class="text-danger">�ֽ� ���� ����</strong>�Դϴ�.</h5>
	    </div>
	    
	    <div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ��ȣ</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.purchaseProd.prodNo}</div>
		</div>
		
		<hr/>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�����ھ��̵�</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.buyer.userId}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>���Ź��</strong></div>
			<div class="col-xs-8 col-md-4">
			
			<c:if test= "${purchase.paymentOption == '1'}">
			���ݱ���
			</c:if>
			
			<c:if test= "${purchase.paymentOption == '2'}">
			ī�屸��
			</c:if>
			
			</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�������̸�</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�����ڿ���ó</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverPhone}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�������ּ�</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyAddr}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�����ڿ�û����</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyRequest}</div>
		</div>
		
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>����������</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" id="button1" class="btn btn-primary">�ٽü���</button>
	  		</div>
		</div>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" id="button2" class="btn btn-primary">Ȯ��</button>
	  		</div>
		</div>
		<br/>
		
 	</div>

</body>
</html>
