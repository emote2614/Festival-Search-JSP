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

int idx = Integer.parseInt(request.getParameter("idx"));
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/SERVERPJ", "root", "dkfkgks4524");
	Statement stmt = conn.createStatement();
	stmt.executeUpdate("DELETE FROM korea WHERE f_area=" + idx); 	
	stmt.close();
	conn.close();
	
}catch (Exception e) {
	e.printStackTrace();
}


%>

<%= idx %>