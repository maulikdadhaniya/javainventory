<%@page import="com.minimouse.model.AddNewAdmin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="Cpanel/css.jsp" %>				
<%@include file="Cpanel/js.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
	<link rel="shortcut icon" href="img/favicon.ico" />
	<!-- Apple devices Homescreen icon -->
	<link rel="apple-touch-icon-precomposed" href="img/apple-touch-icon-precomposed.png" />
	
</head>
<body>
<body class='login'>
	<div class="wrapper">
		<h1><a href="login.jsp"><img src="img/logo-big.png" alt="" class='retina-ready' width="59" height="49">Mini-Mouse</a></h1>
		<div class="login-body">
			<h2>SIGN IN</h2>
			<form action="LoginServlet" method='post' class='form-validate' id="test">
<%-- <%
Cookie cookie[] = request.getCookies();
Cookie cookie2 = null;
if(cookie != null)
{
	for(int i = 0; i < cookie.length; i++)
	{
		cookie2 = cookie[i];
	}
}
%> --%>
<%
String error = (String)request.getSession().getAttribute("error");
%>
<%if(error != null){out.print(error);} %>
				<div class="control-group">
					<div class="email controls">
						<input type="text" id="txtEmail" name="txtEmail" value="" placeholder="Email" class='input-block-level' data-rule-required="true">
					</div>
				</div>
				<div class="control-group">
					<div class="pw controls">
						<input type="password" name="txtPassword" id="txtPassword" placeholder="Password" class='input-block-level' data-rule-required="true">
					</div>
				</div>
				<div class="submit">
					
					<input type="submit" value="Sign in" id="submit" onclick="validate()"; class='btn btn-primary'>
				</div>
			</form>
			<div class="forget">
				<span> <a href="" onclick="temp();" id="tmpfp">Forgot password?</a></span>
			</div>
		</div>
	</div>
</body>
</body>
</html>