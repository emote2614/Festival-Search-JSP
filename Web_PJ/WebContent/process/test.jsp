<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>

<%
request.setCharacterEncoding("UTF-8");

int idx = Integer.parseInt(request.getParameter("idx")); //idx
String area = request.getParameter("area"); //지역명
String darea = request.getParameter("d_area"); // 자치시
String f_name = request.getParameter("f_name"); //축제명
String f_type = request.getParameter("f_type"); //축제유형
String f_date = request.getParameter("f_date"); //축제기간
String f_position = request.getParameter("f_type"); //축제장소
String imageName = request.getParameter("f_image"); //축제이미지
String o_name = request.getParameter("o_name"); //관리단체
String o_type = request.getParameter("o_type"); //관리재단
String o_people = request.getParameter("o_people"); //관리자 이름
String o_phone = request.getParameter("o_phone"); //관리자 전화번호

out.println("idx: " + idx );
out.println("지역명: " + area );
out.println("자치시: " + darea);
out.println("축제명: " + f_name);
out.println("축제유횽: " + f_type);
out.println("축제기간: " + f_date);
out.println("축제장소: " + f_position);
out.println("축제이미지: " + imageName);
out.println("관리단체: " + o_name);
out.println("관리재단: " + o_type);
out.println("관리자 이름: " + o_people);
out.println("관리자 전화번호: " + o_phone);


try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/SERVERPJ", "root", "dkfkgks4524");
	Statement stmt1 = conn.createStatement();
	Statement stmt2 = conn.createStatement();
	Statement stmt3 = conn.createStatement();
	stmt1.executeUpdate("insert into korea(b_korea, s_korea, k_details) values('"+area+"','"+area+"','"+darea+"')");
	stmt2.executeUpdate("insert into festival(f_name,f_type,f_date,f_position,f_way,f_area,f_image) values('"+f_name+"','"+f_type+"','"+f_date+"','"+f_position+"','대면','"+idx+"','"+imageName+"')");
	stmt3.executeUpdate("insert into organization(o_name, o_type, o_people, o_phone, f_area) values('"+o_name+"','"+o_type+"','"+o_people+"','"+o_phone+"','"+idx+"')");
	
	stmt3.close();
	stmt2.close();
	stmt1.close();
	conn.close(); 
	
}catch (SQLException e) {
	e.printStackTrace();
}
 
%>