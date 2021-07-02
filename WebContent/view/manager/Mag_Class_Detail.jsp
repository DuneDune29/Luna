<%@page import="vo.ClassBean"%>
<%@page import="vo.JjimBean"%>
<%@page import="vo.ReservationBean"%>
<%@page import="vo.Customer_bean"%>
<%@page import="vo.User"%>

<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="dao.ReservationDAO" %>
<%@ page import="java.util.*"%>



<%
ClassBean article = (ClassBean)request.getAttribute("article");

ArrayList<ReservationBean> reservationList = (ArrayList<ReservationBean>) request.getAttribute("reservationList");
ArrayList<Customer_bean> customerList = (ArrayList<Customer_bean>) request.getAttribute("customerList");

String cusid = (String)request.getAttribute("cusid");
String path = (String)request.getAttribute("path");

int nowPage = (Integer)request.getAttribute("page");
Date date = new Date();
System.out.println(nowPage+"디테일 현재페이지");


Date currentDate = new Date(date.getTime());


long startDate = article.getCL_START_DATE().getTime();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
.btbt{
border-radius: 8px;
}


img {
   width: 150px;
   height: 150px;
   object-fit: cover;
   object-position: 50% 100%;
   border-radius: 10px;
}
</style>
<title>재능나눔 정보 : LunaClass</title>
<jsp:include page="/header2.jsp" />
</head>
<body>
    
  
   <br><br><br>
   <div class="container-fluid">
   <div class="row">
   <jsp:include page="/side2.jsp" />
<main class="col-md-6 col-lg-8 px-md-4" id="mainContainer">

			<br>
			<br>
			<h4>재능나눔 게시글 정보</h4>
			<hr>
			<br>
               <div class="container">
		<div class="row">
            <div class="col-md-8">
                  <div class="row">
                  
                  
                     <div class="col-3 ">
                        <img src="defualt.jpg">
                     </div>
                     <div class="col-9">
                        <div class="row">
                           <div class="col">
                              <h1 style="font-size: 40pt; font-family: THE외계인설명서;"><%=article.getCL_NAME()%></h1>
                           </div>
                        </div>
                        <div class="row">
                           <div class="col">
                              <h3 style="font-size: 30pt; font-family: THE외계인설명서;"><%=article.getCL_CATEGORY()%></h3>
                           </div>
                        </div>
                        <div class="row">
                           <div class="col">
                              <br>
                           </div>
                        </div>
                        <div class="row">
                           <div class="col">
                           
                             
<p>
  <a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                 fill="currentColor" class="bi bi-people" viewBox="0 0 16 16">
  <path
                                    d="M15 14s1 0 1-1-1-4-5-4-5 3-5 4 1 1 1 1h8zm-7.978-1A.261.261 0 0 1 7 12.996c.001-.264.167-1.03.76-1.72C8.312 10.629 9.282 10 11 10c1.717 0 2.687.63 3.24 1.276.593.69.758 1.457.76 1.72l-.008.002a.274.274 0 0 1-.014.002H7.022zM11 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0zM6.936 9.28a5.88 5.88 0 0 0-1.23-.247A7.35 7.35 0 0 0 5 9c-4 0-5 3-5 4 0 .667.333 1 1 1h4.216A2.238 2.238 0 0 1 5 13c0-1.01.377-2.042 1.09-2.904.243-.294.526-.569.846-.816zM4.92 10A5.493 5.493 0 0 0 4 13H1c0-.26.164-1.03.76-1.724.545-.636 1.492-1.256 3.16-1.275zM1.5 5.5a3 3 0 1 1 6 0 3 3 0 0 1-6 0zm3-2a2 2 0 1 0 0 4 2 2 0 0 0 0-4z" />
</svg>

  </a><span style="font-size: 19pt; font-family: THE외계인설명서;">&nbsp;&nbsp;<%=reservationList.size()%>/<%=article.getCL_CAPACITY()%>명</span>
</p>
<div class="collapse" id="collapseExample">
  <div class="card card-body">
    <%
                             
                            	  
                            	  
                              for(int i=0; i<reservationList.size(); i++){
                            	  
                            	  for(int j=0; j<customerList.size(); j++){
                            		  if(customerList.get(j).getCUS_ID().equals(reservationList.get(i).getRESV_USER_ID())){
                            			  %>
                            			  <%= customerList.get(j).getCUS_NAME()%>&nbsp;
                            			  <% }
                            		  }
                            	   }
                            	 
                            
                            		  %>
                            		
  </div>
