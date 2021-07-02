<%@page import="vo.ClassBean"%>
<%@page import="vo.JjimBean"%>
<%@page import="vo.ReservationBean"%>
<%@page import="vo.Customer_bean"%>
<%@page import="vo.User"%>
<%@page import="action.auth.LogoutAction"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="dao.ReservationDAO" %>
<%@ page import="java.util.*"%>



<%@ page import="java.util.ArrayList" %>
<%@ page import="vo.replyBean" %>
<%@ page import="vo.recomment_bean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
int board_num = Integer.parseInt(request.getParameter("CL_ID"));

ArrayList<replyBean> commentlist = (ArrayList<replyBean>) request.getAttribute("commentList");
ArrayList<recomment_bean> recommentlist = (ArrayList<recomment_bean>) request.getAttribute("recommentList");

	
pageContext.setAttribute("crcn", "\n"); 
pageContext.setAttribute("br", "<br/>");

%>












<%
Cookie recentlyViewed ;
recentlyViewed = new Cookie(request.getParameter("CL_ID") ,null);
recentlyViewed.setMaxAge(0);
response.addCookie(recentlyViewed);
recentlyViewed = new Cookie(request.getParameter("CL_ID") , request.getParameter("CL_ID"));
recentlyViewed.setMaxAge(60*60*24*3);
response.addCookie(recentlyViewed);
%>
<%
ClassBean article = (ClassBean)request.getAttribute("article");
JjimBean jjimBean = (JjimBean)request.getAttribute("jjimBean");
ArrayList<ReservationBean> reservationList = (ArrayList<ReservationBean>) request.getAttribute("reservationList");
ArrayList<Customer_bean> customerList = (ArrayList<Customer_bean>) request.getAttribute("customerList");
String userId = (String)request.getAttribute("userId");
String nowPage = (String)request.getAttribute("page");
Date date = new Date();


Date currentDate = new Date(date.getTime());


long startDate = article.getCL_START_DATE().getTime();
%>

<script src="https://kit.fontawesome.com/848d8f1fa9.js" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
img {
   width: 150px;
   height: 150px;
   object-fit: cover;
   object-position: 50% 100%;
   border-radius: 10px;
}

.btbt{
/* width: 250px; */
font-family: THE외계인설명서;
border-radius: 8px;
}

.people{
background-color: white;
}

.comment {
	 border-top: 1px solid black;
	position:relative;
	display:flex;
	flex-wrap: wrap;
	margin-bottom:20px;
}

table {
	width:100%;
	
}

.id_date {
	position:relative;
	
}

.left-id {
	position:absolute
}
.left-button {
	position:absolute;
	top:0;
}
.left-date {
	position:absolute;
	right:0;
	padding: 0 7px 0 0;
}
.left-button,.left-content {
	display:inline-block;
	padding: 0px 0px 10px 0px;
}
.left-content {
	float:left;
}
.left-button {
	
	position:absolute;
	right:0;
	top:0;
	margin:0;
	padding: 0 0 0 10px;
}
.left-section {
	 border-bottom: 1px solid black;
}
.left-info {
	padding:0 0 0 8px;
	
}
.left-info{
	position:relative;
	display:block;
	width:100%;
	margin: 7px 0 5px 0;
}
.comment-content {
	position:relative;
	display:block;
	width:100%;
	padding: 0 0 10px 15px;
}
.comment-count{
    margin: 0;
    border-bottom: 1px solid black;
    float: left;
    margin-bottom: 1rem;
}
.comment-count h4{
    margin: 0;
}

.comment-txt {
	padding: 0 0 0 20px;
}
.commnet-container table tbody .left-info-Id_date{
    display: block;
    font-weight: bold;
    color: cornflowerblue;
    margin-right: 8px;
}
.comment-txt textarea{
    resize: none;
    padding: 1rem 1rem 1.5rem;
    outline: none;
    border: 1px solid rgb(233, 236, 239);
    margin-top: 1.5rem;
    margin-bottom: 1rem;
    width: 100%;
    border-radius: 4px;
    min-height: 6.125rem;
    font-size: 1rem;
    color: rgb(33, 37, 41);
    line-height: 1.75;
    max-width: 840px;
}
.comment-button{
    position:relative;
	display:block;
	width:50%;
	padding: 0 0 0 6px;
	min-width: 100px;
}
.comment-button button {
    font-weight: bold;
    cursor: pointer;
    outline: none;
    border: none;
    background: #8bd6f1;
    color: white;
    border-radius: 4px;
    
    height: 2rem;
    font-size: 1rem;
  	width:100%;
}



