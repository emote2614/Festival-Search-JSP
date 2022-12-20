<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connection.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% request.setCharacterEncoding("utf8"); %>
 <%@ page import="com.user.*"%>
<%
	String sId="";

	String sWriterId = request.getParameter("_writerId"); 
	int iReviewNo = Integer.parseInt(request.getParameter("_contentNo"));
	
	if(session.getAttribute("user")==null) 
	{
		out.println("<script>");
		out.println("alert(\"로그인 후 이용해주세요\");");
		out.println("window.open('board_list.jsp?_writerId="+sWriterId+"&_contentNo="+iReviewNo+"','_self','','');");
		out.println("</script>");
	}else
	{
		sId = ((User)(session.getAttribute("user"))).getUserID();// 세션으로부터 얻어옴
		
		String sContent = request.getParameter("content");
		
		int iCommentNo = 0; 
		
		Connection conn =  DBConnection.getConnection();
		Statement stmt = conn.createStatement();
		
		//댓글 번호 부여
		ResultSet rs = stmt.executeQuery("select max(comment_no) from comments"+
										" where review_writer_id='"+sWriterId+"' and ftv_review_no="+iReviewNo);
		
		if(rs.next())
		{
			if((iCommentNo = rs.getInt(1))==0)
			{
				iCommentNo = 1;
			}else iCommentNo++;
			
		}
		
		stmt.executeUpdate("insert into comments values ('"+sWriterId+"',"+iReviewNo+","+iCommentNo+",'"+sId+"','"+sContent+"',now())");
		
		response.sendRedirect("board_list.jsp?_writerId="+sWriterId+"&_contentNo="+iReviewNo);
	}
		

%>