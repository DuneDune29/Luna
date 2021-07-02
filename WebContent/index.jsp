
<%@page import="vo.ClassBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
                  <%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="static db.JdbcUtil.*"%>
<%@ page import="vo.Notice_bean"%>
<%@ page import="vo.ClassBean"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
  <head>
 <% 
ArrayList<Notice_bean> noticeList = (ArrayList<Notice_bean>)request.getAttribute("noticeList"); 
ArrayList<ClassBean> classList = (ArrayList<ClassBean>)request.getAttribute("classList"); 
int classN =(Integer) request.getAttribute("classN");
int customerN =(Integer) request.getAttribute("customerN");
int classINGN =(Integer) request.getAttribute("classINGN");
 %>
    <title>LunaClass</title>

  </head>
  <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
  
  <div class="site-wrap">


    <jsp:include page="header.jsp"/>
     <% 
   		  
   		String path="myClassList.do";
			
			request.getSession().setAttribute("path", path);
			
			
			String path1="index.do";
			
			request.getSession().setAttribute("path1", path1);
   		  
   		   %><!-- header밑에 있어야함 -->
    
    <div class="site-blocks-cover overlay" style="background-image: url(images/hero_1.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row align-items-center justify-content-center text-center">
       

          <div class="col-md-12" data-aos="fade-up" data-aos-delay="400">
                        
            <div class="col-md-12 text-center">
                <h1>당신의 재능나눔   <br>
                  <span class="typed-words" style="font-size: 50px;"></span></h1>
                <p class="lead mb-5">Team <a href="#" target="_blank">Luna</a></p>
                <div><a data-fancybox data-ratio="2" href="video.mp4" class="btn btn-primary btn-md">Watch Video</a></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>  


     <section class="site-section" id="work-section">
      <div class="container">
        <div class="row mb-5 justify-content-center">
          <div class="col-md-8 text-center">
            <h2 class="text-black h1 site-section-heading text-center">재능 나눔</h2>
            <p class="lead">당신의 재능을 나눠보세요</p>
          </div>
        </div>
        </div>
      
      
