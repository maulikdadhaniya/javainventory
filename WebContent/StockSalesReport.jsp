<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    try {
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<%@include file="Cpanel/css.jsp" %>
<%@include file="Cpanel/js.jsp" %>
<link rel="shortcut icon" href="img/minimouse header.png" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Total Sales Report</title>

<style>
#main
{
margin-left:10px;
margin-right:10px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
    $('#ss_report').DataTable({
        dom: 'Bfrtip',
        buttons: [
            'excel', 'pdf', 'print'
        ]
    });
} );
</script>
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
						<h1>Total Sales Report</h1>
					</div>
				</div>
				<div id="printableArea">
				<div class="box-content nopadding">
					<c:set var="invoiceLst" value="${invoiceLst}" />
					<c:set var="srNo"  value="${1}"/>
		            <table id="ss_report"  class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
		                <thead>
		                <tr style="font-family: sans-serif; font-size: 15; font-style: normal;" >
		                    <td><b>SR. No</b></td> 
		                    <td><b>Sales Order No.</b></td>
		                    <td><b>Sales Order Date</b></td>
		                    <td><b>Client Name:</b></td> 
		                    <td><b>Contact No</b></td>  
		                    <td><b>Product Category</b></td> 
		                    <td><b>Product Name</b></td> 
		                    <td><b>Quantity</b></td> 
		                    <td><b>Total Price</b></td> 
		                </tr>
		                </thead>
		                <tbody>
		                <c:forEach var="invoice" items="${invoiceLst}">
		                    <tr>
		                        <td>${srNo}</td>
		                        <td>${invoice.invoiceNo}</td> 
		                        <td>${invoice.invoiceDate}</td> 
		                        <td>${invoice.firstName} ${invoice.lastName}</td> 
		                        <td>${invoice.mobileNumber}</td> 
		                        <td>${invoice.productCategory}</td> 
		                        <td>${invoice.productName}</td> 
		                        <td>${invoice.quantity}</td> 
		                        <td>${invoice.total}</td> 
		                        <c:set var="srNo"  value="${srNo+1}"/>
		                    </tr>
		                </c:forEach>
		                </tbody>
		                    
		            </table>
				</div>
				<!-- <div class="form-actions">
				<input type="button" class="btn btn-primary" onclick="printDiv('printableArea')" value="Print Report" />
				</div> -->
			</div>
			</div>
		</div>
</body>
<!-- <script type="text/javascript">
function printDiv(divName) {
    var printContents = document.getElementById(divName).innerHTML;
    var originalContents = document.body.innerHTML;

    document.body.innerHTML = printContents;

    window.print();

    document.body.innerHTML = originalContents;
}
</script> -->
</html>
<%    } catch (Exception e) {
        e.printStackTrace();
    }
%>