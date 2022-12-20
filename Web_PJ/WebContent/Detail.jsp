<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/detail.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
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
	<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	/* out.println(idx); */

	try {
		Class.forName("com.mysql.jdbc.Driver"); //드라이버작성
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/SERVERPJ", "root", "dkfkgks4524");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT  * from festival INNER JOIN organization ON  festival.f_area = organization.f_area  WHERE festival.f_info=" + idx);

		while (rs.next()) {
			String Fname = rs.getString("f_name"); //축제명
			String type = rs.getString("f_type"); //축제유형 
			String date = rs.getString("f_date"); //축제일정
			String position = rs.getString("f_position"); //축제장소
			/* String way = rs.getString("f_way"); // 대면 */
			String image = rs.getString("f_image"); // 축제 이미지

			String g_name = rs.getString("o_name");//축제관리단체
			String g_type = rs.getString("o_type");//축제관리단체 유형
			String g_people = rs.getString("o_people");//축제관리자
			String g_phone = rs.getString("o_phone");//축제관리자 전화번호
			
			if(g_name.equals(" ")) {
				g_name = "미정";
			}
			
			if(g_type.equals(" ")) {
				g_type = "미정";
			}
			
			if(g_people.equals(" ")) {
				g_people = "미정";
			}
			
			if(g_phone.equals(" ")) {
				g_phone = "미정";
			}
			
	
	%>
	<section id="View">
		<div class="main_text">
			<h1><%=Fname%></h1>
			<div class="s_about">
				<h4>축제유형: <%= type %></h4>
				<h4>축제기간: <%= date %></h4>
				<h4>축제장소: <%= position %></h4>
			</div>
			<div class="s_about s_about2">
				<h4>관리단체: <%= type %></h4>
				<h4>관리재단: <%= date %></h4>
				<h4>관리자이름: <%= position %></h4>
				<h4>관리자전화번호: <%= position %></h4>
			</div>
		</div>
		<div class="main_image">
			<img alt="img" src="./img/<%=image%>">
		</div>
	</section>
	<%
	}

	} catch (SQLException e) {
	e.printStackTrace();
	}
	%>

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

	<script src="https://kit.fontawesome.com/86a4884466.js"
		crossorigin="anonymous"></script>
</body>
</html>