<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="vo.PageInfo"%>
<%@page import="vo.ClassBean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>


<%
	ArrayList<ClassBean> myParticipateList=(ArrayList<ClassBean>)request.getAttribute("myClassList");
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

<a href="#">재능기부하기</a>
	<section id="listForm">
		
			<%
if(myParticipateList != null && listCount > 0){
%>

			<%
		for(int i=0;i<myParticipateList.size();i++){
			
	%>
	
	
	<table><tr>
			<tr>
				<td><%= myParticipateList.get(i).getCL_NAME()%></td>
			</tr>
			
			<%} %>
		</table>
	</section>

	<section id="pageList">
		<%if(startPage <=5){ %>
		<%}else{ %>
		<a href="myClassList.do?page=<%=startPage-1 %>">[이전]</a>&nbsp;
		<%} %>

		<%for(int a=startPage;a<=endPage;a++){
				if(a==nowPage){%>
		[<%=a %>]
		<%}else{ %>
		<a href="myClassList.do?page=<%=a %>">[<%=a %>]
		</a>&nbsp;
		<%} %>
		<%} %>

		<%if(nowPage>=maxPage){ %>
		<%}else{ %>
		<a href="myClassList.do?page=<%=endPage+1 %>">[다음]</a>
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
</body>
</html>