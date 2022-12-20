<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="css/board.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
	
	<title>게시글 작성</title>
</head>
<body>
		
<%@ include file='board_write_backend.jsp' %>
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
	
       
<div class="board_wrap">
   <form action="WriteBackend.jsp" method="post" enctype="multipart/form-data">      
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="info">
                    <dl>
                        <dt>작성자</dt>
                        <dd><input type="text" value="<%=sId %>" readonly></dd>
                    </dl>
                    
                </div>
                <div class="cont">
                    <textarea placeholder="내용을 입력세요" name="_content"></textarea>
                </div>
            </div>

	<section class = "place1">		
		<h3>다녀온 지역 선택하기</h3>
				<input type = "Radio" name = "place" id = "_경기" value="경기">
				<rable for name = "_경기">경기</rable>
				<input type = "Radio" name = "place" id = "_강원" value="강원">
				<rable for name = "_강원">강원</rable>
				<input type = "Radio" name = "place" id = "_충남" value="충남">
				<rable for name = "_충남">충남</rable>
				<input type = "Radio" name = "place" id = "_충북" value="충북">
				<rable for name = "_충북">충북</rable>
				<input type = "Radio" name = "place" id = "_전북" value="전북">
				<rable for name = "_전북">전북</rable><br>
				<input type = "Radio" name = "place" id = "_전남" value="전남">
				<rable for name = "_전남">전남</rable>
				<input type = "Radio" name = "place" id = "_경북" value="경북">
				<rable for name = "_경북">경북</rable>
				<input type = "Radio" name = "place" id = "_경남" value="경남">
				<rable for name = "_경남">경남</rable>
				<input type = "Radio" name = "place" id = "_제주" value="제주">
				<rable for name = "_제주">제주</rable>
			    <div>
            	<input type="file" name="_file" multiple accept=".jpg, .jpeg, .png"><p>
                </div>
	</section>

	<section>
	
	            <div>
	                <input type="submit" class="button3" value="등록하기">
	                <a href="board.jsp" class = "button4">취소하기</a>
	            </div>

	        </div>
	        </form>	        
</div>
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