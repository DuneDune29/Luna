<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.CusRes_bean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<meta charset="UTF-8">
<jsp:include page="header.jsp" />
<title>회원관리 : LunaClass</title>

<%
	ArrayList<CusRes_bean> cusResList= new ArrayList<>();
	PageInfo pageInfo = new PageInfo();
	cusResList=(ArrayList<CusRes_bean>)request.getAttribute("cusResList");
	pageInfo=(PageInfo)request.getAttribute("pageInfo");
	
	
		int listCount=pageInfo.getListCount();
		int nowPage=pageInfo.getPage();
		int maxPage=pageInfo.getMaxPage();
		int startPage=pageInfo.getStartPage();
		int endPage=pageInfo.getEndPage();
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
						<use xlink:href="CC_notice.jsp"></use></svg> <span class="fs-4">관리 홈</span>
				</a>
				<hr>
				<ul class="nav nav-pills flex-column mb-auto">
					<li class="nav-item">
					<a href="Customer_List.do" class="nav-link link-dark"
						aria-current="page"> <svg class="bi me-2" width="16"
								height="16">
								<use xlink:href="Customer_List.do"></use></svg> 회원 관리
					</a></li>
					<li><a href="classList.do" class="nav-link link-dark"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href="CC_notice.jsp"></use></svg> 재능 나눔 게시글 관리
					</a></li>
					<li><a href="CC_OftenQnA.jsp" class="nav-link link-dark"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href="CC_OftenQnA.jsp"></use></svg> 댓글 관리
					</a></li>
					<li><a href="MagQnAlist.do" class="nav-link link-dark"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href="MagQnAlist.do"></use></svg> QnA 관리
					</a></li>
					<li><a href="MagNoticeList.do" class="nav-link link-dark"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href="CC_QnA.jsp"></use></svg> 공지사항 관리
					</a></li>
					<li><a href="FnQList.do" class="nav-link link-dark"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href="CC_QnA.jsp"></use></svg> 자주 묻는 질문 관리
					</a></li>
					<li><a href="Guide.jsp" class="nav-link link-dark"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href="CC_QnA.jsp"></use></svg> 이용 가이드 관리
					</a></li>
					<li><a href="cusRes_List.do" class="nav-link active"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href="CC_QnA.jsp"></use></svg> 신청 현황 관리
					</a></li>
					
				</ul>
				<hr>
			</div>
			
			<main class="col-md-6 col-lg-8 px-md-4"> 
			<br>
			<br>
			<br>
			<h4>신청 현황 목록</h4>
			<hr>
			<br>
			<br>
	
	<%-- <div class="row">
  <div class="col-md-3"></div>
  <div class="col-md-6">
  <form class="d-flex" action="searchCustomerList.do" method="post">
 <select id="search" name="search" size="1">
			<option value="전체">전체조회</option>
			<option value="아이디">아이디</option>
			<option value="이름">이름</option>
			<option value="전화 번호">전화 번호</option>
		</select> 
        &nbsp;<input type="text" name="content" class="form-control me-2"  placeholder="검색값을 입력해주세요." aria-label="검색값을 입력해주세요.">
       <input type="hidden" class="form-control" placeholder="page" name="page" value=<%=nowPage%> />
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form></div>
  <div class="col-md-3"></div>
