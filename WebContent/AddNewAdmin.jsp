<%@page import="com.minimouse.model.AddNewAdmin"%>
<%@page import="java.util.List"%>
<%@page import="com.minimouse.dao.AddNewAdminService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	   pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="Cpanel/css.jsp" %>
<%@include file="Cpanel/js.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>

<style>
#main
{
margin-left:10px;
margin-right:10px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
    $('#new_admin').DataTable({
        dom: 'Bfrtip',
        buttons: [
            'excel', 'pdf'
        ]
    });
} );
</script>
</head>
<body>
<%@include file="Cpanel/header.jsp" %>	
		<div id="main">
			<div class="container-fluid">
				<div class="page-header">
					<div class="pull-left">
						<h1>Admin</h1>
					</div>
				</div>
				<div class="breadcrumbs">
					<ul>
						<li>
							<a href="MasterPage.jsp">Home</a>
							<i class="icon-angle-right"></i>
						</li>
						<li>
							<a href="AddNewAdmin.jsp">Admin</a>
							<i class="icon-angle-right"></i>
						</li>
					</ul>
					<div class="close-bread">
						<a href="#"><i class="icon-remove"></i></a>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span12">
						<div class="box">
							<div class="box-content">
								<form action="AddNewAdminServlet" method="POST" class='form-horizontal form-validate' id="bb">	
								<%
								AddNewAdmin adminSession = (AddNewAdmin) session.getAttribute("admin");
								%>						
									<div class="control-group">
										<label for="textfield" class="control-label">First Name</label>
										<div class="controls">
											<input type="text" name="txtFirstName" id="txtFirstName" value="<% if(adminSession != null)out.print(adminSession.getFirstName()); %>" class="input-xlarge" data-rule-required="true" data-rule-minlength="2" required>
										</div>
									</div>
									<div class="control-group">
										<label for="textfield" class="control-label">Last Name</label>
										<div class="controls">
											<input type="text" name="txtLastName" id="txtLastName" value="<% if(adminSession != null)out.print(adminSession.getLastName()); %>" class="input-xlarge" data-rule-required="true" data-rule-minlength="2" required>
										</div>
									</div>
									<div class="control-group">
										<label for="emailfield" class="control-label">Email</label>
										<div class="controls">
											<input type="email" name="txtEmail" id="txtEmail" value="<% if(adminSession != null)out.print(adminSession.getEmail()); %>" class="input-xlarge" data-rule-email="true" data-rule-required="true" required>							
										</div>
									</div>
									<div class="control-group">
										<label for="pwfield" class="control-label">Password</label>
										<div class="controls">
											<input type="password" name="txtPassword" id="txtPassword" value="<% if(adminSession != null)out.print(adminSession.getPassword()); %>" class="input-xlarge" data-rule-required="true" required>
										</div>
									</div>
									<div class="control-group">
										<label for="textfield" class="control-label">Mobile Number</label>
										<div class="controls">
											<input type="tel" pattern='[0-9]{10}' name="txtMobile" id="txtMobile"  maxlength='10' onkeypress='return event.charCode >= 48 && event.charCode <= 57'
											value="<% if(adminSession != null)out.print(adminSession.getMobileNumber()); %>" class="input-xlarge" data-rule-required="true" data-rule-minlength="2" required>
										</div>
									</div>
									
									<div class="form-actions">
									<a href="AddNewAdmin.jsp">
										<input type="submit" class="btn btn-primary" value="Submit">
										<button type="button" href="AddNewAdmin.jsp" class="btn">Cancel</button>
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
								 <table id="new_admin"  class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>Id</th>
											<th>First Name</th>
											<th>Last Name</th>
											<th>Email</th>
											<th>Mobile Number</th>
											<th>Edit</th>
											<th>Delete</th>
										</tr>
									</thead>
									<tbody>
<%
AddNewAdminService objAdminService = new AddNewAdminService();
List<AddNewAdmin> objAdmin = objAdminService.selectAll();
if(objAdmin != null)
{
	for(AddNewAdmin ob:objAdmin)
	{
 %>
									
										<tr>
											<td><%= ob.getId() %></td>
											<td><%= ob.getFirstName() %></td>
											<td><%= ob.getLastName() %></td>
											<td><%= ob.getEmail() %></td>
											<td><%= ob.getMobileNumber() %></td>
											<td><a href="AddNewAdminServlet?id=<%=ob.getId()%>&flag=edit">Edit</a>
											<td><a href="AddNewAdminServlet?id=<%=ob.getId()%>&flag=delete">Delete</a>
											
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

</body>
</html>