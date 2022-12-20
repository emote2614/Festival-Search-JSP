<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connection.*"%>
<%@page import="com.user.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf8"); %>    
<%
	// 사용자가 선택한 지역 데이터
	String sRegion = request.getParameter("place");

	//DB로부터 받아올 데이터를 저장할 문자열 및 정수형 변수
	String sId = null;
	String sContent = null;
	String sDate = null;
	int iContentNo = 0;
	
	//쿼리문을 위한 문자열 변수
	String sql = null;
	
	//목록에서 출력될 내용의 문자 갯수 설정
	int contentLenth = 30;
	
	//각 목록에 접근하기 위한 아이디 값 변수
	int trNum = 1;
	
	
	Connection conn =  DBConnection.getConnection();
	Statement stmt = conn.createStatement();
	
	//선택한 지역에 따른 쿼리문 설정, null일 경우 전체 지역 조회. +22.12.12 "전체"일 경우도 포함
	if(sRegion==null||sRegion.equals("전체"))
	{
		sql = "select review_writer_id,fr_content,fr_date,ftv_review_no from ftv_reviews order by fr_date desc";
	}else 
	{
		sql = "select review_writer_id,fr_content,fr_date,ftv_review_no from ftv_reviews where fr_region='"+sRegion+"' order by fr_date desc";
	}
	
	ResultSet rs = stmt.executeQuery(sql);
	
	while(rs.next())
	{
		sId = rs.getString(1);
		if(rs.getString(2).length()>contentLenth) 
		{
			sContent = rs.getString(2).subSequence(0,contentLenth-1)+"...";
		}else
		{
			sContent = rs.getString(2);
		}
		sDate = rs.getString(3);
		iContentNo = rs.getInt(4);
		
		String url = "'board_list.jsp?_writerId="+sId+"&_contentNo="+iContentNo+"'";
%>
<script>
function openDetail()
{
	window.open(<%=url %>,"_top","width=400,height=300");
}
</script>
<% 		
		
		out.println("<tr><td width=100>"+sId +"</td>"+
						"<td width=350><a href="+url+" onclick='openDetail()'>"+sContent+"</a></td>"+
						"<td>"+sDate+"</td></tr>");
	}

	
	rs.close();
	stmt.close();
	conn.close();
%>
