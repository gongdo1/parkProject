<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
<script>
	var isValid = false; // 아이디의 중복 검사 결과
	function check(){
		let result = true;
		console.log(typeof isValid + " : " + isValid);
		let nameJ = /^[가-힣]{2,6}$/;
		let regPhone = /(01[0|1|6|9|7])(\d{3}|\d{4})(\d{4}$)/g;
		let re = /^[a-zA-Z0-9]{6,20}$/;
		
		let ac_id = $('#ac_id').val();
		let ac_pw = $('#ac_pw').val();
		let ac_pw1 = $('#ac_pw1').val();
		let ac_name = $('#ac_name').val();
		let ac_phone = $('#ac_phone').val();
		
		if(!re.test(ac_id)) {
	         $('#errorAc_id').html("아이디는 6~20자의 영문 대소문자와 숫자로만 입력하세요");
	         $('#ac_id').focus();
	           result = false;
	      } else if(!re.test(ac_pw)) {
	         $('#errorAc_pw').html("비밀번호는 6~20자의 영문 대소문자와 숫자로만 입력하세요");
	         $('#ac_pw').focus();
	         result = false;
	      } else if(ac_pw !== ac_pw1) {
	         $('#errorAc_pw').html("비밀번호가 일치하지 않습니다");
	         $('#ac_pw').focus();
	         result = false;
	      }else if(!nameJ.test(ac_name)){
	         $('#errorAc_name').html("이름은 한글로 2~6자로 입력하세요");
	         $('#ac_name').focus();
	           result = false;
	      } else if(!regPhone.test(ac_phone)){
	         $('#errorAc_phone').html('휴대폰번호를 정확히 입력하세요');
	         $('#ac_phone').focus();
	          result = false;   
	      } 
		
		if (idisdup && result) {
			return true;
		} else {
			return false;
		}
		
	}
	
function idisdup() {
		 // 아이디 텍스트박스에 키가 눌려졌을 때
	var ac_id = $('#ac_id').val();
	var result = true;
		 // 6자 이상이 들어왔을 때만 중복 검사
			$.ajax({ // 서블릿에 전송하여 아이디가 중복인지 아닌지 결과를 가져와야 한다. (백 엔드 와의 비동기 통신)
				type : "GET",
				url : "../ParkController.bo?ac_id=" + ac_id,
				dataType : "json", // 서버에서 반환되는 데이터 타입
				success : function(data) {
					console.log(data);
					console.log(data.isValid);		
					let result = "";
					if(data.isValid === "true"){
						result = "아이디 중복"
					}  else {
						result = "사용 가능"
					}
					$('#errorAc_id').html(result);	
				},
				error : function(res) {
					console.log(res.responseText);
					alert("통신실패");
				},
				complete : function() {
					
				}
			}); // ajax 끝
		
		
}

$(document).ready(function() {
	$('#ac_id').keyup(idisdup);
	
});
</script>
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

.error {
	color : red;
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
					<li><a href="#">게시판</a></li>
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
		class="was-validated" method="post" onsubmit="return check();">
			<!-- <div class="form-group">
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
			</div> -->

			<div class="form-group">
				<label for="ac_id" class="col-lg-2 control-label">아이디</label>
				<div class="col-lg-10">
					<input type="text" class="form-control"
						id="ac_id" name="ac_id" placeholder="아이디는 6~20자의 영문 대소문자와 숫자로만 입력하세요" required>
				<div id="errorAc_id" class="error"></div>
				</div>
			</div>
			<div class="form-group">
				<label for="ac_pw" class="col-lg-2 control-label">비밀번호</label> 
				<div class="col-lg-10">
				<input type="password" class="form-control" id="ac_pw" placeholder="비밀번호는 6~20자의 영문 대소문자와 숫자로만 입력하세요"
					name="ac_pw" required>
				 <div id="errorAc_pw" class="error"></div>
				</div>
			</div>
			<div class="form-group" >
				<label for="inputPasswordCheck" class="col-lg-2 control-label">비밀번호
					확인</label>
				<div class="col-lg-10">
					<input type="password" class="form-control" id="ac_pw1" name="ac_pw1"
						 placeholder="패스워드 확인" required>
					<div id="errorAc_pw1" class="error"></div>
				</div>
			</div>
			<div class="form-group">
				<label for="ac_name" class="col-lg-2 control-label">이름</label>
				<div class="col-lg-10">
					<input type="text" class="form-control onlyHangul" id="ac_name" name="ac_name"
					placeholder="한글만 입력 가능합니다."	maxlength="15" required>
				<div id="errorAc_name" class="error"></div>
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
					<div id="errorAc_phone" class="error"></div>
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
			<!-- <div class="form-group">
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
			</div> -->
									
				<button type="submit" class="btn btn-primary">가입하기</button>
				<button type="reset" class="btn btn-danger">취소</button>
			
		</form>
	</div>
</body>
</html>