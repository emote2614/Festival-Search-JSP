<%@page import="java.util.Calendar"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.connection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.user.*"%>
<%
	int iSeed; 
	final int iRcmdFtvNum = 3; 
	int[] ftv_no = new int[iRcmdFtvNum]; 
	String[] ftv_images = new String[iRcmdFtvNum];
	for(int i=0; i<iRcmdFtvNum;i++)// 변수 초기화
	{
		ftv_images[i] = new String("");
		ftv_no[i] =  0;
	}
	
	//일자 기반 랜덤 값 생성
	int randNum = Calendar.getInstance().get(Calendar.DATE) * Calendar.getInstance().get(Calendar.MONTH);
	randNum = randNum%(13+Calendar.getInstance().get(Calendar.DATE));

	Connection conn = DBConnection.getConnection();
	Statement stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery("select max(f_info) from festival");
	if(rs.next()) iSeed = 40;
	else iSeed = 0;

	if(iSeed!=0)
	{
		for(int i=0; i<iRcmdFtvNum;i++)
		{
			ftv_no[i] =  new Random(randNum+i).nextInt(iSeed)+1;
			rs = stmt.executeQuery("select f_image from festival where f_info="+ftv_no[i]);
			if(rs.next()) ftv_images[i] =  rs.getString(1);
		}
	}
%>