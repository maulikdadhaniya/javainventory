package com.minimouse.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimouse.dao.ProductSalesService;
import com.minimouse.model.InvoiceFormBean;

@WebServlet("/StockSalesReport")
public class StockSalesReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductSalesService productSalesService = new  ProductSalesService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
		List<InvoiceFormBean> invoiceLst = productSalesService.getAllInvoiceDetail();
		
		response.setContentType("text/html");
	    request.setAttribute("invoiceLst",invoiceLst);
	    request.getRequestDispatcher("/StockSalesReport.jsp").forward(request, response);
	}
}