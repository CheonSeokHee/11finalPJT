<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--   jQuery , Bootstrap CDN  -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js">
	//    $( function() {
	// 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	// 		$("img[name='img-rounded']").on("click" , function() {

	// 			alert("헤헤 성공!");

	// 			self.location = "www.instagram.com/ssg___heeeee/"
	// 		});
	// 	});
</script>

<!--  CSS 추가 : 툴바에 화면 가리는 현상 해결 :  주석처리 전, 후 확인-->
<style>
body {
	padding-top: 70px;
}
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->


</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  아래의 내용은 http://getbootstrap.com/getting-started/  참조 -->
	<div class="container ">
		<!-- Main jumbotron for a primary marketing message or call to action -->
		<div class="jumbotron">
			<h1>몽돌샵</h1>
			<p>애견 용품 판매점</p>
		</div>
	</div>

	<!-- 참조 : http://getbootstrap.com/css/   : container part..... -->
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<h3>반려동물에게 최고의 간식을 선물하세요</h3>
				<p>★☆★전국 최고의 간식 전문점 몽돌샵★☆★</p>
				<h3></h3>
				<h3>방문해 주셔서 감사합니다</h3>
				<p>1대1문의 환영</p>
				<p>가맹점 문의 환영</p>
				<div>
					<img src="/images/image.png"
						onclick="javascript:location.href='https://www.instagram.com/ssg___heeeee/';"
						style="cursor: pointer" class="img-rounded" width="100" style="min-width: 100%" />
				</div>
			</div>
			<div class="col-md-7">
				<iframe width="100%" height="500"
					src="https://www.youtube.com/embed/0YRDWKWmnwc?autoplay=1"
					frameborder="0"></iframe>
			</div>
		</div>
	</div>









</body>

</html>