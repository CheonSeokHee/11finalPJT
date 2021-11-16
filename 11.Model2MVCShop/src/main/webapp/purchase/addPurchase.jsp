<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
	 $(function() {
		 
		 	$( "#button1" ).on("click" , function() {
				
				//$(window.parent.frames["rightFrame"].document.location).attr("href","/product/addProductView");
				self.location = "/purchase/addPurchaseView.jsp";
			});
			
		 	$( "#button2").on("click" , function() {
				
				//$(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?menu=manage");
				self.location = "/product/listProduct?menu=search";
			});
						
	 });

	 </script>

	 </head>
	 <body >



<jsp:include page="/layout/toolbar.jsp" />


<div class="container">


<div class="page-header">
	       <h3 class=" text-info">��ǰ ���� �Ϸ�</h3>
	       <h5 class="text-muted">��ǰ��<strong class="text-danger">����������</strong>���� �Ǿ����ϴ�.</h5>
	    </div>
	    
</div>	    
	    
<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ��ȣ</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.purchaseProd.prodNo}</div>
		</div>	    
	    
<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�����ھ��̵�</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.buyer.userId}</div>
		</div>	    
	    
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>���Ź��</strong></div>
	  		
	  		<div class="col-xs-8 col-md-4" >${purchase.paymentOption}</div>
		</div>
		
	<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�������̸�</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverName}</div>
		</div>	
		
			<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�����ڿ���ó</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverPhone}</div>
		</div>	
		
		
				    
			<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�������ּ�</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyAddr}</div>
		</div>	
		
		
			<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>���ſ�û����</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyRequest}</div>
		</div>	
		
		
			<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>����������</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyDate}</div>
		</div>	
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" id="button1" class="btn btn-primary">�߰�����</button>
	  		</div>
		</div>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" id="button2" class="btn btn-primary">Ȯ��</button>
	  		</div>
		</div>
		
		    
	</body>
</html>


		    
	    
