package com.login.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.User;
import com.user.UserDAO;

@WebServlet("/idsearch")
public class IdSearch extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmail");
		String userPhone = request.getParameter("userPhone");
		try {
			UserDAO DAO = new UserDAO();
			ResultSet rs = DAO.FindId(userName, userPhone, userEmail);
			PrintWriter script = response.getWriter();
			if(rs.next()) {//test
				String userID = rs.getString("userID");
				String userPW = rs.getString("userPW");
				User user = new User(userID,userPW,userName,userEmail,userPhone);
				request.setAttribute("user", user);
				request.getRequestDispatcher("idSearchResult.jsp").forward(request, response);
			}else {
				script.println("<script>");
				script.println("alert('잘못된 정보를 수정해주세요.')");
				script.println("history.back()");
				script.println("</script>");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher("idSearch.jsp").forward(request, response);
	}
}