.content-count{
    float: left;
    width: 50px;
    display: block;
}
.content-count p{
    text-align: center;
}
.fix-comment-txt textarea{
    resize: none;
    padding: 1rem 1rem 1.5rem;
    outline: none;
    border: 1px solid rgb(233, 236, 239);
    margin-top: 1.5rem;
    margin-bottom: 1rem;
    width: 100%;
    border-radius: 4px;
    min-height: 6.125rem;
    font-size: 1rem;
    color: rgb(33, 37, 41);
    line-height: 1.75;
}
.fix-comment {
	width:100%;
	margin-bottom:25px;
}

.fix-comment-button{
	display: block;
    padding: 0px 5px;
    margin-bottom:10px; 
    position:absolute;
    right:0;
}
/* fixcomment */
.fix-comment-button input{
    font-weight: bold;
    cursor: pointer;
    outline: none;
    border: none;
    background: #8bd6f1;
    color: white;
    border-radius: 4px;
    padding: 0px 1.25rem;
    height: 2rem;
    font-size: 1rem;
}

.reComment-txt textarea{
    resize: none;
    padding: 1rem 1rem 1.5rem;
    outline: none;
    border: 1px solid rgb(233, 236, 239);
    border-radius: 4px;
    min-height: 6.125rem;
    font-size: 1rem;
    color: rgb(33, 37, 41);
    line-height: 1.75;
    width: 100%;
}
.reComment-txt{
    width: 90%;
}
.reComment-button button{
    font-weight: bold;
    
    outline: none;
    border: none;
    background: #8bd6f1;
    color: white;
    border-radius: 4px;
    height: 2rem;
    font-size: 1rem;
    margin-left: 0px;
    position: relative;
    bottom:5px;

}.reCmtCnt{
    margin: 15px 45px 20px 45px;
    padding: 0 0 0 8px;
    display: block;
    border: 1px solid gray;
    background-color: rgb(248, 249, 250);
    position: relative;
}
.reCmtCnt-content{
    display: block;
    position:relative;
    padding: 0 0 0 10px;
    margin: 0 0 7px 0;
}
.recomment-button {
	position:absolute;
	right:0;
	top:0;
	padding: 0 7px 0 0;
}
.reComment-fixTxt{
    width: 90%;
}
.reComment-button{
	padding: 0 0 0 5px;
	position:relative;
	font-size: 15px;
	
}
.hiddenReCmtFix{
	padding:0;
	margin: 15px 0px 20px 45px;
    display:inline-block;
    width:90%;
}
.reComment-fixTxt textarea{
    resize: none;
    padding: 1rem 1rem 1.5rem;
    outline: none;
    border: 1px solid rgb(233, 236, 239);
    border-radius: 4px;
    min-height: 6.125rem;
    font-size: 1rem;
    color: rgb(33, 37, 41);
    line-height: 1.75;
    width: 100%;
}
.reComment-fixButton {
	padding: 0 0 0 5px;
	position:relative;
	font-size: 15px;
}
.reComment-fixButton button{
    font-weight: bold;
    cursor: pointer;
    outline: none;
    border: none;
    background: #8bd6f1;
    color: white;
    border-radius: 4px;
    height: 2rem;
    font-size: 1rem;
    margin-bottom: 5px;
    min-width:78px;
}

.reCmtCnt-Id_Date{
	position:relative;
	display:block;
	width:100%;
	margin: 7px 0 0 0;
}
.recomment-confirm {
	padding:0;
	position:relative;
	margin: 15px 0px 20px 45px;
}
.recomment-candle {
	position:relative;
	top:0;
	right: 0;
	padding-bottom:10px;
	width:100px;
}
.totalcomment {
	text-align:center;
	width:100%;
}
.totalcomment button{
	margin-top:10px;
	font-weight: bold;
    outline: none;
    border: none;
    background: #8bd6f1;
    color: white;
    border-radius: 4px;
    height: 2rem;
    font-size: 1rem;
}

