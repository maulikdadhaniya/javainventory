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
<link rel="shortcut icon" href="img/minimouse header.png" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Purchase Order</title>

<style>
#main
{
margin-left:10px;
margin-right:10px;
}
</style>
<style type="text/css">
body{
line-height: 1em !important;
}
.box-bottom{
	padding: 0px 0 !important;
}
input[type="text"]{
width: 100% !important;
}
.box-gray i {
    margin-bottom: 0px !important;
}
.print{
	color:#B3992D !important;
}
.print_order{
padding:5px !important;
font-family: monospace;
}
td,th{
padding:3px !important;
}
.order_header{
font-size:20px !important;
font-weight:bold !important;
}
.header_l{
font-size:14px !important;
font-weight:bold !important;
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
					<center><div class="pull-left">
						
					</div>
					</center>
				</div>
				<div id="printableArea">
					<c:set var="invoice" value="${invoice}" />
				<section id="content">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="row">
					<div class="col-lg-2"></div>
					<div class="col-lg-8">
						<div class="box">
							<i class='fa fa-print fa-1x print' id="bill_print" onClick="pop_print()" style="cursor:pointer" title="Print"></i>
							<div class="box-gray aligncenter">
							
							<div class="print_order" align="center"><br>
							<div class="print_area">
							  
							  <center>
							  <table cellspacing="0" cellpadding="5" border="1" class="order_table">
                                <col width="96" span="2">
                                <col width="152">
                                <col width="96" span="2">
                                <col width="82">
                               
                                <tr height="10"> 
								<td colspan="7" style="border-bottom-style:hidden !important;"><center><b><h3>INVOICE</h3></b></center></td>
								</tr>   
								<tr height="30"> 
								<td colspan="7" style="border-top-style:hidden !important;">
								<br>
								  <div style="width: 49%; float: left;font-size: 11px !important;">
								  
                                <h3> MINI-MOUSE</h3><br>
                                  EmailId &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: maulik.dadhaniya@gmail.com<br>
                                  Contect No&nbsp;&nbsp;&nbsp;: 8866490355   
								  </div>
								  
								</td>
								</tr>        
                                <tr height="10" >
                                  <td colspan="7" height="10" style="border-left-style:hidden !important;border-right-style:hidden !important;" ></td>
                                </tr>
                                <tr height="30">
                                  <td colspan="4" height="30" rowspan="2" style="vertical-align:middle"><span class="header_l"><strong>M/s :</strong></span>  ${invoice.firstName}   ${invoice.lastName}</td>
                                  
                                  <td nowrap="nowrap" height="15"><span class="header_l"><strong>Sales Order No:</strong></span></td>
                                  <td colspan="2">${invoice.invoiceNo}</td>
                                </tr>                        

                                <tr height="20">
                                  
                                  <td><span class="header_l" height="15"><strong>Date:</strong></span></td>
                                  <td colspan="2">${invoice.invoiceDate}</td>
                                </tr>
                                
                            	<tr height="10" >
                                  <td colspan="7" height="10" style="border-left-style:hidden !important;border-right-style:hidden !important;" ></td>
                                </tr>
                                
                                <tr height="20">
                                  <td><span class="header_l" height="20"><center>No.</center></span></td>
								  <td colspan="3" ><span class="header_l"><center>Description</center></span></td>
                                  <td><span class="header_l"><center>Quantity</center></span></td>
								  <td nowrap="nowrap"><span class="header_l"><center>Unit Price</center></span></td>
                                  <td><span class="header_l"><center>Amount</center></span></td>
                                </tr>
                                <tr height="20">
                                  <td align="right">1</td>
                                  <td height="20" colspan="3" width="344">${invoice.productName}</td>
                                  <td align="right">${invoice.quantity}</td>
								  <td align="right">${invoice.priceOfOneQnty}</td>
                                  <td align="right">${invoice.total}</td>
                                </tr>
								
								<tr height="25">
                                  <td colspan="7" height="25"></td>
                                </tr>
								
                              
								
								
								<tr height="20">
								  <td  colspan='4' ></td>
                                  <td colspan="2" ><span class="header_l"><strong>Net Amount<span style="float:right">: </span></strong></span></td>
								  
                                  <td align="right"> ${invoice.total}</td>
                                </tr>
								
								<tr height="25">
                                  <td colspan="7" height="13"></td>
                                </tr>
                                
                 
                                <tr height="10" >
                                  <td colspan="7" height="10" style="border-left-style:hidden !important;border-right-style:hidden !important;" ></td>
                                </tr>

                                <tr height="20">
                                  <td colspan="7" height="10" style="font-size: 11px !important;vertical-align: top;border-bottom-style:hidden !important;"> 
                                  <span style="vertical-align: top;">Please sign & Return the second copy in acknowledgment of having received the materials in good condition.
								  </span>
                                  </td>
                                </tr>
                                 <tr height="20">
                                  <td colspan="7" height="10" style="font-size: 11px !important;vertical-align: top;border-top-style:hidden !important;">
                                  <br> <br> 
                                  <span style="vertical-align: bottom;">
                                  
								 
								  </span>
								  </span>
                                  </td>
                                </tr>
                              </table>
                              
							  </center>
							</div>
							</div>
							
							</div>
						</div>
					</div>
					
				</div>
				<div class="col-lg-2"></div>
			</div>
		</div>
		
		<!-- divider -->
		
		<!-- end divider -->
		</div>
	</section>
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