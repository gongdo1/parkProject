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
<title>Insert title here</title>
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
      min-height:200px;
  }

  /* Hide the carousel text when the screen is less than 600 pixels wide */
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; 
    }
  }
  </style>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
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
      	<li><a href="account/account.jsp"><span class=""></span> 회원가입</a></li>
        <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>

<div id="myCarousel" class="carousel slide" data-ride="carousel">
   <form method="post" id="authForm" action="../ParkController.bo?mode=login.com">
    <input type="hidden" name="redirectUrl" value="">
    <fieldset>
      <legend class="screen_out">로그인 정보 입력폼</legend>
      <div class="box_login">
        <div class="inp_text">
          <label for="loginId" class="screen_out">아이디</label>
          <input type="text" id="ac_id" name="ac_id" placeholder="ID" >
        </div>
        <div class="inp_text">
          <label for="loginPw" class="screen_out">비밀번호</label>
          <input type="password" id="ac_pw" name="ac_pw" placeholder="Password" >
        </div>
      </div>
      <button type="submit" class="btn_login" >로그인</button>
      <div class="login_append">
        <div class="inp_chk"> <!-- 체크시 checked 추가 -->
          <input type="checkbox" id="keepLogin" class="inp_radio"  name="keepLogin">
          <label for="keepLogin" class="lab_g">
<span class="img_top ico_check"></span>
<span class="txt_lab">로그인 상태 유지</span>
  </label>
        </div>
        <span class="txt_find">
           <a href="/member/find/loginId" class="link_find">아이디</a>
            / 
           <a href="/member/find/password" class="link_find">비밀번호 찾기</a>
         </span>
      </div>
      
    </fieldset>
  </form>
</div>
  
<div class="container text-center">    
  
</div><br>

<!--  <footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>-->
</body>
</html>