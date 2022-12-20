<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Path"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collection"%>
<%@page import="com.connection.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf8"); %>
 <%@ page import="com.user.*"%>
<%

/*  --받아온 데이터    */

	String sId = ((User)(session.getAttribute("user"))).getUserID();

	// 글 작성 내용 및 줄바꿈 처리
    String sContent = request.getParameter("_content");
	sContent = sContent.replace("\r\n","<p>");
	
	// 다녀온 지역
	String sRegion = request.getParameter("place");	
	
 	//--업로드 한 파일
	Collection<Part> parts = request.getParts();
	Iterator<Part> itr = parts.iterator();
	Part[] part = new Part[parts.size()];
	int i=0;
	
	while(itr.hasNext())
	{
		part[i] = itr.next();
		i++;
	}
	//업로드 한 파일--
	
/*  받아온 데이터--    */	
	
	int iReviewNo = 0; // 게시 번호 부여를 위한 정수형 변수
	int iUpdatedRowCount = 0; // 인서트된 항목 갯수를 출력하기 위현 정수형 변수
	
	// 웹서버에 파일 저장을 위한 변수
	String sUploadedHome = "/Users/cbs/git/repository/Web_PJ/WebContent/community/uploadedFile/";
	String sCreatedFolder = null;
	String sPath = null;
	
	//MySQL 연결
	Connection conn =  DBConnection.getConnection();
	Statement stmt = conn.createStatement();
	
	//게시 번호 부여
	ResultSet rs = stmt.executeQuery("SELECT MAX(ftv_review_no) from ftv_reviews where review_writer_id='"+sId+"'");

	if(rs.next())
	{
		if((iReviewNo = rs.getInt(1))==0)
		{
			iReviewNo = 1;
		}else iReviewNo++;
		
	}
	
	sCreatedFolder = sId+"content"+iReviewNo;
	Files.createDirectory(Paths.get(sUploadedHome+sCreatedFolder));
	
	//게시글 데이터 insert
	iUpdatedRowCount=stmt.executeUpdate(
			"insert into ftv_reviews values ('"+sId+"',"+iReviewNo+",'"+sContent+"','"+sRegion+"',now())");
	if(iUpdatedRowCount==0)
	{
		System.out.println("ftv_reviews : Changed nothing");
	}else 
	{
		System.out.println("ftv_reviews : "+iUpdatedRowCount+"rows are changed");
	}
	
	//업로드 한 파일 웹서버에 저장 및 DB서버에 insert
	try{
		for(int j=0; j<parts.size();j++)
		{
			if(part[j].getName().equals("_file"))
			{
				if(part[j].getSubmittedFileName()=="") 
				{
					iUpdatedRowCount=stmt.executeUpdate("insert into review_images(review_writer_id,ftv_review_no,review_images_no) values ('"+sId+"',"+iReviewNo+","+0+")");
					if(iUpdatedRowCount==0)
					{
						System.out.println("review_images : Changed nothing");
					}else 
					{
						System.out.println("review_images : "+iUpdatedRowCount+"rows are changed");
					}
					break;
				}
				sPath = sUploadedHome+sCreatedFolder+"/image"+(j-1)+"."+part[j].getContentType().split("/")[1];
				part[j].write(sPath);
				sPath = sPath.replace("\\","\\\\");
				iUpdatedRowCount=stmt.executeUpdate("insert into review_images values ('"+sId+"',"+iReviewNo+","+(j-1)+",'"+sPath+"')");
				if(iUpdatedRowCount==0)
				{
					System.out.println("review_images : Changed nothing");
				}else 
				{
					System.out.println("review_images : "+iUpdatedRowCount+"rows are changed");
				}
			}
		} 
	}catch(IOException e)
	{
		e.printStackTrace();
	}finally
	{
		rs.close();
		stmt.close();
		conn.close();
	}
	
	
	 response.sendRedirect("board.jsp");
%>