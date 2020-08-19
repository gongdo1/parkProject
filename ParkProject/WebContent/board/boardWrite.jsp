<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성 페이지</title>
<link href="../css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
</head>
<body>
	<!-- 로그인 한 유저만 글 작성 할 수 있도록.... -->
	<!--<c:if test="${sessionScope.loginMember == null }">
		<script>
			alert('로그인 페이지로 이동합니다~!');
			location.href = '../index.jsp';
		</script>
	</c:if>-->

	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<!-- Brand/logo -->
		<a class="navbar-brand" href="#">Home</a>

		<!-- Links -->
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link"
				href="member/registerMember.jsp">회원가입</a></li>
			<li class="nav-item"><a class="nav-link" href="#">로그인</a></li>
			<li class="nav-item"><a class="nav-link"
				href="admin/adminHome.jsp">관리자페이지</a></li>
			<li class="nav-item"><a class="nav-link"
				href="boardController.bo?command=boardList.bo">게시판</a></li>
		</ul>
	</nav>
	<div class="container">
		<h1>게시글 작성 페이지</h1>
		
		<script>
			function check() {
				var result = true;
				var title = $("#btitle").val();
				if (title.length < 1) {
					alert('제목은 필수 항목입니다!');
					document.getElementById("btitle").focus();
					result = false;
				}
				
				return result;
			}
		</script>

	
		<form action="../ParkController.bo?mode=boardWrite.com" method="post" >
			<select name="mbl_no">
				<option value="1">자유 게시판</option>
				<option value="2">모두의 코딩</option>
			
			</select>	
			<div class="form-group">
				<label for="board_title">제 목 :</label> <input type="text"
					class="form-control" id="board_title" name="board_title"/>
			</div>
			<div class="form-group">
				<label for="ac_id">작성자 :</label> <input type="text"
					class="form-control" id="ac_id" name="ac_id" value="${sessionScope.login.ac_id }" />
			</div>
			<div class="form-group">
				<label for="bpassword">글 수정/삭제 암호 :</label> <input type="password"
					class="form-control" id="bpassword" name="bpassword"  />
			</div>
			<div class="form-group">
				<label for="board_content">내용 :</label> <!--  <input type="text"
					class="form-control" id="bcontent" name="bcontent"  style='height: 100px;'/>-->
				<textarea rows="15" cols="150" name="board_content"></textarea>	
			</div>
			<div class="form-group">
				<label for="board_img">파일 :</label> 
				<input type="file"
					class="form-control" id="board_img" name="board_img" />	
			</div>
			<button type="button" class="btn btn-secondary" onclick="history.back();">취 소</button>
			<input type="submit" class="btn btn-primary">저 장</button>
		</form>
	</div>
</body>
</html>