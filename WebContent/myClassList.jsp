<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="vo.PageInfo"%>
<%@page import="vo.ClassBean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
    <%@ page import = "vo.User"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
User user = new User("id1","");
session.setAttribute("authUser", user);
%>

<%
	ArrayList<ClassBean> myClassList=(ArrayList<ClassBean>)request.getAttribute("myClassList");
    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재능기부-나의 수업</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<br><br><br><br><br>
<a href="#">재능기부하기</a>
	
	
	
	
	
	
	
	<section id="listForm">
		
			<%
if(myClassList != null && listCount > 0){
%>

			<%
		for(int i=0;i<myClassList.size();i++){
			
	%>
	
	
	<table><tr>
			<tr>
				<td><%= myClassList.get(i).getCL_NAME()%></td>
			</tr>
			
			<%} %>
		</table>
	</section>





	<section id="pageList">
	<div class="container">
		<div class="row mb-5 justify-content-center">
			<div class="col-md-8 text-center">
	 			<p class="lead">
		<%if(startPage <=5){ %>
		<%}else{ %>
		<a href="myClassList.do?page=<%=startPage-1 %>">이전</a>&nbsp;
		<%} %>

		<%for(int a=startPage;a<=endPage;a++){
				if(a==nowPage){%><%=a%><%}else{ %><a href="myClassList.do?page=<%=a %>"><%=a%></a>&nbsp;<%} %>
		<%} %>

		<%if(nowPage>=maxPage){ %>
		<%}else{ %>
		<a href="myClassList.do?page=<%=endPage+1 %>">다음</a>
		<%} %>
				</p>
			</div>
		</div>
	</div>
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




<section id="pageList">
<c:if test="${myClassList != null}">
	<div class="container">
		<div class="row mb-5 justify-content-center">
			<div class="col-md-8 text-center">
<ul class="pagination pagination-sm">
    <li class="page-item"><a class="page-link" href="">이전</a></li>
    <li class="page-item"><a class="page-link" href="">1</a></li>
    <li class="page-item"><a class="page-link" href="">2</a></li>
    <li class="page-item"><a class="page-link" href="">3</a></li>
    <li class="page-item"><a class="page-link" href="">3</a></li>
    <li class="page-item"><a class="page-link" href="">3</a></li>
    <li><a class="page-link" href="">다음</a></li>
</ul>
	</div>
		</div>
	</div>
	</c:if>

	</section>

<jsp:include page="footer.jsp"/>
</body>
</html>