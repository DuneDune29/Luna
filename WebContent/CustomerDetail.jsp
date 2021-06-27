<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="vo.Customer_bean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%
Customer_bean myInfo = (Customer_bean) request.getAttribute("cusInfo");

int myClass=(Integer)request.getAttribute("myClass");
int partcipateCount= (Integer)request.getAttribute("partcipateCount");
int partcipateEndCount=(Integer)request.getAttribute("partcipateEndCount");

%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<jsp:include page="header2.jsp" />
<title>마이페이지</title>
<script
   src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">

main {
   width: 840px;
   background-color: white;
   padding: 25px;
   border-radius: 10px;
   box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;
}

#profile_image_preview {
   width: 10em;
   height: 10em;
   object-fit: cover;
   object-position: 50% 100%;
}

#profile-group {
   text-align: center;
   margin-bottom: 2em;
}

.item-name {
   font-weight: bold;
}

#change-pwd {
   border: none;
}

#CL_PROFILE_PATH{
    display: none;
}
.btn-info,  .btn-info:focus, .btn-info:visited, .btn-info:active {
   background-color: white !important;
   border:1px solid #32dbc6;
   color: #4d4d4d !important;
}
.btn-info:hover, .btn-subBtn {
   background-color: white;
   border:1px solid #1f7b70;
   color: #4d4d4d;
}
.btn-subBtn {
   background-color: #32dbc6;
   border:1px solid #32dbc6;
}
.btn-subBtn:hover{
   border:1px solid #343A40;
   background-color: #343A40;
   color: white;
}
.btn-light{
   border: 1px solid #c1c1c1;
}

.btn{
   border-radius:0.25rem;
}

