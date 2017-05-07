package com.minimouse.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			/*request.getSession().setAttribute("loggedUserMail", null);
			response.sendRedirect("Login.jsp");*/
			 request.getSession().invalidate();
			  response.sendRedirect("Login.jsp");
			  return;
	}
}

