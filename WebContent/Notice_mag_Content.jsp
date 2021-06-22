
<%@page import="vo.PageInfo"%>
<%@page import="vo.Notice_bean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<meta charset="UTF-8">
<jsp:include page="header.jsp" />
<title>공지사항 : LunaClass</title>

<%
Notice_bean notice= (Notice_bean)request.getAttribute("notice");
String nowPage = (String)request.getAttribute("page");
%>

</head>
<body>
	<br>
	<br>
	<div class="container-fluid">
		<div class="row">
			<div class="d-flex flex-column flex-shrink-0 p-3 bg-light"
				style="width: 280px;">
				<br> <br> <a href="MagNoticeList.do"
					class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
					<svg class="bi me-2" width="40" height="32">
						<use xlink:href="CC_notice.jsp"></use></svg> <span class="fs-4">고객센터</span>
				</a>
				<hr>
				<ul class="nav nav-pills flex-column mb-auto">
					<li class="nav-item"><a href="#" class="nav-link link-dark"
						aria-current="page"> <svg class="bi me-2" width="16"
								height="16">
								<use xlink:href="#home"></use></svg> 이용가이드
					</a></li>
					<li><a href="MagNoticeList.do" class="nav-link active"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href="#speedometer2"></use></svg> 공지사항
					</a></li>
					<li><a href="#" class="nav-link link-dark"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href="#table"></use></svg> 자주묻는질문
					</a></li>
					<li><a href="MagQnAlist.do" class="nav-link link-dark"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href="CC_QnA.jsp"></use></svg> QnA
					</a></li>
				</ul>
				<hr>
				
				

			</div>

			<main class="col-md-6 ms-sm-auto col-lg-8 px-md-4"> <br>
			<br>
			<br>
			<h4>공지사항</h4>
			<br>
			<h5><%=notice.getNOTICE_TITLE()  %></h5>
			<hr>
			<div><%=notice.getNOTICE_REGDATE()  %>&nbsp/&nbsp View : <%=notice.getNOTICE_VIEWCOUNT()  %></div>
			<br>
			<div><%=notice.getNOTICE_CONTENT()  %></div>
			</main>

			
		

  <main class="col-md-3 ms-sm-auto col-lg-2 px-md-4"></main>
  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
			
			</div>
			
			
		</div>
	<br><br><br><br><br><br><br>

	<jsp:include page="footer.jsp" />
</body>
</html>