package com.minimouse.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimouse.dao.AddClientService;
import com.minimouse.model.AddClient;
@WebServlet("/AddClientServlet")
public class AddClientServlet extends HttpServlet {
	AddClient ObjClient =  new AddClient();
	AddClientService ObjClientS = new AddClientService();
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String f = request.getParameter("flag");
		AddClient cId = ObjClientS.selectById(id);
		if(f.equals("edit"))
		{
			request.getSession().setAttribute("client", cId);
		}
		else if(f.equals("delete"))
		{
			ObjClientS.delete(cId);
		}
		response.sendRedirect("AddClient.jsp");

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AddClient objC = (AddClient)request.getSession().getAttribute("client");
		if(objC != null)
		{
			if(ObjClientS != null)
			{
				request.getSession().removeAttribute("client");
				objC.setFirstName(request.getParameter("txtFirstName"));
				objC.setLastName(request.getParameter("txtLastName"));
				objC.setEmail(request.getParameter("txtEmail"));
				objC.setPassword(request.getParameter("txtPassword"));
				objC.setMobileNumber(Long.parseLong(request.getParameter("txtMobile")));
				ObjClientS.update(objC);
			}
		}
		else
		{
			ObjClient.setFirstName(request.getParameter("txtFirstName"));
			ObjClient.setLastName(request.getParameter("txtLastName"));
			ObjClient.setEmail(request.getParameter("txtEmail"));
			ObjClient.setPassword(request.getParameter("txtPassword"));
			ObjClient.setMobileNumber(Long.parseLong(request.getParameter("txtMobile")));
			ObjClient.setStatus("A");
			ObjClientS.insert(ObjClient);
		}
		response.sendRedirect("AddClient.jsp");
		}
	}