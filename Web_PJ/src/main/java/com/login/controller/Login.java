package com.login.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.AES.AES128;
import com.filter.ShaEncoding;
import com.user.User;
import com.user.UserDAO;
@WebServlet("/login")
public class Login extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		UserDAO userDAO = new UserDAO();
		
		String key = request.getParameter("key");
		String encryID = request.getParameter("encryID");
		String encryPW = request.getParameter("encryPW");
		String decode_ID = AES128.getAES128_Decode(encryID, key);
		String decode_PW = AES128.getAES128_Decode(encryPW, key);
		PrintWriter script = response.getWriter();
		int result = userDAO.login(decode_ID, ShaEncoding.getSHA256(decode_PW));
		System.out.println(result);
		System.out.println(encryID);
		System.out.println(encryPW);
		System.out.println(decode_ID);
		System.out.println(decode_PW);
		if(result == 1){
			User user = userDAO.getUser(decode_ID);
			HttpSession session= request.getSession();
			session.setAttribute("user", user);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}
}



