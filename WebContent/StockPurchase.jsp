
<%@page import="com.minimouse.model.ProductSubCategory"%>
<%@page import="java.util.List"%>
<%@page import="com.minimouse.dao.ProductPurchaseService"%>
<%@page import="com.minimouse.model.ProductCategory"%>
<%@page import="com.minimouse.dao.ProductCategoryService"%>
<%@page import="com.minimouse.model.AddClient"%>
<%@page import="com.minimouse.dao.AddClientService"%>
<%@page import="com.minimouse.model.StockInTxn"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Purchase</title>
<%@include file="Cpanel/css.jsp" %>
<%@include file="Cpanel/js.jsp" %>
	<link rel="shortcut icon" href="img/minimouse header.png" />
	<!-- Apple devices Homescreen icon -->
	<link rel="apple-touch-icon-precomposed" href="img/apple-touch-icon-precomposed.png" />
	<style>
#main
{
margin-left:10px;
margin-right:10px;
}
</style>
</head>

<body>
<%
	if(session.getAttribute("loggedUserMail")==null)
	{
		response.sendRedirect("Login.jsp");
	}
%>
<%@include file="Cpanel/header.jsp" %>	
		<div id="main">
			<div class="container-fluid">
				<div class="page-header">
					<div class="pull-left">
						<h1>Product Purchase</h1>
					</div>
				</div>
				<div class="breadcrumbs">
					<ul>
						<li>
							<a href="more-login.html">Home</a>
							<i class="icon-angle-right"></i>
						</li>
						<li>
							<a href="forms-basic.html">Product Category</a>
							<i class="icon-angle-right"></i>
						</li>
						<li>
							<a href="forms-basic.html">Product Sub-Category</a>
							<i class="icon-angle-right"></i>
						</li>
					</ul>
				</div>
				<div class="row-fluid">
					<div class="span12">
						<div class="box">
							<div class="box-content">
								<form action="StockPurchaseServlet" method="POST" class='form-horizontal form-validate' id="bb">
									<div class="control-group">
										<label for="textfield" class="control-label">Client</label>
										<div class="controls">
											<select name="clientDrop" id="clientDrop" required>
												<option value="">-- Please Select Client --</option>
<% 
AddClientService addClientService = new AddClientService();
List<AddClient> clientLst = addClientService.selectAll();

	for(int i=0;i<clientLst.size();i++)
	{ 
 %> <option value=<%=clientLst.get(i).getId()%>><%=clientLst.get(i).getFirstName() %></option>
<% 	
 } 
%>	

											</select>
										</div>
									</div>
									<div class="control-group">
										<label for="textfield" class="control-label">Product Name</label>
										<div class="controls">
											<select name="productDrop" id="productDrop" onchange="onProductChangeSetPrice();" required>
												<option value="">-- Please Select Product--</option>
<% 
ProductPurchaseService objPcs = new ProductPurchaseService();
List<ProductSubCategory> psc = objPcs.selectAll();

	for(int i=0;i<psc.size();i++)
	{ 
 %> <option value=<%=psc.get(i).getId()%>~<%=psc.get(i).getPrice()%>><%=psc.get(i).getTitle()%></option>
<% 	
 } 
%>	

											</select>
										</div>
									</div>
									<div class="control-group">
										<label for="textfield" class="control-label">Price Per Unit</label>
										<div class="controls">
											<input type="text" name="txtPrice" id="txtPrice" value="0" readonly="readonly" class="input-xlarge" data-rule-required="true" data-rule-minlength="2">
										</div>
									</div>
									<div class="control-group">
										<label for="textfield" class="control-label">Quantity</label>
										<div class="controls">
											<input type="text" name="txtQuantity" id="txtQuantity" value="0" onkeyup="onProductChangeSetPrice();" class="input-xlarge" data-rule-required="true" data-rule-minlength="2" required>
										</div>
									</div>
									
									<div class="control-group">
										<label for="textfield" class="control-label">Total Purchase Order Amount</label>
										<div class="controls">
											<input type="text" name="txtTotal" id="txtTotal" value="0" readonly="readonly" class="input-xlarge" data-rule-required="true" data-rule-minlength="2">
										</div>
									</div>
									
								
									<div class="form-actions">
									<a href="StockPurchase.jsp">
										<input type="submit" class="btn btn-primary" value="Submit">
										<button type="button" class="btn">Cancel</button>
									</a>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
				
</body>
</html>