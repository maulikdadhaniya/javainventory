package com.minimouse.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimouse.dao.AddNewAdminService;
import com.minimouse.model.AddNewAdmin;
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	AddNewAdminService service = new AddNewAdminService();
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String mail = request.getParameter("txtEmail");
	AddNewAdmin tblObj = service.selectByEmailId(mail);
	String pass = request.getParameter("txtPassword");
		
		if(tblObj != null && tblObj.getEmail().equals(mail) && tblObj.getPassword().equals(pass))
		{
			request.getSession().setAttribute("loggedUserMail", tblObj);
			request.getSession().removeAttribute("error");
			response.sendRedirect("MasterPage.jsp");
			
		}
		else 
		{
			request.getSession().setAttribute("error", "Email or password are wrong");
			response.sendRedirect("Login.jsp");
		}
		
	}
}

