<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<!-- Bootstrap -->

</head>
<style>
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Add a gray background color and some padding to the footer */
footer {
	background-color: #f2f2f2;
	padding: 25px;
}

.carousel-inner img {
	width: 100%; /* Set width to 100% */
	margin: auto;
	min-height: 200px;
}

/* Hide the carousel text when the screen is less than 600 pixels wide */
@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
	}
}
</style>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Logo</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="#">About</a></li>
					<li><a href="#">Projects</a></li>
					<li><a href="#">Contact</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="account.jsp"><span class=""></span> 회원가입</a></li>
					<li><a href="#"><span class="glyphicon glyphicon-log-in"></span>
							Login</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
		</ol>
	</div>
	<div class="container">
		<!-- 좌우측의 공간 확보 -->
		<!-- 헤더 들어가는 부분 -->


		<!--// 헤더 들어가는 부분 -->
		<!-- 모달창 -->
		<div class="modal fade" id="defaultModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h4 class="modal-title">알림</h4>
					</div>
					<div class="modal-body">
						<p class="modal-contents"></p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
		<!--// 모달창 -->
		<hr />
		<!-- 본문 들어가는 부분 -->



		<form action="../ParkController.bo?mode=account.com"
		class="form-horizontal" method="post">
			<div class="form-group">
				<label for="provision" class="col-lg-2 control-label">회원가입약관</label>
				<div class="col-lg-10" id="provision">
					<textarea class="form-control" rows="8" style="resize: none">약관동의
여러분을 환영합니다.
네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다.
                        </textarea>
					<div class="radio">
						<label> <input type="radio" id="provisionYn"
							name="provisionYn" value="Y" autofocus="autofocus" checked>
							동의합니다.
						</label>
					</div>
					<div class="radio">
						<label> <input type="radio" id="provisionYn"
							name="provisionYn" value="N"> 동의하지 않습니다.
						</label>
					</div>
				</div>
			</div>

			<div class="form-group" id="divId">
				<label for="ac_id" class="col-lg-2 control-label">아이디</label>
				<div class="col-lg-10">
					<input type="text" class="form-control onlyAlphabetAndNumber"
						id="ac_id" name="ac_id" placeholder="20자이내의 알파벳, 숫자만 입력 가능합니다." maxlength="20" required>
				</div>
			</div>
			<div class="form-group" id="divPassword">
				<label for="ac_pw" class="col-lg-2 control-label">패스워드</label>
				<div class="col-lg-10">
					<input type="password" class="form-control" id="ac_pw"
						name="ac_pw" placeholder="패스워드" maxlength="30" required>
				</div>
			</div>
			<div class="form-group" id="divPasswordCheck">
				<label for="inputPasswordCheck" class="col-lg-2 control-label">패스워드
					확인</label>
				<div class="col-lg-10">
					<input type="password" class="form-control" id="ac_pwCheck" name="ac_pwCheck"
						 placeholder="패스워드 확인" maxlength="30" required>
				</div>
			</div>
			<div class="form-group" id="divName">
				<label for="inputName" class="col-lg-2 control-label">이름</label>
				<div class="col-lg-10">
					<input type="text" class="form-control onlyHangul" id="ac_name" name="ac_name"
					placeholder="한글만 입력 가능합니다."	maxlength="15" required>
				</div>
			</div>

			<div class="form-group" id="divNickname">
				<label for="inputNickname" class="col-lg-2 control-label">생년월일</label>
				<div class="col-lg-10">
					<input type="text" class="form-control" id="ac_birth" name="ac_birth"
						 placeholder="상년월일" maxlength="15" required>
				</div>
			</div>

			<div class="form-group" id="divEmail">
				<label for="inputEmail" class="col-lg-2 control-label">이메일</label>
				<div class="col-lg-10">
					<input type="email" class="form-control" id="ac_email" name="ac_email"
					 placeholder="이메일" maxlength="40" required>
				</div>
			</div>
			<div class="form-group" id="divPhoneNumber">
				<label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰
					번호</label>
				<div class="col-lg-10">
					<input type="tel" class="form-control onlyNumber" id="ac_phone" name="ac_phone"
						placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11" required>
				</div>
			</div>
			<div class="form-group">
				<label for="inputGender" class="col-lg-2 control-label">성별</label>
				<div class="col-lg-10">
					<select class="form-control" id="ac_gender" name="ac_gender">
						<option value="M">남</option>
						<option value="F">여</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="inputEmailReceiveYn" class="col-lg-2 control-label">이메일
					수신여부</label>
				<div class="col-lg-10">
					<label class="radio-inline"> <input type="radio"
						id="emailReceiveYn" name="emailReceiveYn" value="Y" checked>
						동의합니다.
					</label> <label class="radio-inline"> <input type="radio"
						id="emailReceiveYn" name="emailReceiveYn" value="N"> 동의하지
						않습니다.
					</label>
				</div>
			</div>
			<div class="form-group">
				<label for="inputPhoneNumber" class="col-lg-2 control-label">SMS
					수신여부</label>
				<div class="col-lg-10">
					<label class="radio-inline"> <input type="radio"
						id="smsReceiveYn" name="smsReceiveYn" value="Y" checked>
						동의합니다.
					</label> <label class="radio-inline"> <input type="radio"
						id="smsReceiveYn" name="smsReceiveYn" value="N"> 동의하지
						않습니다.
					</label>
				</div>
			</div>
			<div class="form-group">
				<div class="col-lg-offset-2 col-lg-10">
					<button type="submit" class="btn btn-primary">가입하기</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>