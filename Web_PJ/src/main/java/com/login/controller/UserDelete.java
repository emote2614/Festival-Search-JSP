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

@WebServlet("/userdelete")
public class UserDelete extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
    	UserDAO DAO = new UserDAO();
		String userID = request.getParameter("userID");
		String userPW = request.getParameter("userPW");
		String userName = request.getParameter("userName");
		String userPhone = request.getParameter("userPhone");
		int i = DAO.DeleteUser(userID, userPW, userName, userPhone);
		if(i==1) {
		    request.getRequestDispatcher("userDeleteResult.jsp").forward(request, response);
		    HttpSession session = request.getSession();
			session.invalidate();
		}else {
		    request.getRequestDispatcher("index.jsp").forward(request, response);
		}
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher("userDelete.jsp").forward(request, response);
    }
}