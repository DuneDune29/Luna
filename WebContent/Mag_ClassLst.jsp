<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.ClassBean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="vo.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	ArrayList<ClassBean> classList = (ArrayList<ClassBean>) request.getAttribute("classList");
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
%>

<!DOCTYPE html>
<html>
<head>
<script src="https://kit.fontawesome.com/848d8f1fa9.js" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">

 

<title>재능 찾기</title>


</head>
<body>
	<jsp:include page="header.jsp" />
	<jsp:include page="categoryBar.jsp" />



<div class="nav nav-pills flex-column flex-sm-row">
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>        
<div class="dropdown">
  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
    지역찾기
  </button> 
  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
    <li><a class="dropdown-item" href="classListWithLoc.do?CL_LOCATION=1">금천구</a></li>
    <li><a class="dropdown-item" href="classListWithLoc.do?CL_LOCATION=2">서초구</a></li>
    <li><a class="dropdown-item" href="classListWithLoc.do?CL_LOCATION=3">용산구</a></li>
  </ul>
</div>
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
</div>


<br><br>


	
	
		<section class="site-section" id="work-section">
		
		<%
				if (classList != null && listCount > 0) {
			%>
      
      
      <div class="container-fluid">
        <div class="row h-800px" >
      <%
					for (int i = 0; i < classList.size(); i++) {
				%>
          <div class="col-md-3 col-lg-4" >
            <a href="classDetail.do?CL_ID=<%=classList.get(i).getCL_ID()%>&page=<%=nowPage%>" class="media-1" >
             
              <div class="row">
									<%=classList.get(i).getCL_CATEGORY()%>
							<div>
								<img src="tree.jpg" width=500px>
							</div>
							<div class="col-lg-10">
								<div class="row">
									<div class="col-2 " style="color:black;">제목</div>
									<div class="col-8" style="color:black;"><%=classList.get(i).getCL_NAME()%></div>
									<div class="col-2 " style="color:black;">진행중</div>
								</div>
								<div class="row">
									<div class="col-2 " style="color:black;">기간</div>
									<div class="col-4" style="color:black;"><%=classList.get(i).getCL_START_DATE()%>
										~
										<%=classList.get(i).getCL_END_DATE()%></div></div>
										<div class="row">
									<div class="col-2 " style="color:black;">장소</div>
									<div class="col-4" style="color:black;"><%=classList.get(i).getCL_LOCATION()%></div>
								</div>
								

							</div>
						</div>
						<div class="media-1-content">
                <h2><%=classList.get(i).getCL_NAME()%></h2>
                <span class="category">상세페이지로 이동</span>
              </div>
                
             
            </a>
          </div>
          

         
        <%
					}
				%>
        </div>
      </div>
    </section>
	
	<section id="pageList" style="text-align : center">
		<%if(nowPage<=1){ %>
		<span style="color : darkgray; padding:8px 14px 6px; border-radius: 10px 10px 10px 10px">[이전]</span>&nbsp;
		<%}else{ %>
		<a href="MclassList.do?page=<%=nowPage-1 %>" style="color : darkgray; padding:8px 14px 6px; border-radius: 10px 10px 10px 10px">[이전]</a>&nbsp;
		<%} %>

		<%for(int a=startPage;a<=endPage;a++){
				if(a==nowPage){%>
		<span style="background-color: #32DBC6; color : white; font-weight: bold; padding:8px 14px 6px; border-radius: 10px 10px 10px 10px"><%=a %></span>&nbsp;
		<%}else{ %>
		<a href="classList.do?page=<%=a %>" style="color : darkgray; padding:8px 14px 6px; border-radius: 10px 10px 10px 10px"><%=a %>
		</a>&nbsp;
		<%} %>
		<%} %>

		<%if(nowPage>=maxPage){ %>
		<span style="color : darkgray; padding:8px 14px 6px; border-radius: 10px 10px 10px 10px">[다음]</span>
		<%}else{ %>
		<a href="classList.do?page=<%=nowPage+1 %>" style="color : darkgray; padding:8px 14px 6px; border-radius: 10px 10px 10px 10px">[다음]</a>
		<%} %>
	</section>
		<%
			} else {
		%>
		<section id="emptyArea">등록된 글이 없습니다.</section>
		<%
			}
		%>
		<br>
		
		
		
		
		
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
			crossorigin="anonymous"></script>
			
			
		<jsp:include page="footer.jsp" />
</body>
</html>