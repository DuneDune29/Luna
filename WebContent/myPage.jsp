<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.Customer_bean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Customer_bean myInfo = (Customer_bean) request.getAttribute("myInfo");
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<jsp:include page="header.jsp" />
<title>Insert title here</title>
</head>
<body>
	<br>
	<br>
	<div class="container-fluid">
		<div class="row">
			<div class="d-flex flex-column flex-shrink-0 p-3 bg-light"
				style="width: 280px;">
				<br> <br> <a href="/"
					class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
					<svg class="bi me-2" width="40" height="32">
						<use xlink:href="#bootstrap"></use></svg> <span class="fs-4">회원정보</span>
				</a>
				<hr>
				<ul class="nav nav-pills flex-column mb-auto">
					<li class="nav-item"><a href="#" class="nav-link active"
						aria-current="page"> <svg class="bi me-2" width="16"
								height="16">
								<use xlink:href="#home"></use></svg> 내 정보
					</a></li>
					<li><a href="#" class="nav-link link-dark"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href="#speedometer2"></use></svg> 찜
					</a></li>
					<li><a href="#" class="nav-link link-dark"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href="#table"></use></svg> 최근 본 내역
					</a></li>
				</ul>
				<hr>
				<a href="/"
					class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
					<svg class="bi me-2" width="40" height="32">
						<use xlink:href="#bootstrap"></use></svg> <span class="fs-4">내 참여</span>
				</a>
				<hr>
				<ul class="nav nav-pills flex-column mb-auto">
					<a href="#" class="nav-link link-dark"> <svg class="bi me-2"
							width="16" height="16">
							<use xlink:href="#speedometer2"></use></svg> 진행중인 나눔
					</a>
					</li>
					<li><a href="#" class="nav-link link-dark"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href="#table"></use></svg> 끝난 나눔
					</a></li>
				</ul>
				<hr>
				<a href="myClassList.do"
					class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
					<svg class="bi me-2" width="40" height="32">
						<use xlink:href="#bootstrap"></use></svg> <span class="fs-4">재능
						나눔</span>
				</a>
				<hr>

			</div>

			<main class="col-md-6 ms-sm-auto col-lg-8 px-md-4"> <br>
			<br>
			<br>
			<h4>내 정보</h4>
			<hr>
			<br>
			<div class="container">

				<div class="row">
					<div class="col-2 ">사진</div>
					<div class="col-8"></div>
					<div class="col-2 ">
						<button type="button" class="btn btn-info" data-toggle="collapse"
							data-target="#사진변경">사진변경</button>
					</div>
					<div id="사진변경" class="collapse"></div>
				</div>
				<hr>
				<div class="row">
					<div class="col-2 ">아이디</div>
					<div class="col-8"><%=myInfo.getCUS_ID()%></div>
					<div class="col-2 "></div>
				</div>
				<hr>
				<div class="row">
					<div class="col-2 ">비밀번호</div>
					<div class="col-8"></div>
					<div class="col-2 ">
						<button type="button" class="btn btn-info" data-toggle="collapse"
							data-target="#비밀번호변경">비밀번호변경</button>
					</div>
					<div id="비밀번호변경" class="collapse">
						<form action="passUpdate.do" method="post">
							<div class="row">
								<div class="col-2 "></div>
								<div class="col-2">현재 비밀번호</div>
								<div class="col-8 ">
									<input type="password" name="curPass" required placeholder="현재 비밀번호">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-2 "></div>
								<div class="col-2">신규 비밀번호</div>
								<div class="col-8 ">
									<input type="password" name="newPass" required placeholder="신규 비밀번호">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-2 "></div>
								<div class="col-2">신규 비밀번호 확인</div>
								<div class="col-6 ">
									<input type="password" name="newPassC" required placeholder="신규 비밀번호 확인">
								</div>
								<div class="col-2 ">
									<button type="submit" class="btn btn-info">확인</button>
									<button type="reset" class="btn btn-info"
										data-toggle="collapse" data-target="#비밀번호변경">취소</button>
								</div>
							</div>



						</form>
					</div>
				</div>
				<hr>



				<div class="row">
					<div class="col-2 ">이름</div>
					<div class="col-8"><%=myInfo.getCUS_NAME()%></div>
					<div class="col-2 ">
						<button type="button" class="btn btn-info" data-toggle="collapse"
							data-target="#이름변경">이름변경</button>
					</div>
					<div id="이름변경" class="collapse">
						<form action="nameUpdate.do" method="post">
							<br>
							<div class="row">
								<div class="col-2 "></div>
								<div class="col-2">이름</div>
								<div class="col-6 ">
									<input type="text" name="name" placeholder="이름">
								</div>
								<div class="col-2 ">
									<button type="submit" class="btn btn-info">확인</button>
									<button type="reset" class="btn btn-info"
										data-toggle="collapse" data-target="#이름변경">취소</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-2 ">주소</div>
					<div class="col-8"><%=myInfo.getCUS_ADDR()%></div>
					<div class="col-2 ">
						<button type="button" class="btn btn-info" data-toggle="collapse"
							data-target="#주소변경">주소변경</button>
					</div>
					<div id="주소변경" class="collapse">
						<form action="addrUpdate.do" method="post">
							<br>
							<div class="row">
							<div class="col-2"></div>
								<div class="col-8">
									<input type="text" id="sample4_postcode" placeholder="우편번호" name="addr5">
									<input type="button" onclick="sample4_execDaumPostcode()"
										value="우편번호 찾기"><br> <input type="text"
										id="sample4_roadAddress" placeholder="도로명주소" name="addr1"> <input
										type="text" id="sample4_jibunAddress" placeholder="지번주소" name="addr2">
									<span id="guide" style="color: #999; display: none"></span> <br><input
										type="text" id="sample4_detailAddress" placeholder="상세주소" name="addr4">
									<input type="text" id="sample4_extraAddress" placeholder="참고항목" name="addr3">

									<script
										src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
									<script>
										function sample4_execDaumPostcode() {
											new daum.Postcode(
													{
														oncomplete : function(
																data) {
															var roadAddr = data.roadAddress;
															var extraRoadAddr = '';
															if (data.bname !== ''
																	&& /[동|로|가]$/g
																			.test(data.bname)) {
																extraRoadAddr += data.bname;
															}

															if (data.buildingName !== ''
																	&& data.apartment === 'Y') {
																extraRoadAddr += (extraRoadAddr !== '' ? ', '
																		+ data.buildingName
																		: data.buildingName);
															}

															if (extraRoadAddr !== '') {
																extraRoadAddr = ' ('
																		+ extraRoadAddr
																		+ ')';
															}

															document
																	.getElementById('sample4_postcode').value = data.zonecode;
															document
																	.getElementById("sample4_roadAddress").value = roadAddr;
															document
																	.getElementById("sample4_jibunAddress").value = data.jibunAddress;

															if (roadAddr !== '') {
																document
																		.getElementById("sample4_extraAddress").value = extraRoadAddr;
															} else {
																document
																		.getElementById("sample4_extraAddress").value = '';
															}

															var guideTextBox = document
																	.getElementById("guide");

															if (data.autoRoadAddress) {
																var expRoadAddr = data.autoRoadAddress
																		+ extraRoadAddr;
																guideTextBox.innerHTML = '(예상 도로명 주소 : '
																		+ expRoadAddr
																		+ ')';
																guideTextBox.style.display = 'block';

															} else if (data.autoJibunAddress) {
																var expJibunAddr = data.autoJibunAddress;
																guideTextBox.innerHTML = '(예상 지번 주소 : '
																		+ expJibunAddr
																		+ ')';
																guideTextBox.style.display = 'block';
															} else {
																guideTextBox.innerHTML = '';
																guideTextBox.style.display = 'none';
															}
														}
													}).open();
										}
									</script>
								</div>
								<div class="col-2"><br><br><button type="submit" class="btn btn-info">확인</button>
									<button type="reset" class="btn btn-info"
										data-toggle="collapse" data-target="#주소변경">취소</button></div>
							</div>
						</form>
					</div>

				</div>
				<hr>
				<div class="row">
					<div class="col-2 ">전화번호</div>
					<div class="col-8"><%=myInfo.getCUS_TEL()%></div>
					<div class="col-2 ">
						<button type="button" class="btn btn-info" data-toggle="collapse"
							data-target="#전화번호변경">전화번호변경</button>
					</div>
					<div id="전화번호변경" class="collapse">
						<form action="telUpdate.do" method="post">
							<br>
							<div class="row">
								<div class="col-2 "></div>
								<div class="col-2">전화번호</div>
								<div class="col-6 ">
									<input type="text" name="tel" placeholder="전화번호">
								</div>
								<div class="col-2 ">
									<button type="submit" class="btn btn-info">확인</button>
									<button type="reset" class="btn btn-info"
										data-toggle="collapse" data-target="#전화번호변경">취소</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<hr>



			</div>
			</main>
			<main class="col-md-3 ms-sm-auto col-lg-2 px-md-4"></main>
		</div>


	</div>


	<jsp:include page="footer.jsp" />
</body>
</html>