</div>


                           </div>
                        </div>
                     </div>
                  </div>
                  <hr>
                  <div class="row">
                     <div class="col-6" style="font-size: 13pt; font-family: THE외계인설명서;">
                        <br>
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                           fill="currentColor" class="bi bi-calendar2-check"
                           viewBox="0 0 16 16">
  <path
                              d="M10.854 8.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L7.5 10.793l2.646-2.647a.5.5 0 0 1 .708 0z" />
  <path
                              d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM2 2a1 1 0 0 0-1 1v11a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1H2z" />
  <path
                              d="M2.5 4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H3a.5.5 0 0 1-.5-.5V4z" />
</svg>
                        &nbsp;&nbsp;<%=article.getCL_START_DATE()%> ~ <%=article.getCL_END_DATE()%>
                     </div>
                     <div class="col-6" style="font-size: 13pt; font-family: THE외계인설명서;">
                        <br>
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                           fill="currentColor" class="bi bi-pin-map" viewBox="0 0 16 16">
  <path fill-rule="evenodd"
                              d="M3.1 11.2a.5.5 0 0 1 .4-.2H6a.5.5 0 0 1 0 1H3.75L1.5 15h13l-2.25-3H10a.5.5 0 0 1 0-1h2.5a.5.5 0 0 1 .4.2l3 4a.5.5 0 0 1-.4.8H.5a.5.5 0 0 1-.4-.8l3-4z" />
  <path fill-rule="evenodd"
                              d="M8 1a3 3 0 1 0 0 6 3 3 0 0 0 0-6zM4 4a4 4 0 1 1 4.5 3.969V13.5a.5.5 0 0 1-1 0V7.97A4 4 0 0 1 4 3.999z" />
</svg>
                        &nbsp;&nbsp;<%=article.getCL_LOCATION()%>&nbsp;&nbsp;나눔센터
                     </div>
                  </div><br><br><br><br>
                  <div style="font-size: 25pt; font-family: THE외계인설명서;">재능 상세설명
                     <div class="form-group" style="font-size: 18pt; font-family: THE외계인설명서;"><br>
                        <label for="CL_CONTENT" class="form-label"></label>
                        
                        <%=article.getCL_CONTENT()%>
                        
                     </div>
                  </div>
 

               </div>
               
               <div class="col-md-4">
      <div class="position-sticky" style="top: 2rem;">
      <div><br><br></div>
        <div class="p-4 mb-3 bg-light rounded">
          <h4 class="fst-italic" style="font-size: 20pt; font-family: THE외계인설명서;  text-align: center;">한줄 소개</h4><br>
          <p class="mb-0" style="font-size: 17pt; font-family: THE외계인설명서;  text-align: center;"><%=article.getCL_INTRODUCTION()%></p><br>
          <div style="text-align: center;" class="col">
          <%if(path==null){ %>
      <button style="border-radius: 8px; color: white; font-family: THE외계인설명서; text-align: center;" type="button" class="form-control btn btn-primary submit px-3 col-md-5" onClick="location.href='mag_class_delete.do?cl_id=<%=article.getCL_ID()%>&page=<%=nowPage%>'">삭제하기</button>
    <%}else{ %>
     <button style="border-radius: 8px; color: white; font-family: THE외계인설명서; text-align: center;" type="button" class="form-control btn btn-primary submit px-3 col-md-5" onClick="location.href='mag_class_delete.do?cl_id=<%=article.getCL_ID()%>&page=<%=nowPage%>&cusid=<%=cusid%>&path=<%=path%>'">삭제하기</button>
   <%} %>
   <button style="border-radius: 8px; color: white; font-family: THE외계인설명서; text-align: center;" type="button" class="form-control btn btn-primary submit px-3 col-md-5" onClick="location.href=''">수정하기</button>
   </div>
        </div>
      </div>
    </div>
            </div>
            
    

     
    
    
    
    </div>
         </main>
    </div>
       
    


</div>
   <jsp:include page="/footer.jsp" />
</body>

</html>