<div class="container-fluid" style="background-color:#FBFBFB;">
<br/>
<br/>
	<div class="row mb-8 col-md-12 ">
	<div class="col-md-1 "></div>
    	<div class="col-md-5 col-lg-5" style= "text-align:center;">
          <div>
          <image src="images/kindness.png" alt="재능나눔"></image>
          <div style="font-size : 25px;" "font-weight : bold;">당신의 재능을 나눠주세요.
          </div><br/>
          당신의 재능을 세상에 펼칠 수 있는 기회.<br/>
          언제나 기다리겠습니다.<br/>
   		  </div><br/>
          <button class="btn btn-primary text-white" type="button" id="button-addon2" style= "font-size : 20px;" onclick="location.href='myClassList.do'">재능나눔하기</button>
		</div>
        
        <div class="col-md-5 col-lg-5">
        	<div class="slide-one-item home-slider owl-carousel">
            	<div>
                	<div class="testimonial">
              		<blockquote class="mb-5">
               		<p><img src="images/regist.png" alt="등록" style="width:150px; margin-left: auto; margin-right: auto; display: block;" /><br/>&ldquo;재능을 등록해주세요&rdquo;<br/></p>
              		</blockquote>
              		<p>
               		 당신이 가지고 있는 재능을 게시글에 등록해주세요!<br/>
               		 고객들이 당신의 재능을 확인할 수 있습니다.<br/>
               		</p>
            		</div>
          		</div>
          		
          		
          		<div>
                	<div class="testimonial">
              		<blockquote class="mb-5">
               		<p><img src="images/aa.png" alt="신청" style="width:150px; margin-left: auto; margin-right: auto; display: block;" /><br/>&ldquo;고객의 신청서가 도착해요&rdquo;<br/></p>
              		</blockquote>
              		<p>
               		 고객의 신청서가 도착합니다!<br/>
               		 고객이 받고자 하는 재능 나눔 수업에 대한 신청서가 도착해요.<br/>
               		</p>
            		</div>
          		</div>
          		
          		<div>
                	<div class="testimonial">
              		<blockquote class="mb-5">
               		<p><img src="images/contact.png" alt="연락" style="width:150px; margin-left: auto; margin-right: auto; display: block;" /><br/>&ldquo;고객과 연락하세요&rdquo;<br/></p>
              		</blockquote>
              		<p>
               		 재능 나눔 참여에 신청한 고객과 연락해주세요!<br/>
               		 전화나 문자, 이메일을 통해 참여 여부 확인을 진행합니다.<br/>
               		</p>
            		</div>
          		</div>
          		
          		<div>
                	<div class="testimonial">
              		<blockquote class="mb-5">
               		<p><img src="images/knowledge.png" alt="재능나눔" style="width:150px; margin-left: auto; margin-right: auto; display: block;" /><br/>&ldquo;재능을 보여주세요&rdquo;<br/></p>
              		</blockquote>
              		<p>
               		 당신이 가지고 있는 재능을 나눠주세요!<br/>
               		 
               		</p>
            		</div>
          		</div>
          		
          		
          		
          </div>
          </div>
          <div class="col-md-1 "></div>
          
          
         
         
        </div>
      </div>
    </section>
   

    <section class="site-section" id="work-section">
      <div class="container">
        <div class="row mb-5 justify-content-center">
          <div class="col-md-8 text-center">
            <h2 class="text-black h1 site-section-heading text-center">인기 재능 찾기</h2>
            <p class="lead">원하는 재능을 찾아 참여해보세요!</p>
          </div>
        </div>
      </div>
      
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-6 col-lg-4">
            <a href="classDetail.do?CL_ID=<%=classList.get(0).getCL_ID()%>" class="media-1">
              <img src="<%=request.getContextPath()%>/upload/<%= classList.get(0).getCL_IMG_PATH()%>" alt="Image" class="img-fluid">
              <div class="media-1-content">
                <span class="category">예술</span>
                <h2><%=classList.get(0).getCL_NAME() %></h2>
                <span class="category"><%=classList.get(0).getCL_INTRODUCTION() %></span>
              </div>
            </a>
          </div>
          <div class="col-md-6 col-lg-4">
       <a href="classDetail.do?CL_ID=<%=classList.get(1).getCL_ID()%>" class="media-1">
              <img src="<%=request.getContextPath()%>/upload/<%= classList.get(1).getCL_IMG_PATH()%>" alt="Image" class="img-fluid">
              <div class="media-1-content">
                <span class="category">문화, 생활</span>
                <h2><%= classList.get(1).getCL_NAME() %></h2>
                <span class="category"><%=classList.get(1).getCL_INTRODUCTION() %></span>
              </div>
            </a>
          </div>
          <div class="col-md-6 col-lg-4">
       <a href="classDetail.do?CL_ID=<%=classList.get(2).getCL_ID()%>" class="media-1">
              <img src="<%=request.getContextPath()%>/upload/<%= classList.get(2).getCL_IMG_PATH()%>" alt="Image" class="img-fluid">
              <div class="media-1-content">
                <<span class="category">건강, 미용</span>
                <h2><%= classList.get(2).getCL_NAME() %></h2>
                <span class="category"><%=classList.get(2).getCL_INTRODUCTION() %></span>
              </div>
            </a>
          </div>

          <div class="col-md-6 col-lg-4">
       <a href="classDetail.do?CL_ID=<%=classList.get(3).getCL_ID()%>" class="media-1">
              <img src="<%=request.getContextPath()%>/upload/<%= classList.get(3).getCL_IMG_PATH()%>" alt="Image" class="img-fluid">
              <div class="media-1-content">
                <span class="category">IT/개발</span>
                <h2><%= classList.get(3).getCL_NAME() %></h2>
                <span class="category"><%=classList.get(3).getCL_INTRODUCTION() %></span>
              </div>
            </a>
          </div>
          <div class="col-md-6 col-lg-4">
       <a href="classDetail.do?CL_ID=<%=classList.get(4).getCL_ID()%>" class="media-1">
              <img src="<%=request.getContextPath()%>/upload/<%= classList.get(4).getCL_IMG_PATH()%>" alt="Image" class="img-fluid">
              <div class="media-1-content">
                <span class="category">심리</span>
                <h2><%= classList.get(4).getCL_NAME() %></h2>
                <span class="category"><%=classList.get(4).getCL_INTRODUCTION() %></span>
              </div>
            </a>
          </div>
          <div class="col-md-6 col-lg-4">
       <a href="classDetail.do?CL_ID=<%=classList.get(5).getCL_ID()%>" class="media-1">
              <img src="<%=request.getContextPath()%>/upload/<%= classList.get(5).getCL_IMG_PATH()%>" alt="Image" class="img-fluid">
              <div class="media-1-content">
                 <span class="category">기타 </span>
                <h2><%= classList.get(5).getCL_NAME() %></h2>
                <span class="category"><%=classList.get(5).getCL_INTRODUCTION() %></span>
              </div>
            </a>
          </div>

         
        </div>
      </div>
    </section>
