package com.minimouse.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimouse.dao.ProductPurchaseService;
import com.minimouse.dao.ProductSalesService;
import com.minimouse.dao.ProductSubCategoryService;
import com.minimouse.model.InvoiceFormBean;
import com.minimouse.model.ProductSubCategory;
import com.minimouse.model.StockOutTxn;

/**
 * Servlet implementation class StockSalesServlet
 */
@WebServlet("/StockSalesServlet")
public class StockSalesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	StockOutTxn StockOutTxn = new StockOutTxn();
	ProductSalesService ProductSalesService = new  ProductSalesService();
	ProductSubCategory objSubPc = new ProductSubCategory();
	ProductSubCategoryService objSubPcs = new ProductSubCategoryService();
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer productId = Integer.parseInt(request.getParameter("productDrop").split("~")[0]);
		
		StockOutTxn stockOutTxn = new StockOutTxn();
		stockOutTxn.setProductId(productId);
		stockOutTxn.setClientId(Integer.parseInt(request.getParameter("clientDrop")));
		stockOutTxn.setQuantity(Integer.parseInt(request.getParameter("txtQuantity")));
		stockOutTxn.setSoPrice(Integer.parseInt(request.getParameter("txtTotal")));
		stockOutTxn.setCreatedDate(new Date());
		ProductSalesService.insert(stockOutTxn);
		
		objSubPc = objSubPcs.selectById(productId);
		objSubPc.setQuantity(objSubPc.getQuantity()-Integer.parseInt(request.getParameter("txtQuantity")));
		objSubPcs.update(objSubPc);
		
		InvoiceFormBean invoice = ProductSalesService.getInvoiceDetailByInvoiceId(stockOutTxn.getStockOutId());
		
		response.setContentType("text/html");
	    request.setAttribute("invoice",invoice);
	    request.getRequestDispatcher("/Invoice.jsp").forward(request, response);
	    
		
	}
		
	

}
