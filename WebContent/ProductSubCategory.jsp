
<%@page import="com.minimouse.model.ProductSubCategory"%>
<%@page import="java.util.List"%>
<%@page import="com.minimouse.dao.ProductSubCategoryService"%>
<%@page import="com.minimouse.model.ProductCategory"%>
<%@page import="com.minimouse.dao.ProductCategoryService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ProductSubCategory</title>
<%@include file="Cpanel/css.jsp" %>
<%@include file="Cpanel/js.jsp" %>
	<link rel="shortcut icon" href="img/favicon.ico" />
	<!-- Apple devices Homescreen icon -->
	<link rel="apple-touch-icon-precomposed" href="img/apple-touch-icon-precomposed.png" />
	<style>
#main																								
{																															
margin-left:5px;																										
margin-right:5px;																								
}
</style>
<script type="text/javascript">
$(document).ready(function() {
    $('#add_sub').DataTable({
        dom: 'Bfrtip',
        buttons: [
            'excel', 'pdf' ,'print'
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
						<h1>Product Details</h1>
					</div>
				</div>
				<div class="breadcrumbs">
					<ul>
						<li>
							<a href="MasterPage.jsp">Home</a>
							<i class="icon-angle-right"></i>
						</li>
						<li>
							<a href="ProductCategory.jsp">Product Category</a>
							<i class="icon-angle-right"></i>
						</li>
						<li>
							<a href="ProductSubCategory.jsp">Product Details</a>
							<i class="icon-angle-right"></i>
						</li>
					</ul>
				</div>
				<div class="row-fluid">
					<div class="span12">
						<div class="box">
							<div class="box-content">
								<form action="ProductSubCategoryServlet" method="POST" class='form-horizontal form-validate' id="bb">
								<%
								ProductSubCategory pcSession = (ProductSubCategory) session.getAttribute("hdnProdSubCategory");
								
								%>
									<div class="control-group">
										<label for="textfield" class="control-label">Product Category</label>
										<div class="controls">
											<select name="categoryDrop" id="categoryDrop" required  default="<% if(pcSession != null)out.print(pcSession.getCategoryDesc()); %>" required>
												<option value="">-- Please Select --</option>
<% 
ProductSubCategoryService objPcs = new ProductSubCategoryService();
List<ProductCategory> pc = objPcs.selectAllCategory();

	for(int i=0;i<pc.size();i++)
	{ 
		pc.get(i).getId();
 %> <option value=<%=pc.get(i).getId()%>><%=pc.get(i).getTitle()%></option>
<% 	
 } 
%>	

											</select>
										</div>
									</div>
					
									<div class="control-group">
										<label for="textfield" class="control-label">Title</label>
										<div class="controls">
											<input type="text" name="txtTitle" id="txtTitle" value="<% if(pcSession != null)out.print(pcSession.getTitle());%>" class="input-xlarge" data-rule-required="true" data-rule-minlength="2" required>
										</div>
									</div>
									<div class="control-group">
										<label for="textfield" class="control-label">Description</label>
										<div class="controls">
											<input type="text" name="txtDescription" id="txtDescription" value="<% if(pcSession != null)out.print(pcSession.getDescription());%>" class="input-xlarge" data-rule-required="true" data-rule-minlength="2" required>
										</div>
									</div>
									<div class="control-group">
										<label for="textfield" class="control-label">Price</label>
										<div class="controls">
											<input type="number" name="txtPrice" id="txtPrice" value="<% if(pcSession != null)out.print(pcSession.getPrice()); %>" class="input-xlarge" data-rule-required="true" data-rule-minlength="2" required>
										</div>
									</div>
									<div class="control-group">
										<label for="textfield" class="control-label">Quantity</label>
										<div class="controls">
											<input type="number" name="txtQuantity" id="txtQuantity" value="<% if(pcSession != null)out.print(pcSession.getQuantity()); %>" class="input-xlarge" data-rule-required="true" data-rule-minlength="2" required>
										</div>
									</div>
									
								
									<div class="form-actions">
									<a href="ProductSubCategory.jsp">
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
				<div class="row-fluid">
					<div class="span12">
							
								 <table id="add_sub"  class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>Id</th>
											<th>Category</th>
											<th>Title</th>
											<th>Description</th>
											<th>Price</th> 
											<th>Quantity</th>
											<th>Edit</th>
											<th>Delete</th>
										</tr>
									</thead>
									<tbody>
<% ProductSubCategoryService objSubPcs = new ProductSubCategoryService();
List<ProductSubCategory> subPc = objSubPcs.selectAll();
if(subPc != null)
{
	for(ProductSubCategory ob:subPc)
	{
 %>
									
										<tr>
											<td><%= ob.getId() %></td>
											<td><%= ob.getCategoryDesc() %></td>
											<td><%= ob.getTitle() %></td>
											<td><%= ob.getDescription() %></td>
											<td><%= ob.getPrice() %></td> 
											<td><%= ob.getQuantity() %></td> 
											<td><a href="ProductSubCategoryServlet?id=<%=ob.getId()%>&flag=edit">Edit</a>
											<td><a href="ProductSubCategoryServlet?id=<%=ob.getId()%>&flag=delete">Delete</a>
											
										</tr>
									
									<%
	}
}
%>
								</tbody>
								</table>
							
						</div>
					</div>
				</div>
		</div>
</body>
</html>