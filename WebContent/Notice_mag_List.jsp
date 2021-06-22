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
<title>LunaClass : 공지사항</title>

<%

	ArrayList<Notice_bean> noticelist= new ArrayList<>();
	PageInfo pageinfo = new PageInfo();
	noticelist=(ArrayList<Notice_bean>)request.getAttribute("noticeList");
	pageinfo=(PageInfo)request.getAttribute("pageInfo");
	
	

	
	
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
			<hr>
			<br>
			<br>
			
			<div class="container">
			<div class="row">

			<%
if(noticelist != null && listCount > 0){
%>

				<a  class="list-group-item list-group-item-action">
			<div class="row">
			<div class="col">
			<div class="row">
      <span class="col-md-1"><%="글 번호"%></span>
      <span class="col-md-2"></span>
      <span class="col-md-5" style="text-align:center"><%="제 목" %></span>
       <div class="col">
      <div class="row">
   	<span class="col-md-8"></span>
      <span class="col-md-4" style="text-align:center" ><%="작성일" %></span>
  </div>
  </div>
  </div>
  </div>
  </div>
  </a>
		<%
			
		for(int i=0;i<noticelist.size();i++){
			String n = null;
			
	%>
			
				<a class="list-group-item list-group-item-action" href="MagNoticeContent.do?notice_id=<%=noticelist.get(i).getNOTICE_ID()%>&page=<%=nowPage%>">
						
			<div class="row">
			<div class="col">
			<div class="row" class="btn btn-info" data-toggle="collapse"
                     data-target="#content<%=i%>">
      <span class="col-md-1" style="text-align:center"><%=(pageinfo.getPage()-1)*5+(i+1) %></span>
      <span class="col-md-1"></span>
       <span class="col-md-5 "><%=noticelist.get(i).getNOTICE_TITLE() %> 
      <% 
	
	
	
	Date date = new Date(); 
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String today = sdf.format(date);
		
		
	if(today.equals(noticelist.get(i).getNOTICE_REGDATE().toString())){
		n = "N";
		%>
		 <span style="background-color: #FF5A37; font-size:13px; color : white; font-weight: bold; padding:1px 4px; border-radius: 50%">N</span>
		
	<%} else {
		n=null;%>
		 <span></span><%
	}
	
	
	%>
     </span>
          
      <div class="col">
      <div class="row">
   	  <span class="col-md-9"></span>
      <span class="col-md-3" style="text-align:center"><%=noticelist.get(i).getNOTICE_REGDATE() %></span>
  </div>
  </div>
  </div>
  <div id="content<%=i %>" class="collapse col-md-6">
  <div><%=noticelist.get(i).getNOTICE_CONTENT()%></div>
  </div>
  
  </div>
  </div>
  </a>
			<%} %>
		
		</div>
	<br>
	<div>
	<button type="button"  class="form-control btn btn-primary submit px-3 col-md-2" onClick="location.href='Notice_mag_Writer.jsp'" >공지글 등록</button>
	<section id="pageList" style="text-align : center">
		<%if(nowPage<=1){ %>
		<span style="color : darkgray; padding:8px 14px 6px; border-radius: 10px 10px 10px 10px">[이전]</span>&nbsp;
		<%}else{ %>
		<a href="MagNoticeList.do?page=<%=nowPage-1 %>" style="color : darkgray; padding:8px 14px 6px; border-radius: 10px 10px 10px 10px">[이전]</a>&nbsp;
		<%} %>

		<%for(int a=startPage;a<=endPage;a++){
				if(a==nowPage){%>
		<span style="background-color: #32DBC6; color : white; font-weight: bold; padding:8px 14px 6px; border-radius: 10px 10px 10px 10px"><%=a %></span>&nbsp;
		<%}else{ %>
		<a href="MagNoticeList.do?page=<%=a %>" style="color : darkgray; padding:8px 14px 6px; border-radius: 10px 10px 10px 10px"><%=a %>
		</a>&nbsp;
		<%} %>
		<%} %>

		<%if(nowPage>=maxPage){ %>
		<span style="color : darkgray; padding:8px 14px 6px; border-radius: 10px 10px 10px 10px">[다음]</span>
		<%}else{ %>
		<a href="MagNoticeList.do?page=<%=nowPage+1 %>" style="color : darkgray; padding:8px 14px 6px; border-radius: 10px 10px 10px 10px">[다음]</a>
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
	<br><br><br><br><br><br><br>

	<jsp:include page="footer.jsp" />
</body>
</html>