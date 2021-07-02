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
	ArrayList<ClassBean> classList = (ArrayList<ClassBean>) request.getAttribute("classList");
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
	String cusid=(String)request.getAttribute("cusid");
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	
	System.out.println(nowPage+"현재페이지");

	
	
	
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
<jsp:include page="/header2.jsp" />
<br>
<br>

<div class="nav nav-pills flex-column flex-sm-row">

	
	<jsp:include page="/side2.jsp" />

	<main class="col-md-8 col-lg-10 px-md-4">
	<br>
			<br>
			<h4><%=cusid %>님의 재능 나눔</h4>
			<hr>
			<br>
      
      <%
            if (classList != null && listCount > 0) {
         %>
      <div class="container">
      
       <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-5">
      <%
               for (int i = 0; i < classList.size(); i++) {
            %>
         <% 
			String path="Mag_cusClassList.do";
			
			 %>
       <div><a href="Mag_classDetail.do?CL_ID=<%=classList.get(i).getCL_ID()%>&page=<%=nowPage %>&cusid=<%=cusid %>&path=<%=path %>" style="color:black; text-decoration: none;">  
        <div class="col" style="margin:0px">
          <div class="card shadow-sm select-all">
<%--             <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><img src="<%=cultureClassList.get(i).getCL_IMG_PATH()%>" width=150px></svg> --%>
<img src="<%=classList.get(i).getCL_IMG_PATH()%>" width=300px height=200px>


                           <div style="text-align: center; font-size: 19pt; font-family: THE외계인설명서;"><strong><%=classList.get(i).getCL_NAME()%></strong></div>
                           
                           <div style="text-align: center; font-size: 13px; font-family: THE외계인설명서;">
                           <%=classList.get(i).getCL_INTRODUCTION()%>
                </div>

            <div style="font-family: 바탕; font-size: 12pt;" class="card-body row" style="padding:5px; margin:0px">
            
            <div class="col-5" >
            
              <p class="card-text" style="text-align: right;">
              	카테고리<br>
              	위치<br>
              	기간<br>
              	</p>
              	</div>
              	<div class="col-7"><p class="card-text">
              	
              	<%=classList.get(i).getCL_CATEGORY()%><br>
              	<%=classList.get(i).getCL_LOCATION()%>&nbsp;나눔센터<br>
              	<%=classList.get(i).getCL_START_DATE()%><br>&nbsp;&nbsp;~<%=classList.get(i).getCL_END_DATE()%><br>
              	</p></div>
              	<br>
              	<div style="font-family: 바탕; font-size:10pt;"><br>조회수<%=classList.get(i).getCL_VIEW()%></div>
              
<!--               <div class="d-flex justify-content-between align-items-center"> -->
                <div class="btn-group">
                </div>
                
                
                
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
    </main>
		</div>
		<br>
		
		
		
     <ul>
   <li>
   <section id="pageList" style="text-align : center">

                     <%if(nowPage<=1){ %>
                     <span id="paging">&lt;이전</span>
                     <%
                     } else if (startPage <= 5) {
                     %>
                     <a href="Mag_cusClassList.do?cusid=<%=cusid %>&page=<%=startPage%>" id="paging">&lt;이전</a>
                     
                     <%
                        } else {
                     %>
                     <a href="Mag_cusClassList.do?cusid=<%=cusid %>&page=<%=startPage - 1%>" id="paging">&lt;이전</a>
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
                        <a href="Mag_cusClassList.do?cusid=<%=cusid %>&page=<%=a%>" id="paging"><%=a%></a>
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
                     <a href="Mag_cusClassList.do?cusid=<%=cusid %>&page=<%=nowPage+1 %>" id="paging">다음&gt;</a>
                     <%
                        } else {
                     %>
                     <a href="Mag_cusClassList.do?cusid=<%=cusid %>&page=<%=endPage+1%>" id="paging">다음&gt;</a>
                     <%
                        }
                     %>

                  </section>
                     </li>
                  </ul>
     
         <%} %>
		
	
				</div>
			</main>
	
			
		</div>
	</div>
			<br>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
			crossorigin="anonymous"></script>
			
			
		<jsp:include page="/footer.jsp" />
</body>
</html>