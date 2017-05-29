<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="Cpanel/css.jsp" %>
<%@include file="Cpanel/js.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password</title>
	<link rel="shortcut icon" href="img/minimouse header.png" />
	<!-- Apple devices Homescreen icon -->
	<link rel="apple-touch-icon-precomposed" href="img/apple-touch-icon-precomposed.png" />
	</head>
<body class='login'>
<%
	if(session.getAttribute("loggedUserMail")==null)
	{
		response.sendRedirect("Login.jsp");
	}
%>
	<div class="wrapper">
		<h1><a href="Login.jsp"><img src="img/minimouse.png" alt="" class='retina-ready' width="59" height="49"><font face="Jura">Mini-Mouse</font></a></h1>
		<div class="login-body">
			<h2>Change Password</h2>
			<form action="ChangePasswordServlet" method='post' class='form-validate' id="test">				
<%
String value = (String)request.getSession().getAttribute("pass");
%>
<%if(value!=null){out.print(value);} %>				
				<div class="control-group">
					<div class="pw controls">
						<input type="password" name="txtPaswsword" placeholder="Old Password" class='input-block-level' data-rule-required="true">
					</div>
				</div>
				<div class="control-group">
					<div class="pw controls">
						<input type="password" name="txtNewPassword" placeholder="New Password" class='input-block-level' data-rule-required="true">
					</div>
				</div>
				<div class="control-group">
					<div class="pw controls">
						<input type="password" name="txtConfirmPassworm" placeholder="Confirm Password" class='input-block-level' data-rule-required="true" data-rule-equalTo="#txtNewPassword">
					</div>
				</div>
				<div class="submit" style="padding-bottom: 15px; padding-right: 130px;">
					<input type="submit" value="Submit" class='btn btn-primary'>
				
				</div>
				
			</form>
		</div>
	</div>
</body>
</html>