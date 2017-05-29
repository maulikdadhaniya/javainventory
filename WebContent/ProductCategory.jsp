<%@page import="com.minimouse.model.ProductCategory"%>
<%@page import="java.util.List"%>
<%@page import="com.minimouse.dao.ProductCategoryService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ProductCategory</title>

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
<script type="text/javascript">
$(document).ready(function() {
    $('#p_category').DataTable({
        dom: 'Bfrtip',
        buttons: [
            'excel', 'pdf','print'
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
						<h1>Product Category</h1>
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
					</ul>
				</div>
				<div class="row-fluid">
					<div class="span12">
						<div class="box">
							<div class="box-content">
								<form action="ProductCategoryServlet" method="POST"  class='form-horizontal form-validate' id="bb">
								<%
								ProductCategory pcSession = (ProductCategory) session.getAttribute("hdnProdCategory");
								%>
									<div class="control-group">
										<label for="textfield" class="control-label">Title</label>
										<div class="controls">
											<input type="text" name="txtTitle" value="<% if(pcSession != null)out.print(pcSession.getTitle()); %>" id="txtTitle" class="input-xlarge" data-rule-required="true" data-rule-minlength="2" required>
										</div>		
									</div>
									<div class="control-group">
										<label for="textfield" class="control-label">Description</label>
										<div class="controls">
											<input type="text" name="txtDescription" value="<% if(pcSession != null)out.print(pcSession.getDescription());%>" id="txtDescription" class="input-xlarge" data-rule-required="true" data-rule-minlength="2" required>
										</div>
									</div>									
									<div class="form-actions">
									<a href="ProductCategory.jsp">
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
						<div class="box box-color box-bordered">
						<table id="p_category"  class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>Id</th>
											<th>Title</th>
											<th>Description</th>
											<th>Edit</th>
											<th>Delete</th>
										</tr>
									</thead>
									<tbody>
<%
ProductCategoryService objPcs = new ProductCategoryService();
List<ProductCategory> pc = objPcs.selectAll();
if(pc != null)
{
	for(ProductCategory ob:pc)
	{
 %>
									
										<tr>
											<td><%= ob.getId() %></td>
											<td><%= ob.getTitle() %></td>
											<td><%= ob.getDescription() %></td>
											<td><a href="ProductCategoryServlet?id=<%=ob.getId()%>&flag=edit">Edit</a>
											<td><a href="ProductCategoryServlet?id=<%=ob.getId()%>&flag=delete">Delete</a>
											
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