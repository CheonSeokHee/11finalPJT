<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page contentType="text/html; charset=EUC-KR" %>

<html>
<head>

<title>최근 본 상품 보기</title>

</head>
<body>
	최근 본 상품입니다.
<br>
<br>
<%
	System.out.println("-----------쿠키 들어온다리~~~~~~--------");


	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
	
	String history = null;
	
	Cookie[] cookies = request.getCookies();
	
	
	if (cookies!=null && cookies.length > 0) {
		for (int i = 0; i < cookies.length; i++) {
			
			Cookie cookie = cookies[i];
			
			
			if (cookie.getName().equals("history")) {
				history = cookie.getValue();
				
				
			}
		}
		
		if (history != null) {
			
			String[] h = history.split(",");
			
			for (int i = 0; i < h.length; i++) {
				
				
				if (!h[i].equals("null")) {
					
%>
<a href="/product/getProduct?prodNo=<%=h[i]%>&menu=search"
	target="rightFrame"><%=h[i]%></a>
<br>
<%
				}
			}
		}
	}
%>

</body>
</html>