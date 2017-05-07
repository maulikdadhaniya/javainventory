package com.minimouse.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.minimouse.dao.AddNewAdminService;
import com.minimouse.model.AddNewAdmin;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AddNewAdmin objAdmin = new AddNewAdmin();
	AddNewAdminService objIm = new AddNewAdminService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oldPassword = request.getParameter("txtPaswsword");
		String newPassword = request.getParameter("txtNewPassword");
		String cPass = request.getParameter("txtConfirmPassworm");
		HttpSession pass = request.getSession();
		AddNewAdmin objAdmin = (AddNewAdmin)pass.getAttribute("loggedUserMail");
		try {
			if(objAdmin.getPassword().equals(oldPassword)){
				if(newPassword.equals(cPass)){
					objAdmin.setPassword(newPassword);
					objIm.update(objAdmin);
					request.getSession().invalidate();
					response.sendRedirect("Login.jsp");
				}else{
					pass.setAttribute("pass", "Confirm Password do not match!!!!");
					response.sendRedirect("ChangePassword.jsp");
				}
			}
			else{
				pass.setAttribute("pass", "Old Password do not match!!!!");
				response.sendRedirect("ChangePassword.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