</div><br> --%>
			<div class="container">
			<div class="row">
			
			<% if(cusResList != null && listCount > 0){ %>
			
				<a class="list-group-item list-group-item-action" style="background-color: #F9F9F9">
					<div class="row">
					<div class="col">
					<div class="row">
						<span class="col-md-1" style="text-align:center"><%= "아이디" %></span>
						<span class="col-md-1" style="text-align:center"><%= "이름" %></span>
						<span class="col-md-3" style="text-align:center"><%= "클래스" %></span>
						<span class="col-md-3" style="text-align:center"><%= "기간" %></span>
					<div class="col">
					<div class="row">
						<span class="col-md-3" style="text-align:center"><%= "장소" %></span>
						<span class="col-md-3" style="text-align:center"><%= "진행자" %></span>
						<span class="col-md-4" style="text-align:center"><%= "신청일자" %></span>
						<span class="col-md-2" style="text-align:center">비고</span>
					</div>
					</div>
					</div>
					</div>
					</div>
						</a>
				
			<% for(int i=0;i<cusResList.size();i++){
					String n = null;%>
					<div class="list-group-item list-group-item-action">
					<div class="row">
					<div class="col" >
					<div class="row">
					   		<div class="col-md-1" style="cursor:pointer; font-weight:bold; text-align:center;" onclick="location.href='Customer_Detail.do?customer_id=<%=cusResList.get(i).getCUSRES_ID()%>'"><%=cusResList.get(i).getCUSRES_ID()%></div>
    						<span class="col-md-1" style="text-align:center"><%=cusResList.get(i).getCUSRES_NAME() %></span>
				   	  		<span class="col-md-3" style="cursor:pointer;font-weight:bold; text-align:center" onclick="location.href='Customer_Detail.do?customer_id=<%=cusResList.get(i).getCUSRES_CLASS()%>'"><%=cusResList.get(i).getCUSRES_CLASS()%></span>
				     		<span class="col-md-3" style="text-align:center"><%=cusResList.get(i).getCUSRES_DATE() %> ~ <%=cusResList.get(i).getCUSRES_DATE2() %></span>
				   	  <div class="col">
				   	  <div class="row">
				   	  		<span class="col-md-3" style="text-align:center"><%=cusResList.get(i).getCUSRES_LOC() %></span>
				     		<span class="col-md-3" style="cursor:pointer;font-weight:bold; text-align:center" onclick="location.href='Customer_Detail.do?customer_id=<%=cusResList.get(i).getCUSRES_CLID()%>'"><%=cusResList.get(i).getCUSRES_CLID()%></span>
				     		<span class="col-md-4" style="text-align:center"><%=cusResList.get(i).getCUSRES_REGDATE() %></span>
				     		<button type="submit" class=" btn btn-primary submit col-md-2" style="padding:1px 2px" onClick="location.href='CusResDelete.do?customer_id=<%=cusResList.get(i).getCUSRES_ID()%>', '<%=cusResList.get(i).getCUSRES_CLASS()%>'" >삭제</button>
				  		</div>
				  		</div>
				  		</div>
				  		</div>
				  		</div>
				  		</div>
				<% } %>
				  	</div>
				</div>
			
			<br>
		
		<section id="pageList" style="text-align : center">
		<% if(nowPage<=1){ %>
		<span style="color : darkgray; padding:8px 14px 6px; border-radius: 10px 10px 10px 10px">[이전]</span>&nbsp;
		<% }else{ %>
		<a href="cusRes_List.do?page=<%= nowPage-1 %>" style="color : darkgray; padding:8px 14px 6px; border-radius: 10px 10px 10px 10px">[이전]</a>&nbsp;
		<% } %>

		<% for(int a=startPage;a<=endPage;a++){
				if(a==nowPage){ %>
		<span style="background-color: #32DBC6; color : white; font-weight: bold; padding:8px 14px 6px; border-radius: 10px 10px 10px 10px"><%=a %></span>&nbsp;
		<% }else{ %>
		<a href="cusRes_List.do?page=<%= a %>" style="color : darkgray; padding:8px 14px 6px; border-radius: 10px 10px 10px 10px"><%=a %>
		</a>&nbsp;
		<% } %>
		<% } %>

		<% if(nowPage>=maxPage){ %>
		<span style="color : darkgray; padding:8px 14px 6px; border-radius: 10px 10px 10px 10px">[다음]</span>
		<% }else{ %>
		<a href="cusRes_List.do?page=<%= nowPage+1 %>" style="color : darkgray; padding:8px 14px 6px; border-radius: 10px 10px 10px 10px">[다음]</a>
		<% } %>
		</section>
		<% } else { %>
		<section id="emptyArea">등록된 글이 없습니다.</section>
				<% } %>
			
			
			</main>
			<br>
		</div>
	</div>
	<br><br><br><br><br><br><br>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
			
	<jsp:include page="footer.jsp" />
</body>
</html>