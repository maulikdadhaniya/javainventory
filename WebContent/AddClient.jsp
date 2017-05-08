<%@page import="com.minimouse.model.AddClient"%>
<%@page import="com.minimouse.dao.AddClientService"%>
<%@page import="com.minimouse.model.AddClient"%>
<%@page import="java.util.List"%>
<%@page import="com.minimouse.dao.AddClientService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	   pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="Cpanel/css.jsp" %>
<%@include file="Cpanel/js.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Client</title>

<style>
#main
{
margin-left:10px;
margin-right:10px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
    $('#add_client').DataTable({
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
						<h1>Client</h1>
					</div>
				</div>
				<div class="breadcrumbs">
					<ul>
						<li>
							<a href="MasterPage.jsp">Home</a>
							<i class="icon-angle-right"></i>
						</li>
						<li>
							<a href="AddClient.jsp">Client</a>
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
								<form action="AddClientServlet" method="POST" class='form-horizontal form-validate' id="bb">
								<%
								AddClient clientSession = (AddClient) session.getAttribute("client");
								%>
															
									<div class="control-group">
										<label for="textfield" class="control-label">First Name</label>
										<div class="controls">
											<input type="text" name="txtFirstName" value="<% if(clientSession != null)out.print(clientSession.getFirstName()); %>" id="txtFirstName" class="input-xlarge" data-rule-required="true" data-rule-minlength="2" required>
										</div>
									</div>
									<div class="control-group">
										<label for="textfield" class="control-label">Last Name</label>
										<div class="controls">
											<input type="text" name="txtLastName" value="<% if(clientSession != null)out.print(clientSession.getLastName()); %>" id="txtLastName" class="input-xlarge" data-rule-required="true" data-rule-minlength="2" required>
										</div>
									</div>
									<div class="control-group">
										<label for="emailfield" class="control-label">Email</label>
										<div class="controls">
											<input type="email" name="txtEmail" id="txtEmail" value="<% if(clientSession != null)out.print(clientSession.getEmail()); %>" class="input-xlarge" data-rule-email="true" data-rule-required="true" required>							
										</div>
									</div>
									<div class="control-group">
										<label for="pwfield" class="control-label">Password</label>
										<div class="controls">
											<input type="password" name="txtPassword" id="txtPassword" value="<% if(clientSession != null)out.print(clientSession.getPassword()); %>" class="input-xlarge" data-rule-required="true" required>
										</div>
									</div>
									<div class="control-group">
										<label for="textfield" class="control-label">Mobile Number</label>
										<div class="controls">
											<input type="tel" name="txtMobile" id="txtMobile" pattern='[0-9]{10}' maxlength='10' onkeypress='return event.charCode >= 48 && event.charCode <= 57' class="input-xlarge" 
											value="<% if(clientSession != null)out.print(clientSession.getMobileNumber()); %>" data-rule-required="true" data-rule-minlength="2" required>
										</div>
									</div>
									
									<div class="form-actions">
									<a href="AddClient.jsp">
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

							<div class="box-content nopadding">
								<table id="add_client"  class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
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
AddClientService objClientS = new AddClientService();
List<AddClient> objClient = objClientS.selectAll();
if(objClient != null)
{
	for(AddClient ob:objClient)
	{
 %>
									
										<tr>
											<td><%= ob.getId() %></td>
											<td><%= ob.getFirstName() %></td>
											<td><%= ob.getLastName() %></td>
											<td><%= ob.getEmail() %></td>
											<td><%= ob.getMobileNumber() %></td>
											<td><a href="AddClientServlet?id=<%=ob.getId()%>&flag=edit">Edit</a>
											<td><a href="AddClientServlet?id=<%=ob.getId()%>&flag=delete">Delete</a>
											
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