


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
<jsp:include page="/header2.jsp" />
<title>QnA 관리 : LunaClass</title>
<style type="text/css">

@media only screen and (min-width: 576px) {

	.left {
	text-align:left;
	}
}

.btn{
margin-top: 5px;

}
textarea {
	resize: none;
}

.TextCenter {
 text-align:center
}

.group{
background: #f9f9f9
}
</style>
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
		<jsp:include page="/side2.jsp" />
			<main class="col-md-6  col-lg-8 px-md-4 " id="mainContainer"> <br>
			<br>
			<br>
			<h4>QnA 목록</h4>
			<hr>
			<br>
			
			<div class="container">
			<div class="row">

			<%
if(qnalist != null && listCount > 0){
			
%>

			
				<a  class="list-group-item list-group-item-action group">
			<div class="row">
			<div class="col">
			<div class="row TextCenter">
      <span class="col-md-1"><%="글 번호"%></span>
      <span class="col-md-4" ><%="내      용" %></span>
   	<span class="col-md-2"><%="작성자"%></span>
      <span class="col-md-3"><%="작성일" %></span>
      <span class="col-md-2"><%="처리상태" %></span>
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
			<div class="row TextCenter" data-toggle="collapse" data-target="#content<%=i%>">
      <span class="col-md-1"><%=(pageinfo.getPage()-1)*5+(i+1) %></span>
       <span class="col-md-4 left"><%=qnalist.get(i).getQA_TITLE() %> 
     
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
          
   	  <span class="col-md-2" ><%=qnalist.get(i).getQA_WRITER_ID()%></span>
      <span class="col-md-3" ><%=qnalist.get(i).getQA_REGDATE() %></span>
      <span class="col-md-2" ><%=answer %></span>
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
                    	 <button type="submit" class="form-control btn btn-primary submit px-3 col-4" >답변 등록하기</button>
                    	  <button type="button" class="form-control btn btn-primary submit px-3 col-4" onClick="location.href='m_QA_delete.do?page=<%=nowPage %>&qa_id=<%=qnalist.get(i).getQA_ID()%>'">질문 삭제하기</button>
	<% }else{%>
		<button type="submit" class="form-control btn btn-primary submit px-3 col-4">수정하기</button>
		<button type="button" class="form-control btn btn-primary submit px-3 col-4" onClick="location.href='mag_QA_delete.do?page=<%=nowPage %>&qa_id=<%=qnalist.get(i).getQA_ID()%>'">삭제하기</button>
		 <button type="button" class="form-control btn btn-primary submit px-3 col-4" onClick="location.href='m_QA_delete.do?page=<%=nowPage %>&qa_id=<%=qnalist.get(i).getQA_ID()%>'" >질문 삭제하기</button>
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
	
	<ul>
   <li>
   <section id="pageList" style="text-align : center">

                     <%if(nowPage<=1){ %>
                     <span id="paging"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
</svg>이전</span>
                     <%
                     } else if (startPage <= 5) {
                     %>
                     <a href="MagQnAlist.do?page=<%=startPage%>" id="paging">&lt;이전</a>
                     
                     <%
                        } else {
                     %>
                     <a href="MagQnAlist.do?page=<%=startPage - 1%>" id="paging">&lt;이전</a>
                     <%
                        }
                     %>

                     <%
                        for (int a = startPage; a <= endPage; a++) {
                              if (a == nowPage) {
                     %><span id="pagingCur"><%=a %></span>
                     <%
                        } else {
                     %>
                        <a href="MagQnAlist.do?page=<%=a%>" id="paging"><%=a%></a>
                     <%
                        }
                     %>
                     <%
                        }
                     %>

                     <%
                        if (nowPage >= maxPage) {
                     %>
                           <span id="paging">다음<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-compact-right" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z"/>
</svg></span>
                     <%
                        } else if (endPage == maxPage) {
                     %>
                     <a href="MagQnAlist.do?page=<%=nowPage+1 %>" id="paging">다음&gt;</a>
                     <%
                        } else {
                     %>
                     <a href="MagQnAlist.do?page=<%=endPage+1%>" id="paging">다음&gt;</a>
                     <%
                        }
                     %>

                  </section>
                     </li>
                  </ul>
	<%
    }
	else
	{
	%>
	<nav id="nonArticle">
            <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor"
               class="bi bi-exclamation-circle" viewBox="0 0 16 16"
               id="exclamation">
  <path
                  d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
  <path
                  d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z" />
</svg>
            <br> <br>등록된 글이 없습니다.
         </nav>
	<%
	}
%>
		</div>
			</main>
		

  <main class="col-md-3 ms-sm-auto col-lg-2 px-md-4"></main>
  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
			
			</div>
			
			
		</div>

	<jsp:include page="/footer.jsp" />
</body>
</html>