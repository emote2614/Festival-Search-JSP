<%@page
	import="org.apache.catalina.valves.rewrite.InternalRewriteMap.Escape"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.mysql.cj.jdbc.exceptions.SQLError"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>admin</title>
<link rel="stylesheet" href="./css/admin.css">
<link rel="stylesheet" href="./css/bootstrap.css">
</head>

<body>
	<input type="radio" class="input" name="btn" id="btn1"
		/checked="checked">
	<input type="radio" class="input" name="btn" id="btn2">
	<div class="group">
		<header>
			<h1>
				<a href="index.jsp">Admin</a>
			</h1>
			<ul>
				<li><label for="btn1">축제등록하기</label></li>
				<li><label for="btn2">축제관리하기</label></li>
			</ul>
		</header>
		<div id="AddList">
			<h1>여행 리스트 추가</h1>
			<div class="formbox">
				<%
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/SERVERPJ", "root", "dkfkgks4524");
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery("select * from korea ORDER BY f_area DESC LIMIT 1");

 					while (rs.next()) {
						int idx = rs.getInt(2);
					System.out.println(idx);
						out.println("<input type='hidden' id='idx' name='idx' value='" + idx + "' />");
					}

					stmt.close();
					conn.close(); 
				} catch (SQLException e) {
					e.printStackTrace();
				}
				%>
				<div class="input_box">
					<select name="area" id="area">
						<option value="경기도">경기도</option>
						<option value="강원도">강원도</option>
						<option value="충남">충남</option>
						<option value="충북">충북</option>
						<option value="경남">경남</option>
						<option value="경북">경북</option>
						<option value="전남">전남</option>
						<option value="전북">전북</option>
						<option value="제주도">제주도</option>
					</select>
				</div>
				<div class="input_box">
					<input type="text" name="d_area" id="d_area" placeholder="자치시">
				</div>
				<div class="input_box">
					<input type="text" name="f_name" id="f_name" placeholder="축제이름">
				</div>
				<div class="input_box">
					<input type="text" name="f_type" id="f_type" placeholder="축제유형">
				</div>
				<div class="input_box">
					<input type="text" name="f_date" id="f_date" placeholder="축제기간">
				</div>
				<div class="input_box">
					<input type="text" name="f_position" id="f_position"
						placeholder="축제장소">
				</div>
				<div class="input_box">
					<input type="text" name="o_name" id="o_name" placeholder="관리단체">
				</div>
				<div class="input_box">
					<input type="text" name="o_type" id="o_type" placeholder="관리재단">
				</div>
				<div class="input_box">
					<input type="text" name="o_people" id="o_people"
						placeholder="관리자 이름">
				</div>
				<div class="input_box">
					<input type="text" name="o_phone" id="o_phone"
						placeholder="관리자 전화번호">
				</div>
				<div class="input_box">
					<input type="file" id="f_image"
						name="f_image">
				</div>
				<div class="input_box btn_box">
					<input type="button" value="등록하기" class="submitBtn">
				</div>
			</div>
		</div>
		<div id="ControllBox">
			<h1>여행 리스트</h1>
			<div class="list_box">
				<%
				try {
					Class.forName("com.mysql.jdbc.Driver"); //드라이버작성
					Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/SERVERPJ", "root", "dkfkgks4524");
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery("SELECT  * from festival");

					while (rs.next()) {

						String idx = rs.getString("f_area");
						String fname = rs.getString("f_name");
						String type = rs.getString("f_type");
						String image = rs.getString("f_image");
				%>

				<div class="list">
					<h1><%=fname%></h1>
					<img src="./img/<%=image%>" alt="img"> <span><%=type%></span>
					<div class="btn_box">
						<button class="btn btn-warning modyfi" list_id="<%=idx%>">수정하기</button>
						<button class="btn btn-danger delete" list_id="<%=idx%>">삭제하기</button>
					</div>
				</div>
				<%
				}

				} catch (SQLException e) {
				e.printStackTrace();
				}
				%>
			</div>
		</div>

		<div class="p_Main">
			<div class="mPopup">
				<i class="fa-solid fa-xmark close"></i>
				<input type="hidden" id="m_idx" value="0">
				<label>
					<p>축제이름</p><br>
					<input type="text" id="m_f_name" >
				</label>
				
				<label>
					<p>축제유형</p><br>
					<input type="text" id="m_f_type">
				</label>
				<label>
					<p>축제기간</p><br>
					<input type="text" id="m_f_date">
				</label>
				<label>
					<p>축제장소</p><br>
					<input type="text" id="m_f_position">
				</label>
				<label>
					<p>축제이미지</p><br>
					<input type="file" id="m_f_image">
				</label>
				<button class="btn btn-success clear">수정완료</button>
			</div>
		</div>
	</div>
	<script src="./js/jquery-3.6.1.js"></script>
	<script src="https://kit.fontawesome.com/86a4884466.js"
		crossorigin="anonymous"></script>
	<script>
    
        const close = document.getElementsByClassName('close')[0];
        const addBtn = document.getElementsByClassName('add')[0];
        const submitBtn = document.getElementsByClassName('submitBtn')[0];
       	var image = "";
        //수정 팝업 보여주기
        $(".modyfi").click((e) => {
        	console.log("modify");
        	let idx = $(e.target).attr('list_id');
        	$('.p_Main').css({ display: "block" });
        	$('.mPopup').css({ display: "block" });
        	
        	$.ajax({
                type: "POST",
                url: "./process/selectlist.jsp",
                data: {
                    idx:idx
                },
                success: function (data) {
                		/* console.log(data); */
						data.forEach(element => {
							 $("#m_idx").val(element.idx);
				             $("#m_f_name").val(element.name);
				             $("#m_f_type").val(element.type);
				             $("#m_f_date").val(element.date);
				             $("#m_f_position").val(element.position);
				             image = element.image;
				        });
                },
                error: function (err) {
                    console.error(err);
                }
            }); 
        })
        
        
        $('.close').click(() => {
        	$('.p_Main').css({ display: "none" });
        	$('.mPopup').css({ display: "none" });
        })
        
        $('.clear').click(() => {
        	
        	let idx = document.getElementById("m_idx").value;
        	let f_name = document.getElementById('m_f_name').value;
            let f_type = document.getElementById('m_f_type').value;
            let f_date = document.getElementById('m_f_date').value;
            let f_position = document.getElementById('m_f_position').value;
        	let imageName = document.getElementById('m_f_image').value;
        	
        	console.log(idx, f_name, f_type, f_date, f_position, imageName.split(/(\\|\/)/g).pop());
        	console.log(image); 
        	
        	if(imageName == "") {
        		$.ajax({
                    type: "POST",
                    url: "./process/modify.jsp",
                    data: {
                    	f_area: idx,
                    	f_name: f_name,
    	                f_type: f_type,
    	                f_date:f_date,
    	                f_position:f_position,
    	                f_image:image
                    },
                    success: function (data) {
                    	console.log(data);
                    	alert("게시물이 수정 되었습니다.");
                   	 	location.href="admin.jsp";
                    },
                    error: function (err) {
                        console.error(err);
                    }
                });  
        	}else {
        		$.ajax({
                    type: "POST",
                    url: "./process/modify.jsp",
                    data: {
                    	f_area: idx,
                    	f_name: f_name,
    	                f_type: f_type,
    	                f_date:f_date,
    	                f_position:f_position,
    	                f_image:imageName.split(/(\\|\/)/g).pop(),
                    },
                    success: function (data) {
                    	console.log(data);
                    	alert("게시물이 수정 되었습니다.");
                   	 	location.href="admin.jsp";
                    },
                    error: function (err) {
                        console.error(err);
                    }
                });  
        	}
        })
        
        
        $(document).on('click','.delete', (e) => {
        	let idx = $(e.target).attr('list_id');
        	 const input = confirm( name + " 게시물을 삭제 하시겠습니까?");
        	
        	if(input == true) {
        		  $.ajax({
                    type: "POST",
                    url: "./process/deleteList.jsp",
                    data: {
                        idx:idx
                    },
                    success: function (data) {
                    	alert("게시물이 삭제 되었습니다.");
                    	 location.href="admin.jsp"; 	
                    },
                    error: function (err) {
                        console.error(err);
                    }
                });
        	}
        }) 
        
		// 값 저장버튼
        $(submitBtn).click(() => {
        	let idx = document.getElementById('idx');
            let area = document.getElementById('area');
            let d_area = document.getElementById('d_area');
            let f_name = document.getElementById('f_name');
            let f_type = document.getElementById('f_type');
            let f_date = document.getElementById('f_date');
            let f_position = document.getElementById('f_position');
            let imageName = document.getElementById('f_image').value;
            let o_name = document.getElementById('o_name');
            let o_type = document.getElementById('o_type');
            let o_people = document.getElementById('o_people');
            let o_phone = document.getElementById('o_phone');
            
            console.log(idx.value * 1);
            
             if ((area.value == "" && d_area.value == "") ||  (f_name.value == "" && f_type.value == "") ||  ( f_date.value == "" && f_position.value == "") || (imageName.value == "" && o_name.value == "" )|| (o_type.value == "" && o_peopl.value == "" && o_phone.value == "")) {
                alert("값이 비어 있습니다.");
            } else {
            	console.log("123");
                $.ajax({
                    type: "POST",
                    url: "./process/test.jsp",
                    data: {
                    	idx: (idx.value * 1) + 1,
                    	area: area.value,
                    	d_area: d_area.value,
		                f_name: f_name.value,
		                f_type: f_type.value,
		                f_date:f_date.value,
		                f_position:f_position.value,
		                f_image:imageName.split(/(\\|\/)/g).pop(),
		                o_name:o_name.value,
		                o_type:o_type.value,
		                o_people:o_people.value,
		                o_phone:o_phone.value
                    },
                    success: function (data) {
                    	alert("게시물이 추가 되었습니다.");
                   	 	location.href="admin.jsp"; 
                    },
                    error: function (err) {
                        console.error(err);
                    }
                });
            } 
            area.value = "";
            d_area.value = "";
            f_name.value = "";
            f_type.value = "";
            f_date.value = "";
            f_position.value = "";
            imageName.value = "";
            o_name.value = "";
            o_type.value = "";
            o_people.value = "";
            o_phone.value = "";
        })
    </script>
</body>

</html>