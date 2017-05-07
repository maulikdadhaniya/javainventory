<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    try {
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <jsp:useBean id="invoice" class="com.minimouse.model.InvoiceFormBean" scope="session"/> --%>
<html>
<head>
<%@include file="Cpanel/css.jsp" %>
<%@include file="Cpanel/js.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Purchase Order</title>

<style>
#main
{
margin-left:10px;
margin-right:10px;
}
</style>
</head>
<body>
<%@include file="Cpanel/header.jsp" %>	
		<div id="main">
			<div class="container-fluid">
				<div class="page-header">
					<div class="pull-left">
						<h1>Purchase Order</h1>
					</div>
				</div>
				<div id="printableArea">
					<c:set var="invoice" value="${invoice}" />
					<center><table border="1">
					<thead>
					 <tr> 
					 <th colspan="3">Purchase Order No: ${invoice.invoiceNo}</th> 
					 <th>  Purchase Order Date: ${invoice.invoiceDate}</th>
					 </tr>
						<tr>
						<td colspan="3">
						<strong>Compney</strong><br>
						Mini-Mouse<br>
						123,Ahmedabad<br>
						382330
						</td>
						<td colspan="2">
						<strong>Customer:</strong><br>
						 ${invoice.firstName} ${invoice.lastName}<br>
						 Contact No: ${invoice.mobileNumber}
						 </td>
						 </tr>
						 </thead>
						<tbody>
						<th>Product Name</th>
						<th> Category</th>
						<th> PPU</th>
						<th> Qurntity</th>
						<tr>
						<td>${invoice.productName}</td>
						<td>${invoice.productCategory}</td>
						<td> ${invoice.priceOfOneQnty}</td>
						<td> Quantity: ${invoice.quantity}</td>
			
						</tr>
						</tbody>
						<tfoot>
						<tr>
						<th colspan="3"> Total</th>
						<th> ${invoice.total}</th>
						</tr> 
						</tfoot>
					
					
					<%-- 	<tr>
							<td> Purchase Order No: ${invoice.invoiceNo} </td>
							<td> Purchase Order Date: ${invoice.invoiceDate} </td>
						</tr>
						<tr>
							<td> Customer Name: ${invoice.firstName} ${invoice.lastName} </td>
						</tr>
						<tr>
							<td> Contact No: ${invoice.mobileNumber} </td>
							<td> Product Category: ${invoice.productCategory} </td>
						</tr>
						<tr>
							<td> Product Name: ${invoice.productName} </td>
							<td> Price per Quantity: ${invoice.priceOfOneQnty} </td>
						</tr>
						<tr>
							<td> Quantity: ${invoice.quantity} </td>
							<td> Total Price: ${invoice.total} </td>
						</tr>--%>
					</table></center>
				</div>
				<center>
				<div class="form-actions">
				<input type="button" class="btn btn-primary" onclick="printDiv('printableArea')" value="Print Purchase Order" />
				</div>
				</center>
			</div>
		</div>
</body>
<script type="text/javascript">
function printDiv(divName){
    w=window.open(null, 'Print_Page', 'scrollbars=yes');  
    
	var inlineStyle = "<style type='text/css'>table{font-family: 'Open Sans', sans-serif;font-size: 13px !important;background-color: transparent;border-collapse: collapse;border-spacing: 0;}</style>";      
	w.document.write(inlineStyle+jQuery('#'+divName).html());
	w.document.close();
    w.print();
}
</script>
</html>
<%    } catch (Exception e) {
        e.printStackTrace();
    }
%>