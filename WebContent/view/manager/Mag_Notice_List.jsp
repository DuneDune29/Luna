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
<jsp:include page="/header2.jsp" />
<style type="text/css">
@media only screen and (min-width: 576px) {

	.left {
	text-align:left;
	}
}

.btn{
margin-bottom: 7px;

}
.TextCenter {
 text-align:center
}

.group{
background: #f9f9f9
}
</style>
<title>공지사항 관리 : LunaClass</title>

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
			<jsp:include page="/side2.jsp" />
			<main class="col-md-6 col-lg-8 px-md-4" id="mainContainer"> <br>
			<br>
			<br>
			<h4>공지사항 목록</h4>
			<hr>
			<br>
			
			<div class="container">
			<div class="row">

			<%
if(noticelist != null && listCount > 0){
%>

				<a  class="list-group-item list-group-item-action group">
			<div class="row">
			<div class="col">
			<div class="row TextCenter" >
      <span class="col-md-1" ><%="글 번호"%></span>
      <span class="col-md-8"><%="제 목" %></span>
      <span class="col-md-3"><%="작성일" %></span>
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
			<div class="row TextCenter" >
      <span class="col-md-1" style="text-align:center"><%=(pageinfo.getPage()-1)*5+(i+1) %></span>
       <span class="col-md-8 left"><%=noticelist.get(i).getNOTICE_TITLE() %> 
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
          
      <span class="col-md-3" style="text-align:center"><%=noticelist.get(i).getNOTICE_REGDATE() %></span>
  </div>
  
  
  </div>
  </div>
  </a>
			<%} %>
		</div>
		</div>
	<br>
	<div>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<button type="button"  class="form-control btn btn-primary submit px-3 col-md-2" onClick="location.href='Mag_Notice_Writer.do'" >공지글 등록</button>
	<ul>
   <li>
   <section id="pageList" style="text-align : center">

                     <%if(nowPage<=1){ %>
                     <span id="paging">&lt;이전</span>
                     <%
                     } else if (startPage <= 5) {
                     %>
                     <a href="MagNoticeList.do?page=<%=startPage%>" id="paging">&lt;이전</a>
                     
                     <%
                        } else {
                     %>
                     <a href="MagNoticeList.do?page=<%=startPage - 1%>" id="paging">&lt;이전</a>
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
                        <a href="MagNoticeList.do?page=<%=a%>" id="paging"><%=a%></a>
                     <%
                        }
                     %>
                     <%
                        }
                     %>

                     <%
                        if (nowPage >= maxPage) {
                     %>
                           <span id="paging">다음&gt;</span>
                     <%
                        } else if (endPage == maxPage) {
                     %>
                     <a href="MagNoticeList.do?page=<%=nowPage+1 %>" id="paging">다음&gt;</a>
                     <%
                        } else {
                     %>
                     <a href="MagNoticeList.do?page=<%=endPage+1%>" id="paging">다음&gt;</a>
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
	<div>
	<br>
	<button type="button"  class="form-control btn btn-primary submit px-3 col-md-2" onClick="location.href='Mag_Notice_Writer.do'" >공지글 등록</button></div>
	<%
	}
%>
		</div>
			</main>
		

  <main class="col-md-3 col-lg-2 px-md-4"></main>
  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
			
			</div>
			
			
		</div>

	<jsp:include page="/footer.jsp" />
</body>
</html>