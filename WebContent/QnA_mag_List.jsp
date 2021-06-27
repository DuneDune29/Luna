


<%@page import="vo.PageInfo"%>
<%@page import="vo.QNA_bean"%>
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
<jsp:include page="header2.jsp" />
<title>Insert title here</title>

<% 

	ArrayList<QNA_bean> qnalist= new ArrayList<>();
	PageInfo pageinfo = new PageInfo();
	qnalist=(ArrayList<QNA_bean>)request.getAttribute("qnaList");
	pageinfo=(PageInfo)request.getAttribute("pageinfo");
	

	

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
				<br> <br> <a href="CC_notice.jsp"
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
								<use xlink:href="classList.do"></use></svg> 재능 나눔 게시글 관리
					</a></li>
					<li><a href="" class="nav-link link-dark"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href=""></use></svg> 댓글 관리
					</a></li>
					<li><a href="MagQnAlist.do" class="nav-link active"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href="MagQnAlist.do"></use></svg> QnA 관리
					</a></li>
					<li><a href="MagNoticeList.do" class="nav-link link-dark"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href="MagNoticeList.do"></use></svg> 공지 관리
					</a></li>
					<li><a href="FnQList.do" class="nav-link link-dark"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href="FnQList.do"></use></svg> 자주 묻는 질문 관리
					</a></li>
					<li><a href="" class="nav-link link-dark"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href=""></use></svg> 이용 가이드 관리
					</a></li>
					<li><a href="cusRes_List.do" class="nav-link link-dark"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href=""></use></svg> 신청 현황 관리
					</a></li>
					
					
					
				</ul>
				<hr>

			</div>
			<main class="col-md-6  col-lg-8 px-md-4"> <br>
			<br>
			<br>
			<h4>QnA</h4>
			<hr>
			<br>
			
			
			<div>
			
			<form name="searchForm" id="searchForm"  method="get" action="/app/mypage/counsel">
				<input type="hidden" name="period" value=""/>
				<input type="hidden" name="page" value="1"/>
					<div class="n-radio-tab">
						<input type="radio" id="radioTabGuide0" name="radioTabGuide" onClick="setPeriod(this,'1week');" >
						<label for="radioTabGuide0">1주일</label>

						<input type="radio" id="radioTabGuide1" name="radioTabGuide" onClick="setPeriod(this,'1month');" >
						<label for="radioTabGuide1">1개월</label>

						<input type="radio" id="radioTabGuide2" name="radioTabGuide" onClick="setPeriod(this,'3month');" >
						<label for="radioTabGuide2">3개월</label>

						<input type="radio" id="radioTabGuide3" name="radioTabGuide" onClick="setPeriod(this,'');" checked>
						<label for="radioTabGuide3">전체 시기</label>
					
					<span class="n-select">
						<select name="state">
							<option value="">전체 보기</option>
														<option value="1" >답변 대기</option>
														<option value="50" >답변 완료</option>
													</select>
					</span>
					<button type="button" class="n-btn btn-sm btn-accent" onclick="search();">조회</button>
				</div>
			</form>
			</div>
			
			
			<br>
			
			<div class="container">
			<div class="row">

			<%
