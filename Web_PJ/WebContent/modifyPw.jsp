<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>FESTIVAL PW Search</title>
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
					<i class="ri-user-2-line"></i>
					<a href="logout"><i class="ri-logout-box-line"></i></a>
					<a href="userdelete"><i class="ri-delete-bin-2-line"></i></a>
				</c:when>
			</c:choose>
		</div>
	</header>

	<section class="body-wrapper">
        <section class="wrapper">
		    <div class="form-wrapper sign-in">
                <form action="modifypw" method="get" onsubmit="return check()">
                	<input type="hidden" name="userID" value="${userID}">
                    <h2>- CHANGE PW -</h2>
                    <div class="input-group">
                        <input type="password" name="userPW" required>
                        <label for="">변경 할 비밀번호</label>
                    </div>
                    <div class="input-group">
                        <input type="password" name="userPW2" required>
                        <label for="">비밀번호 재입력</label>
                    </div>
					<input type="hidden" name="page" value="success">
                    <button type="submit">Change PW</button>
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
<script>
	function check() {
		var form = document.forms[0];
		var userPW = form.userPW.value;
		var userPW2 = form.userPW2.value;
		if (userPW==""||userPW2=="") {
			alert('빈칸이 있습니다');
			return false;
		}else {
			if (!(userPW==userPW2)) {
				alert('비밀번호가 일치하지 않습니다');
				return false;
			} else {
				return true;
			}
		}
		
	}
</script>
</html>