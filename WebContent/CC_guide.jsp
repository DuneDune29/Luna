<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="header.jsp" />
<title>LunaClass : 고객센터</title>
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
						<use xlink:href="CC_notice.jsp"></use></svg> <span class="fs-4">고객센터</span>
				</a>
				<hr>
				<ul class="nav nav-pills flex-column mb-auto">
					<li class="nav-item">
					<a href="CC_guide.jsp" class="nav-link active"
						aria-current="page"> <svg class="bi me-2" width="16"
								height="16">
								<use xlink:href="CC_guide.jsp"></use></svg> 이용가이드
					</a></li>
					<li><a href="CC_notice.jsp" class="nav-link link-dark"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href="CC_notice.jsp"></use></svg> 공지사항
					</a></li>
					<li><a href="CC_OftenQnA.jsp" class="nav-link link-dark"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href="CC_OftenQnA.jsp"></use></svg> 자주묻는질문
					</a></li>
					<li><a href="CC_QnA.jsp" class="nav-link link-dark"> <svg
								class="bi me-2" width="16" height="16">
								<use xlink:href="CC_QnA.jsp"></use></svg> 질문하기
					</a></li>
				</ul>
				

			</div>

			<main class="col-md-6 ms-sm-auto col-lg-8 px-md-4"> <br>
			<br>
			<br>
			<h4>게시물 작성</h4>
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
					<div class="col-2 ">비밀번호</div>
					<div class="col-8"></div>
					<div class="col-2 ">
						<button type="button" class="btn btn-info" data-toggle="collapse"
							data-target="#비밀번호변경">비밀번호변경</button>
					</div>
					<div id="비밀번호변경" class="collapse">
						<form action="" method="post">
							<div class="row">
								<div class="col-2 "></div>
								<div class="col-2">현재 비밀번호</div>
								<div class="col-8 ">
									<input type="password" name="password">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-2 "></div>
								<div class="col-2">신규 비밀번호</div>
								<div class="col-8 ">
									<input type="password" name="password">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-2 "></div>
								<div class="col-2">신규 비밀번호 확인</div>
								<div class="col-6 ">
									<input type="password" name="password">
								</div>
								<div class="col-2 "><button type="submit" class="btn btn-info" >확인</button>
								<button type="reset" class="btn btn-info" >취소</button></div>
							</div>
						</form>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-2 ">아이디</div>
					<div class="col-8"></div>
					<div class="col-2 "></div>
				</div>
				<hr>
				<div class="row">
					<div class="col-2 ">이름</div>
					<div class="col-8"></div>
					<div class="col-2 ">
						<button type="button" class="btn btn-info" data-toggle="collapse"
							data-target="#이름변경">이름변경</button>
					</div>
					<div id="이름변경" class="collapse"></div>
				</div>
				<hr>
				<div class="row">
					<div class="col-2 ">이메일</div>
					<div class="col-8"></div>
					<div class="col-2 ">
						<button type="button" class="btn btn-info" data-toggle="collapse"
							data-target="#이메일변경">이메일변경</button>
					</div>
					<div id="이메일변경" class="collapse">Lorem ipsum dolor sit amet,
						consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
						labore et dolore magna aliqua. Ut enim ad minim veniam, quis
						nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
						consequat.</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-2 ">전화번호</div>
					<div class="col-8"></div>
					<div class="col-2 ">
						<button type="button" class="btn btn-info" data-toggle="collapse"
							data-target="#전화번호변경">전화번호변경</button>
					</div>
					<div id="전화번호변경" class="collapse">Lorem ipsum dolor sit amet,
						consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
						labore et dolore magna aliqua. Ut enim ad minim veniam, quis
						nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
						consequat.</div>
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