#deleteUserBtn{
	color: rgba(0, 0, 0, 0.5) !important;
	border: 1px solid rgba(0, 0, 0, 0.3);
	margin-top: 1em;
}
#deleteUserBtn:hover{
	background-color: white;
   border:1px solid #1f7b70;
   color: #4d4d4d;
}
</style>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
   <br>
   <br>
   <div class="container-fluid">
      <div class="row">
          <div class="d-flex flex-column flex-shrink-0 p-3 bg-light"
				style="width: 280px;">
				<br> <br> <a href="CC_notice.jsp"
					class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
					<svg class="bi me-2" width="40" height="32">
						<use xlink:href="CC_notice.jsp"></use></svg> <span class="fs-4">관리 홈</span>
				</a>
				<hr>
				<ul class="nav nav-pills flex-column mb-auto">
					<li class="nav-item">
					<a href="Customer_List.do" class="nav-link active"
						aria-current="page"> <svg class="bi me-2" width="16"
								height="16">
								<use xlink:href="Customer_List.do"></use></svg> 회원 관리
					</a></li>
					<li><a href="classList.do" class="nav-link link-dark"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href="classList.do"></use></svg> 재능 나눔 게시글 관리
					</a></li>
					<li><a href="" class="nav-link link-dark"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href=""></use></svg> 댓글 관리
					</a></li>
					<li><a href="MagQnAlist.do" class="nav-link link-dark"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href="MagQnAlist.do"></use></svg> QnA 관리
					</a></li>
					<li><a href="MagNoticeList.do" class="nav-link link-dark"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href="MagNoticeList.do"></use></svg> 공지 관리
					</a></li>
					<li><a href="FnQList.do" class="nav-link link-dark"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href="FnQList.do"></use></svg> 자주 묻는 질문 관리
					</a></li>
					<li><a href="" class="nav-link link-dark"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href=""></use></svg> 이용 가이드 관리
					</a></li>
					<li><a href="" class="nav-link link-dark"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href=""></use></svg> 신청 현황 관리
					</a></li>
					
					
					
				</ul>
				<hr>

			</div>
         <main class="col-md-6 col-lg-8 px-md-4 " style="width: 280px;" >
         <br> <br>
            <h4>회원 정보</h4>
            <div class="container">
               <div id="profile-group" class="item-group">
                  <img id="profile_image_preview" class="rounded-circle"
                     src="<% if(myInfo.getCUS_PROFILE_PATH() != null){%><%=request.getContextPath()%>/upload/profile/<%=myInfo.getCUS_PROFILE_PATH()%><%}else{%>class_default.png<%}%>" alt="프로필 사진 추가하기" title="프로필 사진 추가하기" />
                  <div>프로필 사진</div>
                  <div>
                  <form action="profilePicUpdate.do" method="post" enctype="multipart/form-data" >
                     <button type="button" id="changePicBtn" class="btn btn-info btn-toggle switch" data-toggle="collapse"
                        data-target="#change-pic-click">사진변경</button>
                     <div id="change-pic-click" class="row collapse">
                        <div class="d-flex justify-content-center">
                           <button type="button" id="profileSetBtn" class="btn btn-info">사진선택</button>
                           <button type="button" id="profileResetBtn" class="btn btn-info">기본 이미지로 변경</button>
                           <input type="file" id="CL_PROFILE_PATH" class="form-control" name="CL_PROFILE_PATH" accept="image/png, image/jpeg, image/jpg" />
                            <input type="hidden" class="form-control" placeholder="cust_id" name="customer_id" value=<%=myInfo.getCUS_ID() %> />
                        </div>
                        <div class="d-flex justify-content-center">
                           <button type="submit" class="btn btn-subBtn">확인</button>
                           <button type="reset" class="btn btn-light btnReset" data-toggle="collapse" data-target="#change-pic-click">취소</button>
                        </div>
                     </div>
                     </form>
                  </div>
               </div>
               <hr>
               <div class="item-group row">
                  <div class="item-name col-md-2">아이디</div>
                  <div class="col-md-7"><%=myInfo.getCUS_ID()%></div>
               </div>
               <hr />
               <div class="item-group row">
                  <div class="item-name col-md-2">비밀번호</div>
                  <div class="col-md-7">
                     <div><%=myInfo.getCUS_PWD()%></div>
                     <div id="change-pwd-click" class="collapse">
                        <form action="passUpdate.do" method="post">
                           <div class="row">
                           </div>
                           <div class="row">
                              <div class="col-md-5">신규 비밀번호</div>
                              <div class="col-md-7">
                              <!-- 신규비밀번호 수정 -->
                                 <input type="password" name="newPass" required
                                    placeholder="신규 비밀번호">
                                    <input type="hidden" class="form-control" placeholder="cust_id" name="customer_id" value=<%=myInfo.getCUS_ID() %> />
                              </div>
                           </div>
                           <div>
                              <div class="row">
                                 <div class="col-md-5">신규 비밀번호 확인</div>
                                 <div class="col-md-7">
                                 <!-- 신규비밀번호 수정 -->
                                    <input type="password" name="newPassC" required
                                       placeholder="신규 비밀번호 확인">
                                       
                                 </div>
                              </div>
                              <div>
                                 <button type="submit" class="btn btn-subBtn">확인</button>
                                 <button type="reset" class="btn btn-light btnReset"
                                    data-toggle="collapse" data-target="#change-pwd-click">취소</button>
                              </div>
                           </div>
                        </form>
                     </div>
                  </div>
                  <div class="col-md-3">
                     <button type="button" id="pwd-btn"
                        class="btn btn-info float-right btn-toggle switch" data-toggle="collapse"
                        data-target="#change-pwd-click">비밀번호변경</button>
                  </div>
               </div>
               <hr />
               <div class="item-group row">
                  <div class="item-name col-md-2">이름</div>
                  <div class="col-md-7">
                     <div><%=myInfo.getCUS_NAME()%></div>
                     <div id="change-name" class="collapse">
                        <form action="nameUpdate.do" method="post">
                           <div>
                              <input type="text" name="name" placeholder="이름">
                              <input type="hidden" class="form-control" placeholder="cust_id" name="customer_id" value=<%=myInfo.getCUS_ID() %> />
                              <div>
                                 <button type="submit" class="btn btn-subBtn">확인</button>
                                 <button type="reset" class="btn btn-light btnReset"
                                    data-toggle="collapse" data-target="#change-name">취소</button>
                              </div>
                           </div>
                        </form>
                     </div>
                  </div>
                  <div class="col-md-3">
                     <button type="button" class="btn btn-info float-right btn-toggle switch"
                        data-toggle="collapse" data-target="#change-name">이름변경</button>
                  </div>
               </div>
               <hr />
               <div class="item-group row">
                  <div class="item-name col-md-2">주소</div>
                  <div class="col-md-8">
                     <div><%=myInfo.getCUS_ADDR()%></div>
                     <div id="주소변경" class="collapse">
                        <form action="addrUpdate.do" method="post">
                           <div>
                              <input type="text" id="sample4_postcode" placeholder="우편번호"
                                 name="addr5"> <input type="button"
                                 onclick="DaumPostcode()" value="우편번호 찾기"><br> <input
                                 type="text" id="sample4_roadAddress" placeholder="도로명주소"
                                 name="addr1"> <input type="text"
                                 id="sample4_jibunAddress" placeholder="지번주소" name="addr2">
                              <span id="guide" style="color: #999; display: none"></span> <br>
                              <input type="text" id="sample4_detailAddress"
                                 placeholder="상세주소" name="addr4"> <input type="text"
                                 id="sample4_extraAddress" placeholder="참고항목" name="addr3">
                                 <input type="hidden" class="form-control" placeholder="cust_id" name="customer_id" value=<%=myInfo.getCUS_ID() %> />
                           </div>
                           <div>
                              <button type="submit" class="btn btn-subBtn">확인</button>
                              <button type="reset" class="btn btn-light btnReset"
                                 data-toggle="collapse" data-target="#주소변경">취소</button>
                           </div>
                        </form>
                     </div>
                  </div>
                  <div class="col-md-2">
                     <button type="button" class="btn btn-info float-right btn-toggle switch"
                        data-toggle="collapse" data-target="#주소변경">주소변경</button>
                  </div>
               </div>
               <hr />
               <div class="item-group row">
                  <div class="item-name col-md-2">전화번호</div>
                  <div class="col-md-7">
                     <div><%=myInfo.getCUS_TEL()%></div>
                     <div id="change-tel" class="collapse">
                        <form action="telUpdate.do" method="post">
                           <div>
                              <div>
                                 <input type="tel" id="tel" name="tel"
                                    pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"
                                    placeholder="xxx-xxxx-xxxx" required />
                                    <input type="hidden" class="form-control" placeholder="cust_id" name="customer_id" value=<%=myInfo.getCUS_ID() %> />
                              </div>
                              <div>
                                 <button type="submit" class="btn btn-subBtn">확인</button>
                                 <button type="reset" class="btn btn-light btnReset"
                                    data-toggle="collapse" data-target="#change-tel">취소</button>
                              </div>
                           </div>
                        </form>
                     </div>
                  </div>
                  <div class="col-md-3">
                     <button type="button" class="btn btn-info float-right btn-toggle switch"
                        data-toggle="collapse" data-target="#change-tel">전화번호변경</button>
                  </div>
               </div>
               <hr/>
               
               <div class="item-group row">
                  <div class="item-name col-md-2">등록한 재능 나눔</div>
                  <div class="col-md-1">
                     <div><%=myClass+" 건"%></div>
                  </div>
                     <button  type="button" class="btn btn-info btn-toggle switch col-md-2" onclick="javascript:window.location=''">현재 나눔 중인 재능</button>
                  <div class="col-md-1"></div>
                  <div class="item-name col-md-2">참여한 재능 나눔</div>
                  <div class="col-md-1">
                     <div><%=partcipateCount+partcipateEndCount+" 건"%></div>
                  </div>
                     <button  type="button" class="btn btn-info btn-toggle switch col-md-2" onclick="javascript:window.location=''">현재 참여 중인 재능</button>
               </div>
               <hr/>
               
                
               
              
               
            
               
             
               
               
               
               <div>
                     <button id="deleteUserBtn" type="button" class="btn btn-info float-right" onclick="javascript:window.location='leave.do'">회원탈퇴</button>
               </div>
            </div>
         </main>
      </div>
   </div>
   <jsp:include page="footer.jsp" />
   <script>
   function readURL(input, previewId) {
       if (input.files && input.files[0]) {
           var reader = new FileReader();
           reader.onload = function(e) {
               $(previewId).attr("src", e.target.result);
               $(previewId).hide();
               $(previewId).fadeIn(100);
           }
           reader.readAsDataURL(input.files[0]);
       }
   }

      $(document).ready(function() {
         $('#profileSetBtn').click(function(){$('#CL_PROFILE_PATH').trigger('click');});
         
         $("#CL_PROFILE_PATH").change(function() {
             readURL(this, '#profile_image_preview');
         });  
         $("#profileResetBtn").click(function(){
            document.getElementById("CL_PROFILE_PATH").value="";
            document.getElementById("profile_image_preview").src="class_default.png";
         });
         
         $(".switch").click(function(){
            $(this).css("visibility", "hidden");
         });
         
         $(".btnReset").click(function(){
            $(this).closest(".item-group").find(".switch").css("visibility", "visible");
         });

         $('#tel').keyup(function(e) {
            var ph = this.value.replace(/\D/g, '').substring(0,11);
               // Backspace and Delete keys
               var deleteKey = (e.keyCode == 8 || e.keyCode == 46);
               var len = ph.length;
               if (len == 0) {
                  ph = ph;
               } else if (len < 3) {
                  ph = ph;
               } else if (len == 3) {
                  ph = ph+ (deleteKey ? '': '-');
               } else if (len < 7) {
                  ph = ph.substring(0,3)+ '-'+ ph.substring(3,7);
               } else if (len == 7) {
                  ph = ph.substring(0,3)+ '-'+ ph.substring(3,7)+ (deleteKey ? '': '-');
               } else {
                  ph = ph.substring(0,3)+ '-'+ ph.substring(3,7)+ '-'+ ph.substring(7,11);
               }this.value = ph;
            });
      });

      function DaumPostcode() {
         new daum.Postcode(
               {
                  oncomplete : function(data) {
                     var roadAddr = data.roadAddress;
                     var extraRoadAddr = '';
                     if (data.bname !== ''
                           && /[동|로|가]$/g.test(data.bname)) {
                        extraRoadAddr += data.bname;

                     }

                     if (data.buildingName !== ''
                           && data.apartment === 'Y') {
                        extraRoadAddr += (extraRoadAddr !== '' ? ', '
                              + data.buildingName : data.buildingName);
                     }

                     if (extraRoadAddr !== '') {
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                     }

                     document.getElementById('sample4_postcode').value = data.zonecode;
                     document.getElementById("sample4_roadAddress").value = roadAddr;
                     document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

                     if (roadAddr !== '') {
                        document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                     } else {
                        document.getElementById("sample4_extraAddress").value = '';
                     }

                     var guideTextBox = document.getElementById("guide");

                     if (data.autoRoadAddress) {
                        var expRoadAddr = data.autoRoadAddress
                              + extraRoadAddr;
                        guideTextBox.innerHTML = '(예상 도로명 주소 : '
                              + expRoadAddr + ')';
                        guideTextBox.style.display = 'block';

                     } else if (data.autoJibunAddress) {
                        var expJibunAddr = data.autoJibunAddress;
                        guideTextBox.innerHTML = '(예상 지번 주소 : '
                              + expJibunAddr + ')';
                        guideTextBox.style.display = 'block';
                     } else {
                        guideTextBox.innerHTML = '';
                        guideTextBox.style.display = 'none';
                     }
                  }
               }).open();
      }
   </script>
</body>
</html>