#img_profile {
	 width: 30px;
    height: 30px;
    border-radius: 150px; /* 레이어 반크기만큼 반경을 잡기*/    
    vertical-align: middle;
    object-fit: cover;
}
#mainpage, #pagemain {
	padding:3px;
}
.profile_id {
	display:inline-block;
}
.profile_id span {
	padding: 0 0 0 5px;
	margin: 5px 0 0 0;	
}


</style>
<title>Insert title here</title>
<jsp:include page="/header.jsp" />
</head>
<body>
   
   <div class="container-fluid">
   
      <div class="row">
         <div
            class="col-12 col-sm-12 col-md-auth col-lg-auto flex-column flex-shrink-0 p-3 bg-light "
            style="width: 280px;"></div>

         <main class="col-12 col-md-12 ms-sm-auto col-lg-8 px-md-4">
<br><br><br><br><br><br><br><br><br>
         <div class="row g-5">

            <div class="col-md-8">
               <div class="container">
                  <div class="row">
                     <div class="col-3 ">
                        <img src="<%=request.getContextPath()%>/upload/<%=article.getCL_IMG_PATH()%>">
                     </div>
                     <div class="col-9">
                        <div class="row">
                           <div class="col">
                              <h1 style="font-size: 40pt; font-family: THE외계인설명서;"><%=article.getCL_NAME()%></h1>
                           </div>
                        </div>
                        <div class="row">
                           <div class="col">
                              <h3 style="font-size: 30pt; font-family: THE외계인설명서;"><%
										if (article.getCL_CATEGORY().equals("art")) {
									%>예술
									<%
										} else if (article.getCL_CATEGORY().equals("life")) {
									%>문화, 생활
									<%
										} else if (article.getCL_CATEGORY().equals("health")) {
									%>건강 , 미용
									<%
										} else if (article.getCL_CATEGORY().equals("development")) {
									%>IT/개발
									<%
										} else if (article.getCL_CATEGORY().equals("therapy")) {
									%>심리
									<%
										} else if (article.getCL_CATEGORY().equals("etc")) {
									%>기타
									<%
										}
									%></h3>
                           </div>
                        </div>
                        <div class="row">
                           <div class="col">
                           </div>
                        </div>
                        <div class="row">
                           <div class="col-10">
                           
                             
<span style="font-size: 17pt; font-family: THE외계인설명서; align: right;">
  <button class="btn btn-primary people" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    <i class="far fa-user"></i>

  </button>&nbsp;&nbsp;<%=reservationList.size()%>/<%=article.getCL_CAPACITY()%>명</span>

<div class="collapse" id="collapseExample">
  <div class="card card-body">
    <%
                              if(userId != null){
                            	  if(userId.equals(article.getCL_WRITER_ID())){
                            	  
                            	  
                              for(int i=0; i<reservationList.size(); i++){
                            	  
                            	  for(int j=0; j<customerList.size(); j++){
                            		  if(customerList.get(j).getCUS_ID().equals(reservationList.get(i).getRESV_USER_ID())){
                            			  %>
                            			  <%= customerList.get(j).getCUS_NAME()%>&nbsp;
                            			  <% }
                            		  }
                            	   }
                            	 
                            	  }
                              }
                            		  %>
                            		  
                            		  <% 
                            		  if(userId == null || !userId.equals(article.getCL_WRITER_ID())){
                            			  %>
                            			  예약현황은 재능 생성자만 확인 가능합니다.
                            		  <% }%>
  </div>
