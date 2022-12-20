<%@page import="java.sql.ResultSet"%>
<%@page import="com.connection.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	String sWriterId_2 = request.getParameter("_writerId");
	int iContentNo_2 = Integer.parseInt(request.getParameter("_contentNo"));
	
	//DB로부터 받아올 데이터를 저장할 문자열 변수들
	String sCmtWriterId = null;
	String sCmtContent = null;
	String sCmtDate = null;
	
	Connection conn_2 = DBConnection.getConnection();
	Statement stmt_2 = conn_2.createStatement();
	
	ResultSet rs_2 = stmt_2.executeQuery("select * from comments where review_writer_id='"+sWriterId_2+"' and ftv_review_no="+iContentNo_2+" order by comment_no asc");
	out.println("<table>");
	while(rs_2.next())
	{
		sCmtWriterId = rs_2.getString("comment_writer_id");
		sCmtContent = rs_2.getString("cmt_content");
		sCmtDate = rs_2.getString("cmt_date");
		
		out.println("<tr>");
		out.println("<td>"+sCmtWriterId+"</td>");
		out.println("<td>"+sCmtDate+"</td>");
		out.println("<td>"+sCmtContent+"</td>");
		out.println("</tr>");
	}
	out.println("</table>");
	rs_2.close();
	stmt_2.close();
	conn_2.close();
%>