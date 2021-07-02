<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.ClassBean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="vo.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
Date date = new Date();
ArrayList<Integer> headCount = (ArrayList<Integer>) request.getAttribute("headCount");
ArrayList<ClassBean> classList = (ArrayList<ClassBean>) request.getAttribute("classList");
PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
int listCount = pageInfo.getListCount();
int nowPage = pageInfo.getPage();
int maxPage = pageInfo.getMaxPage();
int startPage = pageInfo.getStartPage();
int endPage = pageInfo.getEndPage();

String CL_LOCATION = (String) request.getParameter("CL_LOCATION");
String CL_CATEGORY = (String) request.getParameter("CL_CATEGORY");
%>

<!DOCTYPE html>
<html>
<head>
<script src="https://kit.fontawesome.com/848d8f1fa9.js"
   crossorigin="anonymous"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
   crossorigin="anonymous">

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
                     href="classList.do?CL_LOCATION=강남구<%if (CL_CATEGORY != null) {%>&CL_CATEGORY=<%=CL_CATEGORY%><%}%>">강남구</a></li>
                  <li><a class="dropdown-item"
                     href="classList.do?CL_LOCATION=강동구<%if (CL_CATEGORY != null) {%>&CL_CATEGORY=<%=CL_CATEGORY%><%}%>">강동구</a></li>
                  <li><a class="dropdown-item"
                     href="classList.do?CL_LOCATION=강서구<%if (CL_CATEGORY != null) {%>&CL_CATEGORY=<%=CL_CATEGORY%><%}%>">강서구</a></li>
                  <li><a class="dropdown-item"
                     href="classList.do?CL_LOCATION=강북구<%if (CL_CATEGORY != null) {%>&CL_CATEGORY=<%=CL_CATEGORY%><%}%>">강북구</a></li>
                  <li><a class="dropdown-item"
                     href="classList.do?CL_LOCATION=관악구<%if (CL_CATEGORY != null) {%>&CL_CATEGORY=<%=CL_CATEGORY%><%}%>">관악구</a></li>
                  <li><a class="dropdown-item"
                     href="classList.do?CL_LOCATION=광진구<%if (CL_CATEGORY != null) {%>&CL_CATEGORY=<%=CL_CATEGORY%><%}%>">광진구</a></li>
                  <li><a class="dropdown-item"
                     href="classList.do?CL_LOCATION=구로구<%if (CL_CATEGORY != null) {%>&CL_CATEGORY=<%=CL_CATEGORY%><%}%>">구로구</a></li>
                  <li><a class="dropdown-item"
                     href="classList.do?CL_LOCATION=금천구<%if (CL_CATEGORY != null) {%>&CL_CATEGORY=<%=CL_CATEGORY%><%}%>">금천구</a></li>
                  <li><a class="dropdown-item"
                     href="classList.do?CL_LOCATION=노원구<%if (CL_CATEGORY != null) {%>&CL_CATEGORY=<%=CL_CATEGORY%><%}%>">노원구</a></li>
                  <li><a class="dropdown-item"
                     href="classList.do?CL_LOCATION=동대문구<%if (CL_CATEGORY != null) {%>&CL_CATEGORY=<%=CL_CATEGORY%><%}%>">동대문구</a></li>
                  <li><a class="dropdown-item"
                     href="classList.do?CL_LOCATION=도봉구<%if (CL_CATEGORY != null) {%>&CL_CATEGORY=<%=CL_CATEGORY%><%}%>">도봉구</a></li>
                  <li><a class="dropdown-item"
                     href="classList.do?CL_LOCATION=동작구<%if (CL_CATEGORY != null) {%>&CL_CATEGORY=<%=CL_CATEGORY%><%}%>">동작구</a></li>
                  <li><a class="dropdown-item"
                     href="classList.do?CL_LOCATION=마포구<%if (CL_CATEGORY != null) {%>&CL_CATEGORY=<%=CL_CATEGORY%><%}%>">마포구</a></li>
                  <li><a class="dropdown-item"
                     href="classList.do?CL_LOCATION=서대문구<%if (CL_CATEGORY != null) {%>&CL_CATEGORY=<%=CL_CATEGORY%><%}%>">서대문구</a></li>
                  <li><a class="dropdown-item"
                     href="classList.do?CL_LOCATION=성동구<%if (CL_CATEGORY != null) {%>&CL_CATEGORY=<%=CL_CATEGORY%><%}%>">성동구</a></li>
                  <li><a class="dropdown-item"
                     href="classList.do?CL_LOCATION=성북구<%if (CL_CATEGORY != null) {%>&CL_CATEGORY=<%=CL_CATEGORY%><%}%>">성북구</a></li>
                  <li><a class="dropdown-item"
                     href="classList.do?CL_LOCATION=서초구<%if (CL_CATEGORY != null) {%>&CL_CATEGORY=<%=CL_CATEGORY%><%}%>">서초구</a></li>
                  <li><a class="dropdown-item"
                     href="classList.do?CL_LOCATION=송파구<%if (CL_CATEGORY != null) {%>&CL_CATEGORY=<%=CL_CATEGORY%><%}%>">송파구</a></li>
                  <li><a class="dropdown-item"
                     href="classList.do?CL_LOCATION=영등포구<%if (CL_CATEGORY != null) {%>&CL_CATEGORY=<%=CL_CATEGORY%><%}%>">영등포구</a></li>
                  <li><a class="dropdown-item"
                     href="classList.do?CL_LOCATION=용산구<%if (CL_CATEGORY != null) {%>&CL_CATEGORY=<%=CL_CATEGORY%><%}%>">용산구</a></li>
                  <li><a class="dropdown-item"
                     href="classList.do?CL_LOCATION=양천구<%if (CL_CATEGORY != null) {%>&CL_CATEGORY=<%=CL_CATEGORY%><%}%>">양천구</a></li>
                  <li><a class="dropdown-item"
                     href="classList.do?CL_LOCATION=은평구<%if (CL_CATEGORY != null) {%>&CL_CATEGORY=<%=CL_CATEGORY%><%}%>">은평구</a></li>
                  <li><a class="dropdown-item"
                     href="classList.do?CL_LOCATION=종로구<%if (CL_CATEGORY != null) {%>&CL_CATEGORY=<%=CL_CATEGORY%><%}%>">종로구</a></li>
                  <li><a class="dropdown-item"
                     href="classList.do?CL_LOCATION=중구<%if (CL_CATEGORY != null) {%>&CL_CATEGORY=<%=CL_CATEGORY%><%}%>">중구</a></li>
                  <li><a class="dropdown-item"
                     href="classList.do?CL_LOCATION=중랑구<%if (CL_CATEGORY != null) {%>&CL_CATEGORY=<%=CL_CATEGORY%><%}%>">중랑구</a></li>
               </ul>

            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-secondary"
                  data-bs-dismiss="modal">취소</button>
            </div>
         </div>
      </div>
   </div>

   <section class="site-section col-md-12" id="work-section">

      <%
      if (classList != null && listCount > 0) {
      %>
      <div class="container">

         <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-5">
            <%
            for (int i = 0; i < classList.size(); i++) {
            %>
            <div>
               <a href="classDetail.do?CL_ID=<%=classList.get(i).getCL_ID()%>"
                  style="color: black; text-decoration: none;">
                  <div class="col" style="margin: 0px">
                     <div class="card shadow-sm select-all">
                        <img
                           src="<%=request.getContextPath()%>/upload/<%=classList.get(i).getCL_IMG_PATH()%>"
                           width=300px height=200px>
                        <div style="text-align: center; font-size: 19pt;">
                           <strong><%=classList.get(i).getCL_NAME()%></strong>
                        </div>
                        <div style="text-align: center; font-size: 13px;">
                           <%=classList.get(i).getCL_INTRODUCTION()%>
                        </div>
                        <div style="text-align: right;">
                           <%
                           if (classList.get(i).getCL_START_DATE().getTime() <= date.getTime()) {
                           %>
                           <em class="gray"><strong>모집 마감&nbsp;&nbsp;</strong></em><br>
                           <%
                           } else if (headCount.get(i) >= classList.get(i).getCL_CAPACITY()) {
                           %>
                           <em class="red"><strong>모집 마감&nbsp;&nbsp;</strong></em><br>
                           <%
                           } else if (classList.get(i).getCL_START_DATE().getTime() >= date.getTime()) {
                           %>
                           <em class="green"><strong>예약 가능&nbsp;&nbsp;</strong></em><br>
                           <%
                           }
                           %>
                        </div>
                        <div style="font-size: 12pt;" class="card-body row"
                           style="padding:5px; margin:0px">
                           <div class="col-5">
                              <p class="card-text" style="text-align: right;">
                                 카테고리<br> 위치<br> 기간<br>
                              </p>
                           </div>
                           <div class="col-7">
                              <p class="card-text">
                                 <%
                                 if (classList.get(i).getCL_CATEGORY().equals("art")) {
                                 %>예술
                                 <%
                                 } else if (classList.get(i).getCL_CATEGORY().equals("life")) {
                                 %>문화, 생활
                                 <%
                                 } else if (classList.get(i).getCL_CATEGORY().equals("health")) {
                                 %>건강 , 미용
                                 <%
                                 } else if (classList.get(i).getCL_CATEGORY().equals("development")) {
                                 %>IT/개발
                                 <%
                                 } else if (classList.get(i).getCL_CATEGORY().equals("therapy")) {
                                 %>심리
                                 <%
                                 } else if (classList.get(i).getCL_CATEGORY().equals("etc")) {
                                 %>기타
                                 <%
                                 }
                                 %><br>
                                 <%=classList.get(i).getCL_LOCATION()%>&nbsp;나눔센터<br>
                                 <%=classList.get(i).getCL_START_DATE()%><br>&nbsp;&nbsp;~<%=classList.get(i).getCL_END_DATE()%><br>
                              </p>
                           </div>
                           <br>
                           <div class="col-5">
                              <p class="card-text" style="text-align: right;">
                              <div style="font-family: 바탕; font-size: 10pt;">
                                 <br>조회수<%=classList.get(i).getCL_VIEW()%></div>
                              </p>
                           </div>
                           <div class="col-7">
                              <p class="card-text" style="text-align: right;">
                              <div style="font-family: 바탕; font-size: 10pt;">
                                 <br>인원 현황&nbsp;&nbsp;<%=headCount.get(i)%>/<%=classList.get(i).getCL_CAPACITY()%>&nbsp;&nbsp;
                              </div>
                              </p>
                           </div>
                           <div class="btn-group"></div>
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
                  <%
                  if (CL_LOCATION != null && CL_CATEGORY == null) {
                  %>
                  <%if (startPage <= 5) {%>   
                  <li class="page-item"><a class="page-link"
                     href="classList.do?page=<%=startPage%>&CL_LOCATION=<%=CL_LOCATION%>">이전</a></li>
                  <%
                  } else {
                  %>
                  <li class="page-item"><a class="page-link"
                     href="classList.do?page=<%=startPage - 1%>&CL_LOCATION=<%=CL_LOCATION%>">이전</a></li>
                  <%
                  }
                  %>

                  <%
                  for (int a = startPage; a <= endPage; a++) {
                     if (a == nowPage) {
                  %><li class="page-item"><a class="page-link"
                     href="classList.do?page=<%=nowPage%>&CL_LOCATION=<%=CL_LOCATION%>"><%=a%></a></li>
                  <%
                  } else {
                  %>
                  <li class="page-item"><a class="page-link"
                     href="classList.do?page=<%=a%>&CL_LOCATION=<%=CL_LOCATION%>"><%=a%></a></li>
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
                     href="classList.do?page=<%=endPage%>&CL_LOCATION=<%=CL_LOCATION%>">다음</a></li>
                  <%
                  } else if (endPage == maxPage) {
                  %>
                  <li class="page-item"><a class="page-link"
                     href="classList.do?page=<%=endPage%>&CL_LOCATION=<%=CL_LOCATION%>">다음</a></li>
                  <%
                  } else {
                  %>
                  <li class="page-item"><a class="page-link"
                     href="classList.do?page=<%=endPage + 1%>&CL_LOCATION=<%=CL_LOCATION%>">다음</a></li>
                  <%
                  }
                  %>

                  <%
                  } else if (CL_LOCATION == null && CL_CATEGORY == null) {
                  %>
                  <%
                  if (startPage <= 5) {
                  %>
                  <li class="page-item"><a class="page-link"
                     href="classList.do?page=<%=startPage%>">이전</a></li>
                  <%
                  } else {
                  %>
                  <li class="page-item"><a class="page-link"
                     href="classList.do?page=<%=startPage - 1%>%>">이전</a></li>
                  <%
                  }
                  %>

                  <%
                  for (int a = startPage; a <= endPage; a++) {
                     if (a == nowPage) {
                  %><li class="page-item"><a class="page-link"
                     href="classList.do?page=<%=nowPage%>"><%=a%></a></li>
                  <%
                  } else {
                  %>
                  <li class="page-item"><a class="page-link"
                     href="classList.do?page=<%=a%>"><%=a%></a></li>
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
                     href="classList.do?page=<%=endPage%>">다음</a></li>
                  <%
                  } else if (endPage == maxPage) {
                  %>
                  <li class="page-item"><a class="page-link"
                     href="classList.do?page=<%=endPage%>">다음</a></li>
                  <%
                  } else {
                  %>
                  <li class="page-item"><a class="page-link"
                     href="classList.do?page=<%=endPage + 1%>">다음</a></li>
                  <%
                  }
                  %>
                  <%
                  } else if (CL_LOCATION == null) {
                  if (startPage <= 5) {
                  %>
                  <li class="page-item"><a class="page-link"
                     href="classList.do?page=<%=startPage%>&CL_CATEGORY=<%=CL_CATEGORY%>">이전</a></li>
                  <%
                  } else {
                  %>
                  <li class="page-item"><a class="page-link"
                     href="classList.do?page=<%=startPage - 1%>&CL_CATEGORY=<%=CL_CATEGORY%>">이전</a></li>
                  <%
                  }
                  %>
                  <%
                  for (int a = startPage; a <= endPage; a++) {
                     if (a == nowPage) {
                  %><li class="page-item"><a class="page-link"
                     href="classList.do?page=<%=nowPage%>&CL_CATEGORY=<%=CL_CATEGORY%>"><%=a%></a></li>
                  <%
                  } else {
                  %>
                  <li class="page-item"><a class="page-link"
                     href="classList.do?page=<%=a%>&CL_CATEGORY=<%=CL_CATEGORY%>"><%=a%></a></li>
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
                     href="classList.do?page=<%=endPage%>&CL_CATEGORY=<%=CL_CATEGORY%>">다음</a></li>
                  <%
                  } else if (endPage == maxPage) {
                  %>
                  <li class="page-item"><a class="page-link"
                     href="classList.do?page=<%=endPage%>&CL_CATEGORY=<%=CL_CATEGORY%>">다음</a></li>
                  <%
                  } else {
                  %>
                  <li class="page-item"><a class="page-link"
                     href="classList.do?page=<%=endPage + 1%>&CL_CATEGORY=<%=CL_CATEGORY%>">다음</a></li>
                  <%
                  }
                  } else if (CL_LOCATION != null) {
                  %>
                  <%
                  if (startPage <= 5) {
                  %>
                  <li class="page-item"><a class="page-link"
                     href="classList.do?page=<%=startPage%>&CL_LOCATION=<%=CL_LOCATION%>&CL_CATEGORY=<%=CL_CATEGORY%>">이전</a></li>
                  <%
                  } else {
                  %>
                  <li class="page-item"><a class="page-link"
                     href="classList.do?page=<%=startPage - 1%>&CL_LOCATION=<%=CL_LOCATION%>&CL_CATEGORY=<%=CL_CATEGORY%>">이전</a></li>
                  <%
                  }
                  %>

                  <%
                  for (int a = startPage; a <= endPage; a++) {
                     if (a == nowPage) {
                  %><li class="page-item"><a class="page-link"
                     href="classList.do?page=<%=nowPage%>&CL_LOCATION=<%=CL_LOCATION%>&CL_CATEGORY=<%=CL_CATEGORY%>"><%=a%></a></li>
                  <%
                  } else {
                  %>
                  <li class="page-item"><a class="page-link"
                     href="classList.do?page=<%=a%>&CL_LOCATION=<%=CL_LOCATION%>&CL_CATEGORY=<%=CL_CATEGORY%>"><%=a%></a></li>
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
                     href="classList.do?page=<%=endPage%>&CL_LOCATION=<%=CL_LOCATION%>&CL_CATEGORY=<%=CL_CATEGORY%>">다음</a></li>
                  <%
                  } else if (endPage == maxPage) {
                  %>
                  <li class="page-item"><a class="page-link"
                     href="classList.do?page=<%=endPage%>&CL_LOCATION=<%=CL_LOCATION%>&CL_CATEGORY=<%=CL_CATEGORY%>">다음</a></li>
                  <%
                  } else {
                  %>
                  <li class="page-item"><a class="page-link"
                     href="classList.do?page=<%=endPage + 1%>&CL_LOCATION=<%=CL_LOCATION%>&CL_CATEGORY=<%=CL_CATEGORY%>">다음</a></li>
                  <%
                  }
                  }
                  %>


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
   <script type="text/javascript">
      var urlParams = new URLSearchParams(window.location.search);
      urlParams.set('CL_LOCATION', '강남구');
      document.getElementById("yourElement").href = urlParams;
      $(".dropdown-item").on("click", function() {
         $(this).setAttribute("href", urlParams);
      });
   </script>
</body>

</html>