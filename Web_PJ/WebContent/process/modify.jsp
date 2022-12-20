<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>

    
    
<% 
	try {
		
		int idx = Integer.parseInt(request.getParameter("f_area"));
		String f_name = request.getParameter("f_name");
		String f_type = request.getParameter("f_type");
		String f_date = request.getParameter("f_date");
		String f_position = request.getParameter("f_position");
		String image = request.getParameter("f_image");
		
		out.println(idx);
		out.println(f_name);
		out.println(f_type);
		out.println(f_date);
		out.println(f_position);
		out.println(image);
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/SERVERPJ", "root", "dkfkgks4524");
		Statement stmt = conn.createStatement();
		stmt.executeUpdate("UPDATE festival SET f_name='"+f_name+"', f_type='"+f_type+"', f_date='"+f_date+"', f_position='"+f_position+"', f_image='"+image+"' WHERE f_area='"+idx+"'");
		
		
		stmt.close();
		conn.close();
	}catch (Exception e) {
		e.printStackTrace();
	}


%>