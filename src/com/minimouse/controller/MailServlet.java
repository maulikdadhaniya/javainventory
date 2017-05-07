package com.minimouse.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.minimouse.dao.MailService;
import com.minimouse.model.AddNewAdmin;


@WebServlet("/MailServlet")
public class MailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MailService objMailService = new MailService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("txtMail");
		AddNewAdmin objMail = objMailService.findByEmail(email);

		final String fromEmail = "m.8866490355@gmail.com";
		final String password = "maulik@#1995";
		Properties props = new Properties();

		props.put("mail.smtp.auth", "true"); // enable authentication
		props.put("mail.smtp.starttls.enable", "true"); // enable STARTTLS
		props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP Host
		props.put("mail.smtp.port", "587"); // TLS Port

		Session session = Session.getDefaultInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(fromEmail, password);
			}
		});

		if (objMail != null && email.equals(objMail.getEmail())) {
			try {
				MimeMessage message = new MimeMessage(session);
				message.setFrom(new InternetAddress(fromEmail));
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(objMail.getEmail()));
				message.setSubject("Password");
				message.setText("Your Account Password is   " + objMail.getPassword());
				Transport.send(message);
				System.out.println("message sent successfully...");
				response.sendRedirect("Login.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else {
			request.getSession().setAttribute("Error", "Invalid EmailId");
			response.sendRedirect("ForgotPassword.jsp");
		}

	}

}
