package com.login.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.filter.ShaEncoding;
import com.user.User;
import com.user.UserDAO;

@WebServlet("/register")
public class RegisterCon extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("register.jsp").forward(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String userID = request.getParameter("userID");
		String userPW = request.getParameter("userPW");
		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmail");
		String userPhone = request.getParameter("userPhone");
		userPW=ShaEncoding.getSHA256(userPW);
		User user = new User(userID,userPW,userName,userEmail,userPhone);
		PrintWriter script = response.getWriter();
		UserDAO userDAO = new UserDAO();
		int result = userDAO.register(user);
		if(result == -1){
			script.println("<script>");
			script.println("alert('아이디가 이미 존재합니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			HttpSession session= request.getSession();
			session.setAttribute("user", user);
			request.getRequestDispatcher("registerResult.jsp").forward(request, response);
		}
	}
}