
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
                  <%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="static db.JdbcUtil.*"%>
<!DOCTYPE html>
<html lang="en">
  <head>
  
 
    <title>LunaClass</title>

  </head>
  <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
  
  <div class="site-wrap">


    <jsp:include page="header.jsp"/>
    
    <div class="site-blocks-cover overlay" style="background-image: url(images/hero_1.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row align-items-center justify-content-center text-center">
       

          <div class="col-md-12" data-aos="fade-up" data-aos-delay="400">
                        
            <div class="col-md-12 text-center">
                <h1>당신의 재능기부   <br>
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
            <h2 class="text-black h1 site-section-heading text-center">재능 기부</h2>
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
          <image src="kindness.png" alt="재능기부"></image>
          <div style="font-size : 25px;" "font-weight : bold;">당신의 재능을 기부해주세요.
          </div><br/>
          당신의 재능을 세상에 펼칠 수 있는 기회.<br/>
          언제나 기다리겠습니다.<br/>
   		  </div><br/>
          <button class="btn btn-primary text-white" type="button" id="button-addon2" style= "font-size : 20px;">재능기부하기</button>
		</div>
        
        <div class="col-md-5 col-lg-5">
        	<div class="slide-one-item home-slider owl-carousel">
            	<div>
                	<div class="testimonial">
              		<blockquote class="mb-5">
               		<p><img src="regist.png" alt="등록" style="width:150px; margin-left: auto; margin-right: auto; display: block;" /><br/>&ldquo;재능을 등록해주세요&rdquo;<br/></p>
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
               		<p><img src="aa.png" alt="신청" style="width:150px; margin-left: auto; margin-right: auto; display: block;" /><br/>&ldquo;고객의 신청서가 도착해요&rdquo;<br/></p>
              		</blockquote>
              		<p>
               		 고객의 신청서가 도착합니다!<br/>
               		 고객이 받고자 하는 재능 기부 수업에 대한 신청서가 도착해요.<br/>
               		</p>
            		</div>
          		</div>
          		
          		<div>
                	<div class="testimonial">
              		<blockquote class="mb-5">
               		<p><img src="contact.png" alt="연락" style="width:150px; margin-left: auto; margin-right: auto; display: block;" /><br/>&ldquo;고객과 연락하세요&rdquo;<br/></p>
              		</blockquote>
              		<p>
               		 재능 기부 참여에 신청한 고객과 연락해주세요!<br/>
               		 전화나 문자, 이메일을 통해 참여 여부 확인을 진행합니다.<br/>
               		</p>
            		</div>
          		</div>
          		
          		<div>
                	<div class="testimonial">
              		<blockquote class="mb-5">
               		<p><img src="knowledge.png" alt="재능기부" style="width:150px; margin-left: auto; margin-right: auto; display: block;" /><br/>&ldquo;재능을 보여주세요&rdquo;<br/></p>
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
            <h2 class="text-black h1 site-section-heading text-center">재능찾기</h2>
            <p class="lead">원하는 재능을 찾아 참여해보세요!</p>
          </div>
        </div>
      </div>
      
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-6 col-lg-4">
            <a href="images/img_1.jpg" class="media-1" data-fancybox="gallery">
              <img src="images/img_1.jpg" alt="Image" class="img-fluid">
              <div class="media-1-content">
                <h2>예술</h2>
                <span class="category">예술 재능 찾기</span>
              </div>
            </a>
          </div>
          <div class="col-md-6 col-lg-4">
            <a href="http://localhost:8090/Luna/index.jsp" class="media-1">
              <img src="images/img_2.jpg" alt="Image" class="img-fluid">
              <div class="media-1-content">
                <h2>문화,생활<h2>
                <span class="category">문화/생활 재능 찾기</span>
              </div>
            </a>
          </div>
          <div class="col-md-6 col-lg-4">
            <a href="images/img_3.jpg" class="media-1" data-fancybox="gallery">
              <img src="images/img_3.jpg" alt="Image" class="img-fluid">
              <div class="media-1-content">
                <h2>건강, 미용</h2>
                <span class="category">건강/미용 재능 찾기</span>
              </div>
            </a>
          </div>

          <div class="col-md-6 col-lg-4">
            <a href="images/img_4.jpg" class="media-1" data-fancybox="gallery">
              <img src="images/img_4.jpg" alt="Image" class="img-fluid">
              <div class="media-1-content">
                <h2>IT/개발</h2>
                <span class="category">IT/개발 재능 찾기</span>
              </div>
            </a>
          </div>
          <div class="col-md-6 col-lg-4">
           <a href="images/img_5.jpg" class="media-1" data-fancybox="gallery">
              <img src="images/img_5.jpg" alt="Image" class="img-fluid">
              <div class="media-1-content">
                <h2>심리</h2>
                <span class="category">심리 재능 찾기</span>
              </div>
            </a>
          </div>
          <div class="col-md-6 col-lg-4">
            <a href="images/img_6.jpg" class="media-1" data-fancybox="gallery">
              <img src="images/img_6.jpg" alt="Image" class="img-fluid">
              <div class="media-1-content">
                <h2>기타</h2>
                <span class="category">기타 재능 찾기</span>
              </div>
            </a>
          </div>

         
        </div>
      </div>
    </section>

   


    <section class="site-section testimonial-wrap">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-8 text-center">
            <h2 class="text-black h1 site-section-heading text-center">참여 후기</h2>
          </div>
        </div>
      </div>
      <div class="slide-one-item home-slider owl-carousel">
          <div>
            <div class="testimonial">
              
              <blockquote class="mb-5">
                <p>&ldquo;&ldquo;
                </p>
              </blockquote>

              <figure class="mb-4 d-flex align-items-center justify-content-center">
                <div><img src="images/person_3.jpg" alt="Image" class="w-50 img-fluid mb-3"></div>
                <p></p>
              </figure>
            </div>
          </div>
          <div>
            <div class="testimonial">

              <blockquote class="mb-5">
                <p>&ldquo;&rdquo;</p>
              </blockquote>
              <figure class="mb-4 d-flex align-items-center justify-content-center">
                <div><img src="images/person_2.jpg" alt="Image" class="w-50 img-fluid mb-3"></div>
                <p></p>
              </figure>
              
            </div>
          </div>

          <div>
            <div class="testimonial">

              <blockquote class="mb-5">
                <p>&ldquo;&rdquo;</p>
              </blockquote>
              <figure class="mb-4 d-flex align-items-center justify-content-center">
                <div><img src="images/person_4.jpg" alt="Image" width="20px"></div>
                <p></p>
              </figure>

              
            </div>
          </div>

          <div>
            <div class="testimonial">

              <blockquote class="mb-5">
                <p>&ldquo;&rdquo;</p>
              </blockquote>
              <figure class="mb-4 d-flex align-items-center justify-content-center">
                <div><img src="images/person_5.jpg" alt="Image" class="w-50 img-fluid mb-3"></div>
                <p></p>
              </figure>

            </div>
          </div>

        </div>
    </section>
    
   <jsp:include page="footer.jsp"/>

  </body>
</html>