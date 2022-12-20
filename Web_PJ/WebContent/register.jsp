<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>FESTIVAL Register</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/login.css">
	<link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
 
</head>
<body>

	<header>
		<a href="main" class="logo"><img src="img/logo.png" alt=""></a>

		<ul class="navbar">
			<li><a href="main">Home</a></li>
			<li><a href="about.jsp">About</a></li>
			<li><a href="search">Search</a></li>
			<li><a href="community/board.jsp">Community</a></li>
		</ul>
		
		<div class="icons">
			<c:choose>
				<c:when test = "${sessionScope.user eq null }">
					<a href="login"><i class="ri-login-box-line"></i></a>
					<a href="register"><i class="ri-registered-line"></i></a>
				</c:when>
				<c:when test = "${sessionScope.user ne null }">
					<a><i class="name">${sessionScope.user.getUserName()}</i></a>
					<a href="logout"><i class="ri-logout-box-line"></i></a>
					<a href="userdelete"><i class="ri-delete-bin-2-line"></i></a>
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test = "${sessionScope.user.getUserName() eq 'admin' }">
					<a href="admin"><i class="ri-admin-fill"></i></a>
				</c:when>
				<c:when test = "${sessionScope.user.getUserName() ne 'admin' }">
					<!-- 계정 이름이 admin이 아닐 경우 -->
				</c:when>
			</c:choose>
		</div>
	</header>

	<section class="body-wrapper">
        <section class="wrapper">
		    <div class="form-wrapper sign-in">
                <form action="register" method="post">
                    <h2>- SIGN UP -</h2>
                    <div class="input-group">
                        <input type="text" name="userID" required>
                        <label for="">I D</label>
                    </div>
                    <div class="input-group">
                        <input type="password" name="userPW" required>
                        <label for="">Password</label>
                    </div>
                    <br>
                    <div class="input-group">
                        <input type="text" name="userName" required>
                        <label for="">Name</label>
                    </div>
                    <div class="input-group">
                        <input type="text" name="userPhone" required>
                        <label for="">Phone</label>
                    </div>
                    <div class="input-group">
                        <input type="text" name="userEmail" required>
                        <label for="">Email</label>
                    </div>
                    <button type="submit">Sign Up</button>
                    <div class="signUp-link">
                        <p>이미 계정이 있으신가요? <a href="login" class="signUpBtn-link">로그인</a></p>
                    </div>
                </form>
            </div>
	    </section>
    </section>

	
	<section class="contact">
		<div class="main-contact">
			<div class="contact-content">
				<h5>Contact</h5>
				<li><strong>Address :</strong> 인천 미추홀구 인하로 100, Inha Technical College</li>
				<li><strong>Phone :</strong> 032-870-2114</li>
				<li><strong>Email :</strong> abcd1234@gmail.com</li>
			</div>

			<div class="contact-content">
				<h5>Team Member</h5>
				<li>201945008 컴시A 최범석</li>
				<li>202145024 컴시A 간영훈</li>
				<li>201945014 컴시A 송윤하</li>
				<li>202145032 컴시A 김태성</li>
			</div>

		</div>
	</section>

	<div class="end-text">
		<p>Copyright(c) INHA Technical College. 서버구축 2-A반 3조.</p>
	</div>

</body>
</html>