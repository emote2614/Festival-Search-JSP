<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<%	
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
 	JSONArray arr = new JSONArray();

	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/SERVERPJ", "root", "dkfkgks4524");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM korea  INNER JOIN festival ON korea.f_area =  festival.f_area WHERE korea.b_korea ='"+title+"'");
		
		 while(rs.next()) {			
			
			 Map<String, String> map = new HashMap<>();
			 map.put("idx", rs.getString("f_info"));
			 map.put("name", rs.getString("f_name"));
			 map.put("type", rs.getString("f_type"));
			 map.put("position", rs.getString("f_position"));
			 map.put("img", rs.getString("f_image"));
			 
			 JSONObject a = new JSONObject(map);
			 
			arr.add(a);
		} 
		
		stmt.close();
		conn.close();
		
	}catch (Exception e) {
		e.printStackTrace();
	}

%>

<%= arr %>