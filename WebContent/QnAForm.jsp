


<%@page import="vo.PageInfo"%>
<%@page import="vo.QNA_bean"%>
<%@page import="vo.User"%>
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
<title>Insert title here</title>
<%

User user = new User();
user=(User)session.getAttribute("authUser");
String id=user.getId();



%>


</head>
<body>
	<br>
	<br>
	<div class="container-fluid">
		<div class="row">
			<div class="d-flex flex-column flex-shrink-0 p-3 bg-light"
				style="width: 280px;">
				<br> <br> <a href="/"
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
					<li><a href="#" class="nav-link link-dark"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href="#speedometer2"></use></svg> 공지사항
					</a></li>
					<li><a href="#" class="nav-link link-dark"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href="#table"></use></svg> 자주묻는질문
					</a></li>
					<li><a href="CC_QnA.jsp" class="nav-link active"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href="CC_QnA.jsp"></use></svg> 질문하기
					</a></li>
				</ul>
				<hr>
				
				

			</div>

			<main class="col-md-6 col-lg-8 px-md-4"> <br>
			<br>
			<br>
			<h4>QnA</h4>
			<hr>
			<br>
			
			
			<br>
			
			<div class="container">
			<div class="row">


	
			
				<a class="list-group-item list-group-item-action">
			<div class="row">
			<div class="col">

  
  <div>
  
  
  <form action="QnAInsert.do" class="signin-form" method="post">
                  <div class="form-group">
                 
                  
                  <input type="text" class="form-control" placeholder="QA_WRITER_ID" name="qa_writer_id" value=<%=id %> readonly>
                  <br>
                  <input type="text" class="form-control" placeholder="제목을 입력하세요." name="qa_title"/>
                  
                 <br>
                     <textarea cols="40" rows="5" class="form-control" placeholder="질문을 입력하세요."  name="qa_content" required></textarea>
                    
                  </div>

                    <div class="form-group">
                  <button type="submit" class="form-control btn btn-primary submit px-3" >질문 등록하기</button>
                  
               </div>
               
               
             </form>

  </div>

  
  </div>
  </div>
  </a>

			

		
		</div>
	<br>
	</section>
	
	
	
	
		</div>
			</main>
		

  <main class="col-md-3 ms-sm-auto col-lg-2 px-md-4"></main>
  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
			
			</div>
			
			
		</div>
	<br><br><br><br><br><br><br>

	<jsp:include page="footer.jsp" />
</body>
</html>