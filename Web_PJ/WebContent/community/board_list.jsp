<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.connection.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="css/board.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
	<title>게시글</title>
</head>
<body>
<%@ include file='ReviewDetailBackend.jsp' %>
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
		</div>
</header>
	

	
	<div class = "board_view_wrap">
		<div class = "board_view">			
		<div class = "title">
			</div>
			<div class = "info">
				<dl>
					<dt>작성자</dt>
					<dd><%=sId %></dd>
				</dl>
				<dl>
					<dt>작성일</dt>
					<dd><%=sDate %></dd>
				</dl>

		<div class="content">
		<%=sContent %>
		</div>

	<%@ include file='ReviewDetail_ImagesBackend.jsp' %>	 

	<form method="post" action="Commentb.jsp" class = "comment">
		<p>
			<textarea rows="5" cols="147" name="content"></textarea>
		</p>
		<p>
			<input type="hidden" name="_writerId" value="<%= sWriterId%>">
			<input type="hidden" name="_contentNo" value="<%= iContentNo%>">
			<button type="submit" class = "button7">작성하기</button>
			<!--  <button class = "button6"><a href ="board.jsp">목록가기</a></button> -->
			<a href ="board.jsp">목록가기</a>
		</p>
		
	</form>

<%@ include file='ReviewDetail_CommentBackend.jsp' %>		
		
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