<section class="site-section" id="count-section" style="background-color:#FBFBFB;">
					<div class="container">
						<div class="row">
							<div class="col-12" style="text-align:center">
								<h2>LunaClass는 서로서로가 재능을 나누길 바랍니다</h2>
								<p style="margin-top:40px; margin-bottom:40px; color:#909090">많은 사람들이 당신의 재능나눔을 기다리고 있어요. </p>
							</div>
							</div>
							<div class="row" style="text-align:center">
							<div class="col-4">
								<h3 style="font-size:40pt; color:#32DBC6"><%= classN %></h3>
								<p style="font-size:15pt; font-weight:bold" >누적 재능 나눔</p>
							</div>
							<div class="col-4">
								<h3 style="font-size:40pt; color:#32DBC6"><%= customerN %></h3>
								<p style="font-size:15pt; font-weight:bold">등록된 회원</p>
							</div>
							<div class="col-4">
								<h3 style="font-size:40pt; color:#32DBC6"><%= classINGN %></h3>
								<p style="font-size:15pt; font-weight:bold">현재 진행중인 나눔</p>
							</div>
						</div>
					</div>
				</section>

      <section class="site-section testimonial-wrap">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-8 text-center">
            <h2 class="text-black h1 site-section-heading text-center">공지 사항</h2>
          </div>
        </div>
      </div>
      <div class="slide-one-item home-slider owl-carousel">
          
          
         <%   for (int i = 0; i < noticeList.size(); i++) {%>
          
          <div>
            <div class="testimonial">
              
              <blockquote class="mb-5">
            <%= noticeList.get(i).getNOTICE_TITLE()%>
            
              </blockquote>
			<p><%= noticeList.get(i).getNOTICE_CONTENT()%></p>
              <figure class="mb-4 d-flex align-items-center justify-content-center">
                <div>
          
                
                
                </div>
              </figure>
            </div>      
         </div>
         
         <%} %>>
         

        </div>
        
        
        
        
        
    </section>



    
    
   <jsp:include page="footer.jsp"/>
  <script src="js/typed.js"></script>
            <script>
            var typed = new Typed('.typed-words', {
            strings: ["희망을 줍니다. "," 꿈을 이루어줍니다."," 가능성을 열어줍니다."],
            typeSpeed: 80,
            backSpeed: 80,
            backDelay: 2000,
            startDelay: 1000,
            loop: true,
            showCursor: true
            });
            </script>
  </body>
</html>