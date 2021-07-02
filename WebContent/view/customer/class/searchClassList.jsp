<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.ClassBean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="vo.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://kit.fontawesome.com/848d8f1fa9.js"
	crossorigin="anonymous"></script>

<%
Date date = new Date();
ArrayList<Integer> headCount = (ArrayList<Integer>) request.getAttribute("headCount");
ArrayList<ClassBean> article = (ArrayList<ClassBean>) request.getAttribute("article");
PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
int listCount = pageInfo.getListCount();
int nowPage = pageInfo.getPage();
int maxPage = pageInfo.getMaxPage();
int startPage = pageInfo.getStartPage();
int endPage = pageInfo.getEndPage();
String CL_NAME = (String) request.getParameter("CL_NAME");
String CL_LOCATION = (String) request.getParameter("CL_LOCATION");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">



<style>
ul:after {
	content: '';
	display: block;
	clear: both;
}

.list {
	float: left;
}

.flex-sm-fill {
	display: block;
	color: grey;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

.flex-sm-fill:hover:not(.active) {
	background-color: white;
}
</style>

<style>
#emptyArea {
	text-align: center;
}
</style>



<title>재능 찾기</title>
</head>
<body>
	<jsp:include page="/header.jsp" />
	<jsp:include page="categoryBar.jsp" />
	 <% 
	String path1="classList.do";
			
			request.getSession().setAttribute("path1", path1);
   		  
   		   %>

	<!-- Button trigger modal -->
	<button type="button" class="btn" data-bs-toggle="modal"
		data-bs-target="#exampleModal">
		<i class="fas fa-map-marker-alt"></i>&nbsp;&nbsp;지역
	</button>

	<!-- Modal -->
	<div class="modal fade " id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">찾으시는 나눔센터 위치를
						선택하세요.</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body ">

					<ul style="list-style-type: none; text-align: center;">
						<li><a class="dropdown-item"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&CL_LOCATION=강남구">강남구&nbsp;&nbsp;&nbsp;</a></li>
						<li><a class="dropdown-item"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&CL_LOCATION=강동구">강동구&nbsp;&nbsp;&nbsp;</a></li>
						<li><a class="dropdown-item"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&CL_LOCATION=강서구">강서구&nbsp;&nbsp;&nbsp;</a></li>
						<li><a class="dropdown-item"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&CL_LOCATION=강북구">강북구&nbsp;&nbsp;&nbsp;</a></li>
						<li><a class="dropdown-item"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&CL_LOCATION=관악구">관악구&nbsp;&nbsp;&nbsp;</a></li>
						<li><a class="dropdown-item"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&CL_LOCATION=광진구">광진구&nbsp;&nbsp;&nbsp;</a></li>
						<li><a class="dropdown-item"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&CL_LOCATION=구로구">구로구&nbsp;&nbsp;&nbsp;</a></li>
						<li><a class="dropdown-item"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&CL_LOCATION=금천구">금천구&nbsp;&nbsp;&nbsp;</a></li>
						<li><a class="dropdown-item"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&CL_LOCATION=노원구">노원구&nbsp;&nbsp;&nbsp;</a></li>
						<li><a class="dropdown-item"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&CL_LOCATION=동대문구">동대문구&nbsp;&nbsp;&nbsp;</a></li>
						<li><a class="dropdown-item"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&CL_LOCATION=도봉구">도봉구&nbsp;&nbsp;&nbsp;</a></li>
						<li><a class="dropdown-item"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&CL_LOCATION=동작구">동작구&nbsp;&nbsp;&nbsp;</a></li>
						<li><a class="dropdown-item"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&CL_LOCATION=마포구">마포구&nbsp;&nbsp;&nbsp;</a></li>
						<li><a class="dropdown-item"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&CL_LOCATION=서대문구">서대문구&nbsp;&nbsp;&nbsp;</a></li>
						<li><a class="dropdown-item"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&CL_LOCATION=성동구">성동구&nbsp;&nbsp;&nbsp;</a></li>
						<li><a class="dropdown-item"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&CL_LOCATION=성북구">성북구&nbsp;&nbsp;&nbsp;</a></li>
						<li><a class="dropdown-item"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&CL_LOCATION=서초구">서초구&nbsp;&nbsp;&nbsp;</a></li>
						<li><a class="dropdown-item"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&CL_LOCATION=송파구">송파구&nbsp;&nbsp;&nbsp;</a></li>
						<li><a class="dropdown-item"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&CL_LOCATION=영등포구">영등포구&nbsp;&nbsp;&nbsp;</a></li>
						<li><a class="dropdown-item"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&CL_LOCATION=용산구">용산구&nbsp;&nbsp;&nbsp;</a></li>
						<li><a class="dropdown-item"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&CL_LOCATION=양천구">양천구&nbsp;&nbsp;&nbsp;</a></li>
						<li><a class="dropdown-item"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&CL_LOCATION=은평구">은평구&nbsp;&nbsp;&nbsp;</a></li>
						<li><a class="dropdown-item"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&CL_LOCATION=종로구">종로구&nbsp;&nbsp;&nbsp;</a></li>
						<li><a class="dropdown-item"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&CL_LOCATION=중구">중구&nbsp;&nbsp;&nbsp;</a></li>
						<li><a class="dropdown-item"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&CL_LOCATION=중랑구">중랑구&nbsp;&nbsp;&nbsp;</a></li>
					</ul>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-1"></div>
	<div class="col-md-1"></div>
	<div class="col-md-1"></div>
	</div>




	<section class="site-section col-md-12" id="work-section">

		<%
		if (article != null && listCount > 0) {
		%>
		<div class="container">

			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-5">
				<%
				for (int i = 0; i < article.size(); i++) {
				%>

				<div>
					<a href="classDetail.do?CL_ID=<%=article.get(i).getCL_ID()%>"
						style="color: black; text-decoration: none;">
						<div class="col" style="margin: 0px">
							<div class="card shadow-sm select-all">
								<%--             <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><img src="<%=cultureClassList.get(i).getCL_IMG_PATH()%>" width=150px></svg> --%>
								<img
									src="<%=request.getContextPath()%>/upload/<%=article.get(i).getCL_IMG_PATH()%>"
									width=300px height=200px>


								<div
									style="text-align: center; font-size: 19pt; font-family: THE외계인설명서;">
									<strong><%=article.get(i).getCL_NAME()%></strong>
								</div>

								<div
									style="text-align: center; font-size: 13px; font-family: THE외계인설명서;">
									<%=article.get(i).getCL_INTRODUCTION()%>
								</div>
								<div style="text-align: right;">
									<%
									if (article.get(i).getCL_START_DATE().getTime() <= date.getTime()) {
									%>

									<em class="gray"><strong>모집 마감&nbsp;&nbsp;</strong></em><br>

									<%
									} else if (headCount.get(i) >= article.get(i).getCL_CAPACITY()) {
									%>

									<em class="red"><strong>모집 마감&nbsp;&nbsp;</strong></em><br>

									<%
									} else if (article.get(i).getCL_START_DATE().getTime() >= date.getTime()) {
									%>

									<em class="green"><strong>예약 가능&nbsp;&nbsp;</strong></em><br>

									<%
									}
									%>
								</div>

								<div style="font-family: 바탕; font-size: 12pt;"
									class="card-body row" style="padding:5px; margin:0px">

									<div class="col-5">

										<p class="card-text" style="text-align: right;">
											카테고리<br> 위치<br> 기간<br>
										</p>
									</div>
									<div class="col-7">
										<p class="card-text">

											<%
											if (article.get(i).getCL_CATEGORY().equals("art")) {
											%>예술
											<%
											} else if (article.get(i).getCL_CATEGORY().equals("life")) {
											%>문화, 생활
											<%
											} else if (article.get(i).getCL_CATEGORY().equals("health")) {
											%>건강 , 미용
											<%
											} else if (article.get(i).getCL_CATEGORY().equals("development")) {
											%>IT/개발
											<%
											} else if (article.get(i).getCL_CATEGORY().equals("therapy")) {
											%>심리
											<%
											} else if (article.get(i).getCL_CATEGORY().equals("etc")) {
											%>기타
											<%
											}
											%><br>
											<%=article.get(i).getCL_LOCATION()%>&nbsp;나눔센터<br>
											<%=article.get(i).getCL_START_DATE()%><br>&nbsp;&nbsp;~<%=article.get(i).getCL_END_DATE()%><br>
										</p>
									</div>
									<br>


									<div class="col-5">
										<p class="card-text" style="text-align: right;">
										<div style="font-family: 바탕; font-size: 10pt;">
											<br>조회수<%=article.get(i).getCL_VIEW()%></div>
										</p>
									</div>

									<div class="col-7">
										<p class="card-text" style="text-align: right;">
										<div style="font-family: 바탕; font-size: 10pt;">
											<br>인원 현황&nbsp;&nbsp;<%=headCount.get(i)%>/<%=article.get(i).getCL_CAPACITY()%>&nbsp;&nbsp;
										</div>
										</p>
									</div>


									<!--               <div class="d-flex justify-content-between align-items-center"> -->
									<div class="btn-group"></div>



									<!--               </div> -->
								</div>
							</div>
						</div>
					</a>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</section>


	<section id="pageList">
		<div class="container">
			<div class="row justify-content-md-center">
				<div class="col-md-auto">
					<ul class="pagination pagination">
						<% if(CL_LOCATION != null){
						if (startPage <= 5) {
						%>
						<li class="page-item"><a class="page-link"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&page=<%=startPage%>&CL_LOCATION=<%=CL_LOCATION%>">이전</a></li>
						<%
						} else {
						%>
						<li class="page-item"><a class="page-link"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&page=<%=startPage - 1%>&CL_LOCATION=<%=CL_LOCATION%>">이전</a></li>
						<%
						}
						%>

						<%
						for (int a = startPage; a <= endPage; a++) {
							if (a == nowPage) {
						%><li class="page-item"><a class="page-link"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&page=<%=nowPage%>&CL_LOCATION=<%=CL_LOCATION%>"><%=a%></a></li>
						<%
						} else {
						%>
						<li class="page-item"><a class="page-link"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&page=<%=a%>&CL_LOCATION=<%=CL_LOCATION%>"><%=a%></a></li>
						<%
						}
						%>
						<%
						}
						%>

						<%
						if (nowPage >= maxPage) {
						%>
						<li class="page-item"><a class="page-link"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&page=<%=endPage%>&CL_LOCATION=<%=CL_LOCATION%>">다음</a></li>
						<%
						} else if (endPage == maxPage) {
						%>
						<li class="page-item"><a class="page-link"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&page=<%=endPage%>&CL_LOCATION=<%=CL_LOCATION%>">다음</a></li>
						<%
						} else {
						%>
						<li class="page-item"><a class="page-link"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&page=<%=endPage + 1%>&CL_LOCATION=<%=CL_LOCATION%>">다음</a></li>
						<%
						}} else {
						%>
						<%
						if (startPage <= 5) {
						%>
						<li class="page-item"><a class="page-link"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&page=<%=startPage%>">이전</a></li>
						<%
						} else {
						%>
						<li class="page-item"><a class="page-link"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&page=<%=startPage - 1%>">이전</a></li>
						<%
						}
						%>

						<%
						for (int a = startPage; a <= endPage; a++) {
							if (a == nowPage) {
						%><li class="page-item"><a class="page-link"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&page=<%=nowPage%>"><%=a%></a></li>
						<%
						} else {
						%>
						<li class="page-item"><a class="page-link"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&page=<%=a%>"><%=a%></a></li>
						<%
						}
						%>
						<%
						}
						%>

						<%
						if (nowPage >= maxPage) {
						%>
						<li class="page-item"><a class="page-link"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&page=<%=endPage%>">다음</a></li>
						<%
						} else if (endPage == maxPage) {
						%>
						<li class="page-item"><a class="page-link"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&page=<%=endPage%>">다음</a></li>
						<%
						} else {
						%>
						<li class="page-item"><a class="page-link"
							href="searchClassList.do?CL_NAME=<%=CL_NAME%>&page=<%=endPage + 1%>">다음</a></li>
						<%
						}
						%>
						<%} %>

					</ul>
				</div>
			</div>
		</div>
	</section>
	<%
	} else {
	%>
	<section id="emptyArea">등록된 재능이 없습니다.</section>
	<%
	}
	%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
		crossorigin="anonymous"></script>
	<jsp:include page="/footer.jsp" />
</body>
</html>