</div>


                           </div>
                           
                           
                           <div class="col-2">
                           
                           
                           
                           
                           
                           <%
                                     	if (startDate <= date.getTime() || reservationList.size() >= article.getCL_CAPACITY()) {
                                     		%>
                                     		
                               <%} else {
 	                         	 	  
 	                         	 	  if(userId == null || !userId.equals(article.getCL_WRITER_ID())){
 	                         	 		%>
 	                         	 	  <% 
 	                         	 	  if(jjimBean != null){
 	                         	 		%>
 	                         	 		 <button class="btn btn-danger" type="button" onclick="location.href='jjimCancelDetail.do?CL_ID=<%=article.getCL_ID()%>'"><i class="far fa-heart"></i></button>
 	                         	 	  
 	                         	 	  <% 
 	                         	 	  }else{
 	                         	 		  
 	                         	 		%>
 	                         	 	 <button class="btn btn-outline-danger" type="button" onclick="location.href='jjimDetail.do?CL_ID=<%=article.getCL_ID()%>'"><i class="far fa-heart"></i></button>
 	                         	 	  <%
 	                         	 	  }
 	                         	 	%>
                               		<% 	}	
                               }
                             %>
                           
                           
                           
                           
                           
                           
                           </div>
                           
                        </div>
                     </div>
                  </div>
                  <hr>
                  <div class="row">
                     <div class="col-6" style="font-size: 13pt; font-family: THE외계인설명서;">
                        <br>
                        <i class="far fa-calendar-alt"></i>
                        &nbsp;&nbsp;<%=article.getCL_START_DATE()%> ~ <%=article.getCL_END_DATE()%>
                     </div>
                     <div class="col-6" style="font-size: 13pt; font-family: THE외계인설명서;">
                        <br>
                        <i class="fas fa-map-marker-alt"></i>
                        &nbsp;&nbsp;<%=article.getCL_LOCATION()%>&nbsp;&nbsp;나눔센터
                     </div>
                  </div><br><br><br><br>
                  <div style="font-size: 25pt; font-family: THE외계인설명서;">재능 상세설명
                     <div class="form-group" style="font-size: 18pt; font-family: THE외계인설명서;"><br>
                        <label for="CL_CONTENT" class="form-label"></label>
                        
                        <%=article.getCL_CONTENT()%>
                        
                     </div>
                  </div>
 
 
 
 
 
 
 
 
 
 <div class="commnet-container">
  	 		 <div class="comment-count">
     	  		 <h4>Comments <%=commentlist.size()%></h4>
   		 	</div>
    </div> 
                  
                  <table>
            <c:if test="${sessionScope.authUser.id !=null}">
            <tr>
            
            <form id="target" action="classDetail.do?CL_ID=${CL_ID}" method="post">
          	 <input type="hidden" name="CL_ID" value="${CL_ID}">
                <input type="hidden" name="comment_id" value="${sessionScope.authUser.id}">
              
                <td>
                    <div class="comment-txt">
                        <textarea id ="comment_content" name="comment_content" rows="4" cols="70" ></textarea>
                    </div>
                </td>
                <!-- 댓글 등록 버튼 -->
                <td>
                    <div class="comment-button">
                        <button type="submit" id="submit">댓글달기</button>
                    </div>
                </td>
            </form>
            </tr>
            </c:if>
        </table>
        
   	 <div class="comment">
   	 	<div class="border-comment" ></div>
	   <c:forEach items="${requestScope.commentList}" var="comment" varStatus="status">
	    <table id="tableDisplay${status.index}" class="tableNone" style="display:none">
	    	
	        <tbody class="cmt-body cmt-content${status.index}">
	            <tr class="left-section">
	             	
	                <td class="left-info">
	                	<div class="id_date">
	                	<c:choose>
	                		<c:when test="${comment.comment_profile !=null}">
	                			<div class="profile_id">
			                		<img id="img_profile" src="<c:url value='/upload/profile/${comment.comment_profile}'/>">
			                		<span class=left-id>${comment.comment_id}</span>
	                			</div>
	                			<span class="left-date">${comment.comment_date}</span>
	                		</c:when>
	                		<c:when test="${comment.comment_profile ==null}">
	                				 <img id="img_profile" src="<c:url value='/upload/profile/basic.png'/>">
			                		<span class=left-id>${comment.comment_id}</span>
	                				<span class="left-date">${comment.comment_date}</span>
	                		</c:when>
	                	</c:choose>
	                	</div>
	                
	                 <td class="comment-content" width="100%">
	                 	
	                		 <div class="left-content">${fn:replace(comment.comment_content,crcn,br)}</div>
	                		 <c:if test="${sessionScope.authUser.id !=null}">
	                		<c:set var="Comment" value="${comment.comment_content}"/>
	                		<c:set var="Checkcomment" value="삭제된 댓글입니다"/>
	                		<c:if test="${Comment != Checkcomment}">
	                		
	                 	 <div class="left-button button${status.index}" style="disply:none">
	                 		 <c:if test="${comment.comment_id != sessionScope.authUser.id}">
	                 	 	<a href ="javascript:void(0)" id="reCmt${status.index}" class="right-info">[댓글달기]</a>
	                 	 	</c:if>
	                 	 	<c:if test="${comment.comment_id == sessionScope.authUser.id}">
			                <a href="javascript:void(0)" class="right-info tabActive${status.index}">[수정]</a>
			                <a href="delte.do?comment_num=${comment.comment_num}&CL_ID=${CL_ID}" class="right-info deleteNotCommet${status.index }">[삭제]</a>
			                </c:if>
		                 </div>
		                </c:if>
		                </c:if>
		                
	                 </td>
	               
	           </tr>
	        </tbody>
	        </div>
			
	        <tfoot>
	        
	        <tr class="recomment-confirm reCmt-hidden${status.index} hiddenReCmt" style="display:none">
	       		 <form id="recommentform${status.index}" action="recomment.do?CL_ID=${CL_ID}" method="post"> 
	       		 	<td class="reComment-txt">
	                	<textarea id="reCmtCnt${status.index}" name="reCmtCnt" placeholder="여러분의 소중한 댓글을 입력해주세요."></textarea>
	                	 <input type="hidden" name="comment_id" value="${sessionScope.authUser.id}">
	                	 <input type="hidden" name="recomment_comment_num" value="${comment.comment_num}">
	           		 </td>
		            <td class="reComment-button">
		            	<div class="recomment-candle tabActive${status.index}"><button type="button">취소하기</button></div>
		                <div><button type="submit" id="resubmit">댓글달기</button></div>
		            </td>
	            </form>
	           
	           
	        </tr>
	        
	        <div class="fix-comment fix-comment-hidden${status.index}" style="display: none">
	        	<form action="updatecomment.do" method="POST" class="updateform">
	            <div class="fix-comment-txt">
	            		
	            	<textarea id="fixCmtCnt${status.index}" name="fixcmtCnt">${comment.comment_content}</textarea>
		               	 	<input type="hidden" name="CL_ID" value="${CL_ID}">
		               	 	<input type="hidden" name="comment_num" value="${comment.comment_num}">
		        </div>
		       
	           		 <div class="fix-comment-button">
		              	<input type="submit" value="수정하기" class="fixcomment${status.index}">
		                <input type="button" class="fix-CmtBtn-cancel tabActive${status.index}" value="취소하기">
	            	 </div>
	  			
	               </form>
	        </div>
	        <br>
	         <c:forEach items="${requestScope.recommentList}" var="recomment" varStatus="status1">
	   			 <c:if test="${comment.comment_num eq recomment.recomment_comment_num}">
	     
	      	  <tr class="reCmtCnt reFixCmt-hiddenInfo${status1.index}" >
	           
	            <td class="reCmtCnt-Id_Date recomment_date${status1.index }">
	            		
						  <div class="id_date">
						  	<c:choose>
	                		<c:when test="${recomment.recomment_profile !=null}">
	                			<div class="profile_id">
			                		<img id="img_profile" src="<c:url value='/upload/profile/${recomment.recomment_profile}'/>">
			                		<span class=left-id>${recomment.recomment_id}</span>
	                			</div>
	                			<span class="left-date">${recomment.recomment_date}</span>
	                		</c:when>
	                		<c:when test="${recomment.recomment_profile ==null}">
	                				 <img id="img_profile" src="<c:url value='/upload/basic.png'/>">
			                		<span class=left-id>${recomment.recomment_id}</span>
	                				<span class="left-date">${recomment.recomment_date}</span>
	                		</c:when>
	                	</c:choose>
				    	   </div>
	            </td>
	            
			            <td class="reCmtCnt-content recomment-content${status1.index}">
			            	${fn:replace(recomment.recomment_content,crcn,br)}
			            	<c:if test="${recomment.recomment_id == sessionScope.authUser.id }">
			            	<span class="recomment-button">
			            	<a href="javascript:void(0)" class="reCmtCnt-right-info tabActive${status1.index}" >[수정]</a>
			            	<a href="deleterecomment.do?recomment_num=${recomment.recomment_num}&CL_ID=${CL_ID}" class="deleteComment${status1.index }">[삭제]</a>
			            	</span>
			            	</c:if>
			            </td>
	        	
	            
	        	</tr>
	        		
	       			 <tr class="reFixCmt-hidden${status1.index} hiddenReCmtFix" style="display: none">
	       			 	<form action="updateRecomment.do" method="POST" id="updateRecommentform${status1.index} updateRecomment">
			            <td class="reComment-fixTxt">  	
			                <textarea id="reFixCmtCnt${status1.index}" name="reFixCmtCnt" placeholder="여러분의 소중한 댓글을 입력해주세요.">${fn:replace(recomment.recomment_content,crcn,br)}</textarea>
			    
			                 	 <input type="hidden" name="CL_ID" value="${CL_ID}">
				               	 <input type="hidden" name="recomment_num" value="${recomment.recomment_num}">
			            </td>
			            <td class="reComment-fixButton">
			            	<div><button id="reFixCmtCnt-btn${status1.index}" class="reCmtBtn fixTabActive${status1.index}" type="submit">수정하기</button></div>
			                <div class="recomment-update-candle tabActive${status1.index}"><button type="button" class="candlebutton fix-CmtBtn-cancel">취소하기</button></div>
			            </td>
			            </form>
	    	   		 </tr>
	    	   		 
	      		 </c:if>
	       		</c:forEach>	        
	        </tfoot>
	    </table>
	   				 <c:if test="${status.last eq true}">
	      				<div class="totalcomment"><button id="totalcomment" onclick="commentTotal()">댓글보기</button></div>
	      			</c:if>
