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
import com.minimouse.model.StockInTxn;

@WebServlet("/StockPurchaseServlet")
public class StockPurchaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	StockInTxn stockInTxn = new StockInTxn();
	ProductPurchaseService productPurchaseService = new ProductPurchaseService();
	ProductSubCategory objSubPc = new ProductSubCategory();
	ProductSubCategoryService objSubPcs = new ProductSubCategoryService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer productId = Integer.parseInt(request.getParameter("productDrop").split("~")[0]);
		StockInTxn stockInTxn = new StockInTxn();
		stockInTxn.setProductId(productId);
		stockInTxn.setClientId(Integer.parseInt(request.getParameter("clientDrop")));
		stockInTxn.setQuantity(Integer.parseInt(request.getParameter("txtQuantity")));
		stockInTxn.setPoPrice(Integer.parseInt(request.getParameter("txtTotal")));
		stockInTxn.setCreatedDate(new Date());
		productPurchaseService.insert(stockInTxn);
		
		objSubPc = objSubPcs.selectById(productId);
		objSubPc.setQuantity(objSubPc.getQuantity()+Integer.parseInt(request.getParameter("txtQuantity")));
		objSubPcs.update(objSubPc);
		
		InvoiceFormBean invoice = productPurchaseService.getInvoiceDetailByInvoiceId(stockInTxn.getStockInId());
		
		response.setContentType("text/html");
	    request.setAttribute("invoice",invoice);
	    request.getRequestDispatcher("/PurchaseOrder.jsp").forward(request, response);
	}
}
