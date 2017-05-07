package com.minimouse.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimouse.dao.ProductPurchaseService;
import com.minimouse.dao.ProductSubCategoryService;
import com.minimouse.model.InvoiceFormBean;
import com.minimouse.model.ProductSubCategory;
import com.minimouse.model.StockInTxn;

@WebServlet("/StockPurchaseReport")
public class StockPurchaseReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	StockInTxn stockInTxn = new StockInTxn();
	ProductPurchaseService productPurchaseService = new ProductPurchaseService();
	ProductSubCategory objSubPc = new ProductSubCategory();
	ProductSubCategoryService objSubPcs = new ProductSubCategoryService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
		List<InvoiceFormBean> invoiceLst = productPurchaseService.getAllInvoiceDetail();
		
		response.setContentType("text/html");
	    request.setAttribute("invoiceLst",invoiceLst);
	    request.getRequestDispatcher("/StockPurchaseReport.jsp").forward(request, response);
	}
}