</c:forEach>
             
        </div>
 
 
 
 
 
 
 
 
 
 
 
 

               </div>
            </div>
            
            <div class="col-md-4">
            
      <div class="position-sticky" style="top: 2rem;">
        <div class="p-4 mb-3 bg-light rounded">
          <h4 class="fst-italic" style="font-size: 20pt; font-family: THE외계인설명서;  text-align: left;">한줄 소개</h4>
          <p class="mb-0" style="font-size: 17pt; font-family: THE외계인설명서;  text-align: left;"><%=article.getCL_INTRODUCTION()%></p>
        
        
        
        <div style="text-align: center;"class="p-4">
        <% 
			String path="reservationCompleted.do?CL_ID="+article.getCL_ID();
			
			request.getSession().setAttribute("path", path);
			
			
			String path1="classDetail.do?CL_ID="+article.getCL_ID();
			
			request.getSession().setAttribute("path1", path1);
			%>
        
        
          							<%
                                     	if (startDate <= date.getTime() || reservationList.size() >= article.getCL_CAPACITY()) {
                                     		%><p>모집이 마감되었습니다.</p>
                                     		
                               <%} else if(userId != null&&userId.equals(article.getCL_WRITER_ID())){
                            	 
                            		   %>
                            		   
                                	   <button style="font-size: 17pt; border-radius: 8px;" class="btn btn-primary text-white btbt" type="button" onclick="location.href='classUpdateForm.do?CL_ID=<%=article.getCL_ID()%>'">수정하기</button>
                                	  
                                   
                            	   <%
                            	   
                               }
                               else{ 	  
 	                         	 	  
 	                         	 	%>
                                      <button style="font-size: 17pt; border-radius: 8px;" class="btn btn-primary text-white btbt" type="button" onclick="location.href='reservationCompleted.do?CL_ID=<%=article.getCL_ID()%>'">예약하기</button>	
                               		<% 	}	
                               
                             %>
        
       
        </div>
        
        </div>


      </div>
    </div>

         </main>
         <main class="col-md-3 ms-sm-auto col-lg-2 px-md-4 bg-light"></main>
      </div>


   </div>
   
   
   <jsp:include page="/footer.jsp" />
   
   
   
   
   
   
   
   
   
   <script type="text/javascript">

	$(document).ready(function() {
		$('#target').submit(function() {
			if($('#comment_content').val() == '') {
				alert("댓글을 입력해주세요");
				return false;
			}
			else {
				alert("댓글이 달렸습니다");
			}
		});
	});
	<%
   	 for(int i=0;i<commentlist.size();i++) {
	%>
		$("#reCmt<%=i%>").click(function (){
			
			$('.hiddenReCmtFix').hide();
			$('.reCmtCnt').show();
			$('.fix-comment').hide();
        	$('.cmt-body').show();
		    $(".hiddenReCmt").css("display", "none");
		    $(".reCmt-hidden<%=i%>").css("display", "block");
		});
		
		$(document).ready(function() {
			$('.deleteNotCommet<%=i%>').click(function () {
				if(confirm("댓글을 삭제 하시겠습니까?")) {
					return true;	
				}
				else {
					return false;
				}
				});
			});
		
	<% } %>
	
	<%
	for(int i=0;i<commentlist.size();i++) {
	%>
		$('.tabActive<%=i%>').click(function () {
        if ($(this).hasClass('right-info')) {
        	$('.recomment-confirm').hide();
        	$('.hiddenReCmtFix').hide();
        	$('.reCmtCnt').show();
        	$('.fix-comment').hide();
        	$('.cmt-body').show();
            $('.cmt-content<%=i%>').hide();
            $('.fix-comment-hidden<%=i%>').show();
            
        }
        if ($(this).hasClass('fix-CmtBtn-cancel')) {
        	alert("취소되었습니다");
        	var comment_content = document.getElementById("fixCmtCnt<%=i%>").innerHTML;
        	 document.getElementById("fixCmtCnt<%=i%>").value = comment_content;
            $('.fix-comment-hidden<%=i%>').hide();
            $('.cmt-content<%=i%>').show();
        }
        if($(this).hasClass('recomment-candle')) {
        	alert("취소되었습니다");
			$('.reCmt-hidden<%=i%>').hide();
		}
    });
	//댓글달기
	$(document).ready(function() {
		$('#recommentform<%=i%>').submit(function() {
			if($('#reCmtCnt<%=i%>').val() == '') {
				alert("댓글을 입력해주세요");
				
				return false;
			}
			else {
				alert("답변이 완료 되었습니다");
			}
		});
	});
	//댓글수정
	$(document).ready(function() {
		
		$('.fixcomment<%=i%>').click(function () {
			
			if($('#fixCmtCnt<%=i%>').val() == '') {
				var comment_content = document.getElementById("fixCmtCnt<%=i%>").innerHTML;
				 alert("댓글을 입력해주세요");
				 $('.fix-comment-hidden<%=i%>').hide();
		         $('.fixbutton<%=i%>').show();
		         $('.cmt-content<%=i%>').show();
		         document.getElementById("fixCmtCnt<%=i%>").value = comment_content;	
		           return false;
			}
			else  {
				alert("수정이 완료 되었습니다");
			}
		});
		});
    <% } %>
    
    <%
    for(int a = 0; a <recommentlist.size(); a++) {
	%>
		$('.tabActive<%=a%>').click(function () {
	    if ($(this).hasClass('reCmtCnt-right-info')) {
	    	$('.recomment-confirm').hide();
	    	$('.hiddenReCmtFix').hide();
			$('.reCmtCnt').show();
			$('.fix-comment').hide();
        	$('.cmt-body').show();
	        $('.reFixCmt-hiddenInfo<%=a%>').hide();
	        $('.reFixCmt-hidden<%=a%>').show();
	    }
	    if($(this).hasClass('recomment-update-candle')) {
	    	alert("취소되었습니다");
	    	var comment_content = document.getElementById("reFixCmtCnt<%=a%>").innerHTML;
       		 document.getElementById("reFixCmtCnt<%=a%>").value = comment_content;
			$('.reFixCmt-hidden<%=a%>').hide();
			 $('.reFixCmt-hiddenInfo<%=a%>').show();
		}
	});
		
<% } %>

	<%
	for(int a = 0; a <recommentlist.size(); a++) {
	%>
		$(document).ready(function() {
		$('.fixTabActive<%=a%>').click(function () {
			if($('#reFixCmtCnt<%=a%>').val() == '') {
					alert("댓글을 입력해주세요");
					var comment_content = document.getElementById("reFixCmtCnt<%=a%>").innerHTML;
		        	 document.getElementById("reFixCmtCnt<%=a%>").value = comment_content;
					$('.reFixCmt-hidden<%=a%>').hide();
					 $('.reFixCmt-hiddenInfo<%=a%>').show();
					 return false;
			}
			else  {
				alert("수정이 완료 되었습니다");
				return true;
			}
		});
		});
		$(document).ready(function() {
			$('.deleteComment<%=a%>').click(function () {
				if(confirm("댓글을 삭제 하시겠습니까?")) {
					return true;	
				}
				else {
					return false;
				}
				});
			});
	<% } %>
	
	function commentTotal() {
		<%for(int i=0;i<commentlist.size();i++) {%>
			if($('#tableDisplay<%=i%>').css('display') === 'none') {
				$('#tableDisplay<%=i%>').show();
				document.getElementById("totalcomment").innerHTML="댓글닫기";
			}
			else {
				document.getElementById("totalcomment").innerHTML="댓글보기";
				$('#tableDisplay<%=i%>').hide();
			}
		<% } %>
	}
</script>







   
   
   
   
   
   
</body>

</html>