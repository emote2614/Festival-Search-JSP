<%@page import="java.sql.ResultSet"%>
<%@page import="com.connection.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
	String sWriterId_3 = request.getParameter("_writerId");
	int iContentNo_3 = Integer.parseInt(request.getParameter("_contentNo"));

	//사진 데이터를 저장할 변수 선언
	String[] images = null;
	int iImagesCount = 0;

	Connection conn_3 = DBConnection.getConnection();
	Statement stmt_3 = conn_3.createStatement();

	//사진 데이터의 갯수 조회
	ResultSet rs_3 = stmt_3.executeQuery("select count(*) from review_images where review_writer_id='"+sWriterId_3+"' and ftv_review_no="+iContentNo_3);
	if(rs_3.next())
	{
		iImagesCount =  rs_3.getInt(1);	
	}else 
	{
		response.sendRedirect("Error.jsp?errorCode=2");
	}
	images = new String[iImagesCount];
	int i=0;
	
	//사진 데이터 조회 및 변수에 저장, 만일 review_images_no의 값이 0 이라면 해당 게시물은 사진 파일이 없는 게시물임. 따라서, images[0]엔 null이 저장 됌.
	rs_3 = stmt_3.executeQuery("select review_images_no,location from review_images where review_writer_id='"+sWriterId_3+"' and ftv_review_no="+iContentNo_3);
	while(rs_3.next())
	{
		if(rs_3.getInt(1)!=0)
		{
			images[i] = rs_3.getString(2);
			images[i] = "/community/"+images[i].split("/")[8]+"/"+images[i].split("/")[9]+"/"+images[i].split("/")[10];
			//images[i] = images[i].split("")
			/* images[i] = images[i].replace("&", "/"); */
		}
		i++;
	}
	
	rs_3.close();
	stmt_3.close();
	conn_3.close();
	
	//front 단
	if(images[0]!=null)
	{
		for(int j=0; j<i;j++)
		{
			out.println("<tr colspan=5>");
			out.println("<td>");
			out.println("<img width=250 height=250 src='"+images[j]+"'>");
			out.println("</td>");
			out.println("</tr>");
		}
		out.println("</table>");
	}
%>