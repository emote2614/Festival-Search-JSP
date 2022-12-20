<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.user.*"%>
<%
	String sId="";

	if(session.getAttribute("user")==null) 
	{
		out.println("<script>");
		out.println("alert(\"로그인 후 이용해주세요\");");
		out.println("window.open('board.jsp','_self','','');");
		out.println("</script>");
	}else
	{
		sId = ((User)(session.getAttribute("user"))).getUserID();// 세션으로부터 얻어옴
	}

%>