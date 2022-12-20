<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="utf-8">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>축제페이지</title>
<link rel="stylesheet" href="./css/feastival.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">

</head>

<body>
	<input type="checkbox" class="input" name="munu" id="munu">

	<input type="radio" class="input" name="sbtn" id="sbtn1" checked>
	<input type="radio" class="input" name="sbtn" id="sbtn2">
	<input type="radio" class="input" name="sbtn" id="sbtn3">
	<input type="radio" class="input" name="sbtn" id="sbtn4">
	<input type="radio" class="input" name="sbtn" id="sbtn5">
	<input type="radio" class="input" name="sbtn" id="sbtn6">
	<input type="radio" class="input" name="sbtn" id="sbtn7">
	<input type="radio" class="input" name="sbtn" id="sbtn8">
	<input type="radio" class="input" name="sbtn" id="sbtn9">

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

	<section id="View">
		<div class="container">
			<div class="maps">
				<img src="./img/kr-02.jpg" alt="img">
			</div>
			<div class="menu_box">
				<label for="munu"> <i class="fa-solid fa-bars"></i>
				</label>
			</div>
			<div class="menu">
				<ul>
					<li><label for="sbtn1">경기도</label></li>
					<li><label for="sbtn2">강원도</label></li>
					<li><label for="sbtn3">충남</label></li>
					<li><label for="sbtn4">충북</label></li>
					<li><label for="sbtn5">경남</label></li>
					<li><label for="sbtn6">경북</label></li>
					<li><label for="sbtn7">전남</label></li>
					<li><label for="sbtn8">전북</label></li>
					<li><label for="sbtn9">제주도</label></li>
				</ul>
			</div>
			<div class="detail_box Gyeonggi">
				<button class="sbtn">경기도</button>
			</div>
			<div class="detail_box Gangwon_do">
				<button class="sbtn">강원도</button>
			</div>
			<div class="detail_box Chungnam">
				<button class="sbtn">충남</button>
			</div>
			<div class="detail_box Chungbuk">
				<button class="sbtn">충북</button>
			</div>
			<div class="detail_box Gyeongnam">
				<button class="sbtn">경남</button>
			</div>
			<div class="detail_box Gyeongbuk">
				<button class="sbtn">경북</button>
			</div>
			<div class="detail_box Jeonnam">
				<button class="sbtn">전남</button>
			</div>
			<div class="detail_box Jeonbuk">
				<button class="sbtn">전북</button>
			</div>
			<div class="detail_box Jeju">
				<button class="sbtn">제주</button>
			</div>
		</div>
	</section>

	<section id="ShowBox">
		<div class="container">
			<div class="rollback_btn">
				<i class=" arrow fa-solid fa-arrow-left"></i>
			</div>
			<div class="animateBox">
				<div class="list"></div>
				<div class="Circle"></div>
			</div>
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

	<script src="https://kit.fontawesome.com/86a4884466.js"
		crossorigin="anonymous"></script>
	<script src="./js/jquery-3.6.1.js"></script>
	<script>

        $(() => {
            $(".sbtn").click(e => {
                const title = $(e.target).text();
                const ImageSrc = title + ".png" ;
                
                console.log(ImageSrc);
                	$.ajax({
                        type: "POST",
                        url: "./process/festivalList.jsp",
                        data: {
                            title:title
                        },
                        success: function (data) {
                        	$(".list").html("");
                        	data.forEach((element, i) => {
                        		const main = document.createElement("a");// a태그
                        		const list_box = document.createElement("div");//item div
                        		const img = document.createElement("img"); // 축제이미지
                        		const textbox = document.createElement("div"); // 축제 설명div
                        		
                        		const title = document.createElement("h3");//축제명
                        		const type = document.createElement("h3"); //축제 type
                        		
                        		console.log(element.idx)
                        		main.setAttribute("href","Detail.jsp?idx="+ element.idx); //a태그 이동 경로
                        		list_box.setAttribute("class","item"); //item div 클래스
                        		img.setAttribute("src", "./img/" + element.img); //축제이미지 경로
                        		textbox.setAttribute("class","item_text"); // 축제 설명 div 클래스
                        		
                        		$(title).text("축제명: " + element.name); // 축제명
                        		$(type).text("축제유형: " + element.type); // 축제명
                        		
                        		textbox.append(title);
                        		textbox.append(type);
                       
                        		list_box.append(img);
                        		list_box.append(textbox);
                        		main.append(list_box);
                        		
                        		console.log(list_box);
                        		
                        		$('.list').append(main);
                        		
                        		$(list_box).delay(i * 200).animate({ opacity : "1" }); 
                        	})
                        },
                        error: function (err) {
                            console.error(err);
                        }
                    });

                $("#ShowBox").css({ opacity: 1, "z-index": 1, "transition": ".4s" });
                $('.Circle').animate({ left: "78%" }, 1000);
                $('.Circle').css({ "background-image": "url(./img/"+ImageSrc+")", "background-size": "80% 80%", "background-position": "center" , "background-repeat": "no-repeat"});
            })


            $(".arrow").click(e => {
                $("#ShowBox").css({ opacity: 0, "z-index": -1, "transition": ".4s" })
                $('.Circle').animate({ left: "130%" }, 1000);
            });

        })

    </script>
</body>

</html>