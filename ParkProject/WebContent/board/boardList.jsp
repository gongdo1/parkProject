<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 전체 보기 페이지</title>
<link href="css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body>
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
		<h1>게시글 전체 보기 페이지</h1>


		<table class=".table-bordered" width="100%">
			<thead>
				<tr>
					<th>글번호</th>
					<th>제 목</th>
					<th>글쓴이</th>
					<th>작성일</th>
					<th>조회수</th>
					<th>추천수</th>
					<th>bref</th>
					<th>bstep</th>
					<th>breforder</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.boards }" var="board">
					<tr>
						<td>${board.board_no }</td>
						<c:choose>
							<c:when test="${board.board_a_no != 0 }">
							<!-- 댓글일 경우 -->
								<td>
									<c:forEach var="i" begin="0" end="${board.board_a_no * 2}">
										&nbsp; 
									</c:forEach>
								<img src="uploads/reply.png" /><a
									href="boardController.bo?command=boardView.bo&bno=${board.board_no }">${board.board_title }</a></td>
							</c:when>
							<c:otherwise>
								<td><a
									href="boardController.bo?command=boardView.bo&bno=${board.board_no }">${board.board_title }</a></td>
							</c:otherwise>
						</c:choose>
						<td>${board.ac_id }</td>
						<td>${board.board_write_date }</td>
						<td>${board.board_hits }</td>
		
						
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<button class="btn btn-primary"
			onclick="location.href='board/boardWrite.jsp';">글 작성</button>
		
		<form action="boardController.bo" method="post" onsubmit="return checkSearchBoard();">
			<div>
				<select name="queryType">
					<option value="bwriter">작성자</option>
					<option value="btitle">제목</option>
					<option value="bcontent">내용</option>
				</select> <input id="searchWord" type="text" name="query" />
				<input type="hidden" name="command" value="searchboard.bo" />
				<button type="submit">검색</button>
				</div>
		</form>
		
		<!-- <script>
			function checkSearchBoard() {
				// <input type="text" name="query" />에 검색되는 문자열 중에서 SQL injection에 해당하는 단어가 있으면, submit 되지 않도록 함
				var searchWord = $("#searchWord").val();
				
				var injectArr = new Array(
					"OR", "SELECT", "INSERT", "UPDATE", "DELETE", "DROP", "CREATE", "EXEC", "UNION", "FETCH", "TRUNCATE"		
				); // sql 문 keyword
				
				var regWord; // 정규식
				for(var i = 0; i < injectArr.length; i++) {
					regWord = new RegExp(injectArr[i], "gi"); // 정규표현식 객체
					
					if(regWord.test(searchWord)) { // 검색어가 정규표현식 객체 배열 안의 문자열 패턴과 일치 하는지 검사  
						alert('검색어가 잘못 되었습니다!');
						$("#searchWord").val("");
						return false;
					}
				}
				return true;
			}
		</script> -->
		
	</div>

</body>
</html>