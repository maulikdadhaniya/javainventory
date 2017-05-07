package com.minimouse.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimouse.dao.ProductSubCategoryService;
import com.minimouse.model.ProductSubCategory;

@WebServlet("/ProductSubCategoryServlet")
public class ProductSubCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductSubCategory objSubPc = new ProductSubCategory();
	ProductSubCategoryService objSubPcs = new ProductSubCategoryService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		
		String f = request.getParameter("flag");
		
		ProductSubCategory pId = objSubPcs.selectById(id);
		if(f.equals("edit"))
		{
			request.getSession().setAttribute("hdnProdSubCategory", pId); 				 //Edit 
		}
		else if(f.equals("delete")){
			objSubPcs.delete(pId);												//Delete
		}
			response.sendRedirect("ProductSubCategory.jsp");

	
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		

		ProductSubCategory p = (ProductSubCategory) request.getSession().getAttribute("hdnProdSubCategory");
		
		if(p!=null)
		{
			if(objSubPcs != null){
			request.getSession().removeAttribute("hdnProdSubCategory");
			p.setTitle(request.getParameter("txtTitle"));
			p.setDescription(request.getParameter("txtDescription"));
			p.setPrice(Integer.parseInt(request.getParameter("txtPrice")));
			p.setQuantity(Integer.parseInt(request.getParameter("txtQuantity")));
			p.setCategory(Integer.parseInt(request.getParameter("categoryDrop")));
			objSubPcs.update(p);
			}
		}
		else
		{																//insert
				
		objSubPc.setTitle(request.getParameter("txtTitle"));
		objSubPc.setDescription(request.getParameter("txtDescription"));
		objSubPc.setPrice(Integer.parseInt(request.getParameter("txtPrice")));
		objSubPc.setQuantity(Integer.parseInt(request.getParameter("txtQuantity")));
		objSubPc.setCategory(Integer.parseInt(request.getParameter("categoryDrop")));
		objSubPc.setStatus("A");
		objSubPcs.insert(objSubPc);
		}
		response.sendRedirect("ProductSubCategory.jsp");
	}
}
