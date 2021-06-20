

<%@page import="vo.PageInfo"%>
<%@page import="vo.QNA_bean"%>
<%@page import="java.util.ArrayList"%>
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
	ArrayList<QNA_bean> qnalist= new ArrayList<>();
	PageInfo pageinfo = new PageInfo();
	qnalist=(ArrayList<QNA_bean>)request.getAttribute("qnaList");
	pageinfo=(PageInfo)request.getAttribute("pageInfo");
	
	System.out.println(pageinfo.getPage());
	System.out.println("ㅎ헿");
	for(int i=0;i<qnalist.size();i++){
	qnalist.get(i);
	System.out.println(qnalist.get(i).getQA_ID());
	System.out.println(qnalist.get(i).getQA_WRITER_ID());
	System.out.println(qnalist.get(i).getQA_TITLE());
	System.out.println(qnalist.get(i).getQA_CONTENT());
	System.out.println(qnalist.get(i).getQA_REGDATE());
	System.out.println(qnalist.get(i).getQA_MAG_CONTENT());
	System.out.println(qnalist.get(i).getQA_ANSWER());
	
	
	
	}
		int listCount=pageinfo.getListCount();
		int nowPage=pageinfo.getPage();
		int maxPage=pageinfo.getMaxPage();
		int startPage=pageinfo.getStartPage();
		int endPage=pageinfo.getEndPage();
	
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
						<use xlink:href="#bootstrap"></use></svg> <span class="fs-4">회원정보</span>
				</a>
				<hr>
				<ul class="nav nav-pills flex-column mb-auto">
					<li class="nav-item"><a href="#" class="nav-link active"
						aria-current="page"> <svg class="bi me-2" width="16"
								height="16">
								<use xlink:href="#home"></use></svg> 내 정보
					</a></li>
					<li><a href="#" class="nav-link link-dark"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href="#speedometer2"></use></svg> 찜
					</a></li>
					<li><a href="#" class="nav-link link-dark"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href="#table"></use></svg> 최근 본 내역
					</a></li>
				</ul>
				<hr>
				<a href="/"
					class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
					<svg class="bi me-2" width="40" height="32">
						<use xlink:href="#bootstrap"></use></svg> <span class="fs-4">내 참여</span>
				</a>
				<hr>
				<ul class="nav nav-pills flex-column mb-auto">
					<a href="#" class="nav-link link-dark"> <svg class="bi me-2"
							width="16" height="16">
							<use xlink:href="#speedometer2"></use></svg> 진행중인 나눔
					</a>
					</li>
					<li><a href="#" class="nav-link link-dark"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href="#table"></use></svg> 끝난 나눔
					</a></li>
				</ul>
				<hr>
				<a href="/"
					class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
					<svg class="bi me-2" width="40" height="32">
						<use xlink:href="#bootstrap"></use></svg> <span class="fs-4">재능
						나눔</span>
				</a>
				<hr>

			</div>

			<main class="col-md-6 ms-sm-auto col-lg-8 px-md-4"> <br>
			<br>
			<br>
			<h4>QnA</h4>
			<hr>
			<br>
			
			<div class="container">
			<div class="row">
			
			
  <table>
			<%
if(qnalist != null && listCount > 0){
%>

			<tr id="tr_top">
				<td><a  class="list-group-item list-group-item-action">
			<div class="row">
      <div class="col-md-1"><%="글 번호"%></div>
      <div class="col-md-7" style="text-align:center"><%="제      목" %></div>
   	<div class="col-md-2" style="text-align:center"><%="작성자"%></div>
      <div class="col-md-2" style="text-align:center"><%="작성일" %></div>
  </div>
  </a></td>
				
			</tr>

			<%
		for(int i=0;i<qnalist.size();i++){
			
	%>
			<tr>
				<td><a href="#" class="list-group-item list-group-item-action">
			<div class="row">
      <div class="col-md-1" style="text-align:center"><%=(pageinfo.getPage()-1)*5+(i+1) %></div>
      <div class="col-md-1"></div>
      <div class="col-md-6"><%=qnalist.get(i).getQA_TITLE() %></div>
   	<div class="col-md-2" style="text-align:center"><%=qnalist.get(i).getQA_WRITER_ID()%></div>
      <div class="col-md-2" style="text-align:center"><%=qnalist.get(i).getQA_REGDATE() %></div>
  </div>
  </a></td>

			</tr>
			<%} %>
		</table>
		</div>
	<br>
	</section>
	
	<section id="pageList" style="text-align : center">
		<%if(nowPage<=1){ %>
		<span style="color : darkgray; padding:8px 14px 6px; border-radius: 10px 10px 10px 10px">[이전]</span>&nbsp;
		<%}else{ %>
		<a href="QnAlist.do?page=<%=nowPage-1 %>" style="color : darkgray; padding:8px 14px 6px; border-radius: 10px 10px 10px 10px">[이전]</a>&nbsp;
		<%} %>

		<%for(int a=startPage;a<=endPage;a++){
				if(a==nowPage){%>
		<span style="background-color: #3DB39E; color : white; font-weight: bold; padding:8px 14px 6px; border-radius: 10px 10px 10px 10px"><%=a %></span>
		<%}else{ %>
		<a href="QnAlist.do?page=<%=a %>" style="color : darkgray; padding:8px 14px 6px; border-radius: 10px 10px 10px 10px"><%=a %>
		</a>&nbsp;
		<%} %>
		<%} %>

		<%if(nowPage>=maxPage){ %>
		<span style="color : darkgray; padding:8px 14px 6px; border-radius: 10px 10px 10px 10px">[다음]</span>
		<%}else{ %>
		<a href="QnAlist.do?page=<%=nowPage+1 %>" style="color : darkgray; padding:8px 14px 6px; border-radius: 10px 10px 10px 10px">[다음]</a>
		<%} %>
	</section>
	<%
    }
	else
	{
	%>
	<section id="emptyArea">등록된 글이 없습니다.</section>
	<%
	}
%>
		</div>
			</main>
		

  <main class="col-md-3 ms-sm-auto col-lg-2 px-md-4"></main>
  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
			
			</div>
			
			
		</div>
	




	<jsp:include page="footer.jsp" />
</body>
</html>