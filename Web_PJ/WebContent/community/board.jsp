<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.connection.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="css/board.css">
	<title>게시글</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
	
</head>
<body>

<header>
		<a href="../main" class="logo"><img src="image/logo.png" alt=""></a>
		<ul class="navbar">
			<li><a href="../main">Home</a></li>
			<li><a href="../about.jsp">About</a></li>
			<li><a href="../search">Search</a></li>
			<li><a href="board.jsp">Community</a></li>
		</ul>
		
		<div class="icons">
			<c:choose>
				<c:when test = "${sessionScope.user eq null }">
					<a href="../login"><i class="ri-login-box-line"></i></a>
					<a href="../register"><i class="ri-registered-line"></i></a>
				</c:when>
				<c:when test = "${sessionScope.user ne null }">
					<a><i class="name">${sessionScope.user.getUserName()}</i></a>
					<a href="../logout"><i class="ri-logout-box-line"></i></a>
					<a href="../userdelete"><i class="ri-delete-bin-2-line"></i></a>
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test = "${sessionScope.user.getUserName() eq 'admin' }">
					<a href="../admin"><i class="ri-admin-fill"></i></a>
				</c:when>
				<c:when test = "${sessionScope.user.getUserName() ne 'admin' }">
					<!-- 계정 이름이 admin이 아닐 경우 -->
				</c:when>
			</c:choose>
		</div>
</header>
	
	
		<div id = "container">
			<div id="idx_top">Review<br>다양한 후기를<br>기다립니다.</div>
		</div>


	<section class = "place">
		<div id='result' class = "result"></div>		
		
		<form action="board.jsp" method="post" id="forBk">
		<input type = "Radio" name = "place" id = "_전체" value="전체" onclick="radioClick()">
			<rable for name = "_전체">전체</rable>
			<input type = "Radio" name = "place" id = "_경기" value="경기" onclick="radioClick()">
			<rable for name = "_경기">경기</rable>
			<input type = "Radio" name = "place" id = "_강원" value="강원" onclick="radioClick()"> 
			<rable for name = "_강원">강원</rable>
			<input type = "Radio" name = "place" id = "_충북" value="충북" onclick="radioClick()">
			<rable for name = "_충북">충북</rable>
			<input type = "Radio" name = "place" id = "_충남" value="충남" onclick="radioClick()">
			<rable for name = "_충북">충남</rable>
			<input type = "Radio" name = "place" id = "_전북" value="전북" onclick="radioClick()">
			<rable for name = "_전북">전북</rable>
			<input type = "Radio" name = "place" id = "_전남" value="전남" onclick="radioClick()">
			<rable for name = "_전남">전남</rable>
			<input type = "Radio" name = "place" id = "_경북" value="경북" onclick="radioClick()">
			<rable for name = "_경북">경북</rable>
			<input type = "Radio" name = "place" id = "_경남" value="경남" onclick="radioClick()">
			<rable for name = "_경남">경남</rable>
			<input type = "Radio" name = "place" id = "_제주" value="제주" onclick="radioClick()">
			<rable for name = "_제주">제주</rable>
		</form>
	</section>

	<script type="text/javascript">
		function radioClick(){
		//document.getElementById('result').innerText = event.target.value;
		document.getElementById('forBk').submit();
	}
	</script>

<!-- 
	<script type="text/javascript">
		function radioClick(){
		$("input[name='place']").change.function(){
			var test = $("input[name ='place']:checked").val();
			if(test == "ê²½ê¸°"){
				document.getElementByID("pl") = "ê²½ê¸°ë"
				background.url("image/ê²½ê¸°ë_ë¨íì°ì±.png")
			}
		}
	}
-->


	</script>

	<!--- Board ---->
	<section class = "board">
		<table class="board_list">
			<thead>  
				<tr>
					<th>작성자</th>
					<th>게시글</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
			<%@ include file='ReviewListBackend.jsp' %>
			</tbody>
		</table>
		
	</section>



<section>
	<a href="board_write.jsp" class = "button">후기 작성</a>
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

</body>
</html>