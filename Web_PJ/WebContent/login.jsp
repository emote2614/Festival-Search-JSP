<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>FESTIVAL Login</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/login.css">
<link
	href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">
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
				<form>
					<h2>- Sign In -</h2>
					<div class="input-group">
						<input type="text" name="userID" required> <label for="">I
							D</label>
					</div>
					<div class="input-group">
						<input type="password" name="userPW" required> <label
							for="">Password</label>
					</div>
					<div class="remember">
						<label><input type="checkbox"> Remember me</label>
					</div>
					<button type="button" class="login_btn">Sign In</button>
					<div class="signUp-link">
						<p>
							아이디를 잊어버리셨나요? <a href="idsearch" class="signUpBtn-link"> 아이디
								찾기</a>
						</p>
						<p>
							비밀번호를 잊어버리셨나요? <a href="modifypw?page=noncheck"
								class="signUpBtn-link"> 비밀번호 찾기</a>
						</p>
					</div>
					<div class="social-platform">
						<p>Or sign in with</p>
						<div class="social-icons">
							<a href="#"><i class="ri-facebook-box-fill"></i></a> <a href="#"><i
								class="ri-google-fill"></i></a> <a href="#"><i
								class="ri-twitter-fill"></i></a>
						</div>
					</div>
				</form>
			</div>
		</section>
	</section>


	<section class="contact">
		<div class="main-contact">
			<div class="contact-content">
				<h5>Contact</h5>
				<li><strong>Address :</strong> 인천 미추홀구 인하로 100, Inha Technical
					College</li>
				<li><strong>Phone :</strong> 032-870-2114</li>
				<li><strong>Email :</strong> abcd1234@gmail.com</li>
			</div>

			<div class="contact-content">
				<h5>Team Member</h5>
				<li>201945008 컴시A 최범석</li>
				<li>201945008 컴시A 최범석</li>
				<li>201945008 컴시A 최범석</li>
				<li>201945008 컴시A 최범석</li>
			</div>

		</div>
	</section>

	<div class="end-text">
		<p>Copyright(c) INHA Technical College. 서버구축 2-A반 3조.</p>
	</div>

	<script src="./js/jquery-3.6.1.js"></script>
	<script src="./CryptoJS/rollups/aes.js"></script>
	<script src="./CryptoJS/components/enc-utf16-min.js"></script>
	<script src="./js/app.js"></script>
	<script type="text/javascript">
	
			const login_btn = document.getElementsByClassName("login_btn");
			
			$(login_btn).click(e => {
				encrypt();
			})
			
			var aes128SecretKey = "0123456789abcdef"; // key 값 16 바이트
		    var aes128Iv = "0123456789abcdef"; //iv 16 바이트
		    var aes128EncodeData = "";
		    var aes128DecodeData = "";
	
			
	
			function encrypt() { // 입력한 아이디 & 비밀번호 암호화
				let plain_id = document.getElementsByName("userID");
				let plain_pw = document.getElementsByName("userPW");
				
				let new_id = aes128Encode(aes128SecretKey, "", plain_id[0].value);
			    let new_pw = aes128Encode(aes128SecretKey, "", plain_pw[0].value);
				
			    console.log(new_id);
			    console.log(new_pw);
			    console.log("key: " + aes128SecretKey);
			    console.log("IV: " + aes128Iv);
			    
				$.ajax({
					type: "post",
					url: "/login",
					data: {
						key: aes128SecretKey,
						encryID:new_id,
						encryPW:new_pw
					},
					success: function (res) {
						console.log(res);
						location.href = "/";
					},
					error: function(err) {
						console.error(err);
					}
				}); 
			}
			
			function aes128Encode(secretKey, Iv, data) { // 암호화
		        // [aes 인코딩 수행 실시 : cbc 모드]
		        const cipher = CryptoJS.AES.encrypt(data, CryptoJS.enc.Utf8.parse(secretKey), {
		            iv: CryptoJS.enc.Utf8.parse(Iv), // [Enter IV (Optional) 지정 방식]
		            padding: CryptoJS.pad.Pkcs7,
		            mode: CryptoJS.mode.CBC // [cbc 모드 선택]
		        });

		        // [인코딩 된 데이터 확인 실시]
		        aes128EncodeData = cipher.toString();
		        // console.log("암호화 데이터" + aes128EncodeData);

		        return aes128EncodeData;
		    };
	</script>
</body>
</html>