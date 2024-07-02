package com.mycompany.isp392.controllers;

import com.mycompany.isp392.forgetpassword.*;
import com.mycompany.isp392.support.*;
import com.mycompany.isp392.user.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import jakarta.mail.MessagingException;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "SendMailServlet", urlPatterns = {"/SendMailServlet"})
public class SendMailServlet extends HttpServlet {

    private static final String ERROR = "SendMailError.jsp";
    private static final String ERROR_FORGOT_PASSWORD = "US_ForgotPassword.jsp";
    private static final String SUCCESS_FORGOT_PASSWORD = "NotificationMail.jsp";
    private static final String ERROR_REPLY_SUPPORT = "AD_ReplySupport.jsp";
    private static final String SUCCESS_REPLY_SUPPORT = "GetSupportListController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
            HttpSession sessionCur = request.getSession();
            String action = request.getParameter("action");
            String url = ERROR;

            if ("Forgot_Password".equals(action)) {
                url = processForgotPassword(request, response);
            } else if ("Reply_Support".equals(action)) {
                url = processReplySupport(request, response, sessionCur);
            }
            response.sendRedirect(url);
    }

        

    private boolean sendEmail(String toEmail, String subject, String messageBody) {
        final String fromEmail = "micomicomun@gmail.com";
        final String password = "ezox gkgv joqr mbwx";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new jakarta.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject(subject);
            message.setText(messageBody);
            Transport.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }

    private String processForgotPassword(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String toEmail = request.getParameter("toEmail");
        String subject;
        String messageBody;
        ForgetPasswordErrors error = new ForgetPasswordErrors();
        String url = ERROR_FORGOT_PASSWORD;
        try {

            UserDAO dao = new UserDAO();
            ForgetPasswordDAO fpdao = new ForgetPasswordDAO();
            int userID = dao.checkEmailExists(toEmail);
            if (userID != -1) {
                request.setAttribute("USER_ID", userID);
                boolean check = fpdao.insertToken(userID);
                if (check) {
                    ForgetPasswordDTO dto = fpdao.getAllInfoByUserID(userID);
                    subject = "Reset Password";
                    messageBody = "Click the link below to reset your password: http://localhost:8080/ISP392/US_CreateNewPassword.jsp?token="
                            + dto.getToken();

                    boolean result = sendEmail(toEmail, subject, messageBody);
                    if (result) {
                        url = SUCCESS_FORGOT_PASSWORD;
                    }
                } else {
                    error.setError("Insert token failed.");
                    request.setAttribute("ERROR", error);
                }
            } else {
                error.setError("Email does not exist.");
                request.setAttribute("ERROR", error);
            }

        } catch (Exception e) {
            error.setError("FAIL TO SEND MAIL.");
            e.printStackTrace();
        } 
        return url;
    }

    private String processReplySupport(HttpServletRequest request, HttpServletResponse response, HttpSession sessionCur) {
        String toEmail = request.getParameter("toEmail");
        String subject = request.getParameter("subject");
        String messageBody = request.getParameter("replyMessage");
        String url = ERROR_REPLY_SUPPORT;

        boolean result = sendEmail(toEmail, subject, messageBody);
        if (result) {
            try {
                UserDTO edto = (UserDTO) sessionCur.getAttribute("LOGIN_USER");

                int supportID = Integer.parseInt(request.getParameter("supportID"));
                SupportDAO spdao = new SupportDAO();
                ProcessSupportDTO spdto = new ProcessSupportDTO(edto.getUserID(), supportID, messageBody, subject, new java.sql.Date(System.currentTimeMillis()));
                String status = spdao.supportStatusUpdate(supportID);
                if (!"Not Yet".equals(status)) {
                    ProcessSupportDTO spdtos = spdao.addReplyHistory(spdto);
                    sessionCur.setAttribute("SUPPORT_STATUS", status);
                    sessionCur.setAttribute("PROCESS_SUPPORT", spdtos);
                    url = SUCCESS_REPLY_SUPPORT;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return url;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
