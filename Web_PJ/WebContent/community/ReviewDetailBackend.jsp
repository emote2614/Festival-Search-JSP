<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connection.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String sWriterId = request.getParameter("_writerId");
	int iContentNo = Integer.parseInt(request.getParameter("_contentNo"));
	
	//DB로부터 받아올 데이터를 저장할 문자열 변수들
	String sId = null;
	String sContent = null;
	String sRegion = null;
	String sDate = null;
	
	Connection conn = DBConnection.getConnection();
	Statement stmt = conn.createStatement();
	
	//DB 서버로부터 사진 데이터를 제외한 게시글 관련 데이터를 받아옴
	ResultSet rs = stmt.executeQuery("select * from ftv_reviews where review_writer_id='"+sWriterId+"' and ftv_review_no="+iContentNo);
	if(rs.next())
	{
		sId = rs.getString("review_writer_id");
		sContent = rs.getString("fr_content");
		sRegion = rs.getString("fr_region");
		sDate = rs.getString("fr_date");
	}else 
	{
		response.sendRedirect("Error.jsp?errorCode=1");
	}

	
	rs.close();
	stmt.close();
	conn.close();
	
%>

