<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="Cpanel/css.jsp"%>
<%@include file="Cpanel/js.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forgot Password</title>
<link rel="shortcut icon" href="img/favicon.ico" />
<!-- Apple devices Homescreen icon -->
<link rel="apple-touch-icon-precomposed"
	href="img/apple-touch-icon-precomposed.png" />
</head>
<body>
<body class='login'>
	<div class="wrapper">
		<h1>
			<a href="Login.jsp"><img src="img/logo-big.png" alt=""
				class='retina-ready' width="59" height="49">Mini-Mouse</a>
		</h1>
		<div class="login-body">
			<h2>Forgot Password</h2>
			<form action="MailServlet" method="post" class='form-validate'
				id="test">
				<%
					String s = (String) session.getAttribute("Error");
					if (s != null) {
						out.print(s);
					}
				%>

				<div class="control-group">
					<div class="email controls">
						<input type="text" name='txtMail' placeholder="Email address"
							class='input-block-level' data-rule-required="true"
							data-rule-email="true" required>
					</div>
				</div>
				<div class="submit"
					style="padding-bottom: 15px; padding-right: 130px;">
					<input type="submit" value="Submit" class='btn btn-primary'>
				</div>
			</form>
		</div>
	</div>
</body>

</body>
</html>