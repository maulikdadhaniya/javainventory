package com.minimouse.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimouse.dao.AddNewAdminService;
import com.minimouse.model.AddNewAdmin;
@WebServlet("/AddNewAdminServlet")
public class AddNewAdminServlet extends HttpServlet {
	AddNewAdmin objAdmin = new AddNewAdmin();
	AddNewAdminService objAdminService = new AddNewAdminService();

	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		String f = request.getParameter("flag");
		AddNewAdmin aId = objAdminService.selectById(id);
		if(f.equals("edit"))
		{
			request.getSession().setAttribute("admin", aId);
		}
		else if(f.equals("delete"))
		{
			objAdminService.delete(aId);
		}
		response.sendRedirect("AddNewAdmin.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AddNewAdmin objA = (AddNewAdmin)request.getSession().getAttribute("admin");
		
		if(objA != null)
		{
			if(objAdminService != null)
			{
				request.getSession().removeAttribute("admin");
				objA.setFirstName(request.getParameter("txtFirstName"));
				objA.setLastName(request.getParameter("txtLastName"));
				objA.setEmail(request.getParameter("txtEmail"));
				objA.setPassword(request.getParameter("txtPassword"));
				objA.setMobileNumber(Long.parseLong(request.getParameter("txtMobile")));
				objAdminService.update(objA);
			}
		}
		
		else
		{
		objAdmin.setFirstName(request.getParameter("txtFirstName"));
		objAdmin.setLastName(request.getParameter("txtLastName"));
		objAdmin.setEmail(request.getParameter("txtEmail"));
		objAdmin.setPassword(request.getParameter("txtPassword"));
		objAdmin.setMobileNumber(Long.parseLong(request.getParameter("txtMobile")));
		objAdmin.setStatus("A");
		objAdminService.insert(objAdmin);	
	}
		response.sendRedirect("AddNewAdmin.jsp");
	
		
	}
	
}
