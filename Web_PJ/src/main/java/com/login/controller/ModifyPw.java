package com.login.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.UserDAO;

@WebServlet("/modifypw")
public class ModifyPw extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String page = request.getParameter("page");		
		if(page.equals("check")) {
			String userID = request.getParameter("userID");
			String userName = request.getParameter("userName");
			String userPhone = request.getParameter("userPhone");
			String userEmail = request.getParameter("userEmail");
			UserDAO.DBConnect();
			boolean result = UserDAO.CheckIdent(userID,userName,userPhone,userEmail);
			UserDAO.DBclose();
			if(result) {
				request.setAttribute("userID", userID);
				request.getRequestDispatcher("modifyPw.jsp").forward(request, response);
			}
			else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('존재하지 않는 사용자 정보입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
		}
		else if(page.equals("success")){
			String id = request.getParameter("userID");
			String pw = request.getParameter("userPW");
			UserDAO.DBConnect();
			UserDAO.ResetPW(id,pw);
			UserDAO.DBclose();
			response.sendRedirect("/main");
		}
		else{
			request.getRequestDispatcher("identCheck.jsp").forward(request, response);
		}
	}
}