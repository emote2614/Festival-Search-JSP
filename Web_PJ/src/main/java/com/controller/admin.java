package com.controller;

import java.io.IOException;
import com.user.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/admin")
public class admin extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		String sId="";

		if(session.getAttribute("user")==null) 
		{
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}else
		{
			sId = ((User)(session.getAttribute("user"))).getUserID();
			
			if(sId.equals("admin")) {
				request.getRequestDispatcher("admin.jsp").forward(request, response);
			}else {
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		}
		
	}
}
