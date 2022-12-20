<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>



<%
	request.setCharacterEncoding("UTF-8");

	int idx = Integer.parseInt(request.getParameter("idx"));
	JSONArray arr = new JSONArray();
	JSONObject obj = new JSONObject();

	 try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/SERVERPJ", "root", "dkfkgks4524");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM festival WHERE f_area=" + idx);
		
		while(rs.next()) {
			obj.put("idx", rs.getString("f_area"));
			obj.put("name", rs.getString("f_name"));
			obj.put("type", rs.getString("f_type"));
			obj.put("date", rs.getString("f_date"));
			obj.put("position", rs.getString("f_position"));
			obj.put("image", rs.getString("f_image"));
			arr.add(0,obj); 
		}
		
		stmt.close();
		conn.close();
		
	}catch (Exception e) {
		e.printStackTrace();
	}
 
%>

<%= arr %>