if(qnalist != null && listCount > 0){
			
%>

			
				<a  class="list-group-item list-group-item-action">
			<div class="row">
			<div class="col">
			<div class="row">
      <span class="col-md-1"><%="글 번호"%></span>
      <span class="col-md-1"></span>
      <span class="col-md-6" style="text-align:center"><%="내      용" %></span>
       <div class="col">
      <div class="row">
   	<span class="col-md-1"></span>
   	<span class="col-md-3" style="text-align:left"><%="작성자"%></span>
      <span class="col-md-3" style="text-align:center" ><%="작성일" %></span>
      <span class="col-md-4" style="text-align:right"><%="처리상태" %></span>
  </div>
  </div>
  </div>
  </div>
  </div>
  </a>
		<%
			
		for(int i=0;i<qnalist.size();i++){
			String n = null;
			
	%>
			
				<a class="list-group-item list-group-item-action">
			<div class="row">
			<div class="col">
			<div class="row" class="btn btn-info" data-toggle="collapse"
                     data-target="#content<%=i%>">
      <span class="col-md-1" style="text-align:center"><%=(pageinfo.getPage()-1)*5+(i+1) %></span>
      <span class="col-md-1"></span>
       <span class="col-md-5 "><%=qnalist.get(i).getQA_TITLE() %> 
      <% 
	
	
	
	Date date = new Date(); 
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String answer;
	String mag_content;
	String today = sdf.format(date);
	Date reg_date;	
		
	if(today.equals(qnalist.get(i).getQA_REGDATE().toString())){
		n = "N";
		%>
		 <span style="background-color: #FF5A37; font-size:13px; color : white; font-weight: bold; padding:1px 4px; border-radius: 50%">N</span>
		
	<%} else {
		n=null;%>
		 <span></span><%
	}
	
	
	if(!qnalist.get(i).getQA_ANSWER()){
		answer="답변 대기";
	}else{
		answer="답변 완료";
	}
	
	if(qnalist.get(i).getQA_MAG_CONTENT()==null){
		mag_content="";
	}else{
		mag_content=qnalist.get(i).getQA_MAG_CONTENT();
	}
	
	

	%>
     </span>
          
      <div class="col">
      <div class="row">
   	  <span class="col-md-2"></span>
   	  <span class="col-md-3" style="text-align:center"><%=qnalist.get(i).getQA_WRITER_ID()%></span>
      <span class="col-md-4" style="text-align:right"><%=qnalist.get(i).getQA_REGDATE() %></span>
      <span class="col-md-3" style="text-align:right"><%=answer %></span>
  </div>
  </div>
  </div>

  
  
  
  
 <div class="col">
 <div class="row">

  <div id="content<%=i %>" class="collapse col-md-12">
 <br>
 
 <div class="col">
 <div class="row">
 <div class="col-md-2"></div>
 <div class="col-md-10">
  <%=qnalist.get(i).getQA_CONTENT()%></div></div></div>

  <hr>
   <div class="col">
 <div class="row">
 <div class="col-md-2"><br><br>관리자 답변</div>
  <div class="col-md-8">
 <form action="mag_QA_Insert.do?page<%=nowPage %>" class="signin-form" method="post">
                  <div class="form-group">
                  <input type="hidden" class="form-control" placeholder="QA_ID" name="qa_id" value=<%=qnalist.get(i).getQA_ID()%> />
                  <input type = "hidden" name = "page" value = "<%=nowPage %>"/>
                
                     <textarea cols="40" rows="5" class="form-control" placeholder="답글을 입력하세요"  name="mag_content" required><%=mag_content %></textarea>
                    
                  </div>

                    <div class="form-group" class="col">
                    <div class="row">
                    
                    <% if(!qnalist.get(i).getQA_ANSWER()){%>
                    	 <button type="submit" class="form-control btn btn-primary submit px-3 col-md-3" >답변 등록하기</button>
                    	  <button type="button" class="form-control btn btn-primary submit px-3 col-md-3" onClick="location.href='m_QA_delete.do?page=<%=nowPage %>&qa_id=<%=qnalist.get(i).getQA_ID()%>'">질문 삭제하기</button>
	<% }else{%>
		<button type="submit" class="form-control btn btn-primary submit px-3 col-md-3">수정하기</button>
		<button type="button" class="form-control btn btn-primary submit px-3 col-md-3" onClick="location.href='mag_QA_delete.do?page=<%=nowPage %>&qa_id=<%=qnalist.get(i).getQA_ID()%>'">삭제하기</button>
		 <button type="button" class="form-control btn btn-primary submit px-3 col-md-3" onClick="location.href='m_QA_delete.do?page=<%=nowPage %>&qa_id=<%=qnalist.get(i).getQA_ID()%>'" >질문 삭제하기</button>
	<% }%>
                 
                  
               </div></div>
               
               
             </form></div>
             <% if(qnalist.get(i).getQA_MAG_REGDATE()!=null){%>
            	 <div class="col-md-2"><br><br><t><%= qnalist.get(i).getQA_MAG_REGDATE()%></div>
	<%}%>
           
             
             
             </div></div>
 


  </div>
  </div>
  </div>
  </div>
  </div>
  </a>

			
			<%} %>
		
		</div>
	<br>
	
	<section id="pageList" style="text-align : center">
		<%if(nowPage<=1){ %>
		<span style="color : darkgray; padding:8px 14px 6px; border-radius: 10px 10px 10px 10px">[이전]</span>&nbsp;
		<%}else{ %>
		<a href="MagQnAlist.do?page=<%=nowPage-1 %>" style="color : darkgray; padding:8px 14px 6px; border-radius: 10px 10px 10px 10px">[이전]</a>&nbsp;
		<%} %>

		<%for(int a=startPage;a<=endPage;a++){
				if(a==nowPage){%>
		<span style="background-color: #32DBC6; color : white; font-weight: bold; padding:8px 14px 6px; border-radius: 10px 10px 10px 10px"><%=a %></span>&nbsp;
		<%}else{ %>
		<a href="MagQnAlist.do?page=<%=a %>" style="color : darkgray; padding:8px 14px 6px; border-radius: 10px 10px 10px 10px"><%=a %>
		</a>&nbsp;
		<%} %>
		<%} %>

		<%if(nowPage>=maxPage){ %>
		<span style="color : darkgray; padding:8px 14px 6px; border-radius: 10px 10px 10px 10px">[다음]</span>
		<%}else{ %>
		<a href="MagQnAlist.do?page=<%=nowPage+1 %>" style="color : darkgray; padding:8px 14px 6px; border-radius: 10px 10px 10px 10px">[다음]</a>
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