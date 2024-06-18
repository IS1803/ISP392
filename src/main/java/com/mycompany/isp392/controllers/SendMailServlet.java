
package com.mycompany.isp392.controllers;

import com.mycompany.isp392.support.ProcessSupportDTO;
import com.mycompany.isp392.support.SupportDAO;
import com.mycompany.isp392.support.SupportDTO;
import com.mycompany.isp392.user.EmployeeDTO;

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

@WebServlet(name = "SendMailServlet", urlPatterns = { "/SendMailServlet" })
public class SendMailServlet extends HttpServlet {
    private static final String ERROR = "ReplySupport.jsp";
    private static final String SUCCESS = "support.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SendMailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SendMailServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        String url = ERROR;
        HttpSession sessionCur = request.getSession();

        String toEmail = request.getParameter("toEmail");
        String subject = request.getParameter("subject");
        String messageBody = request.getParameter("content");

        // Sender's email and password
        final String fromEmail = "micomicomun@gmail.com";
        final String password = "ezox gkgv joqr mbwx";

        // Set up mail server properties
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        // Get the Session object
        Session session = Session.getInstance(props,
                new jakarta.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(fromEmail, password);
                    }
                });

        try {
            int custID = Integer.parseInt(request.getParameter("custID"));
            EmployeeDTO edto = (EmployeeDTO) sessionCur.getAttribute("EMPLOYEE");
            int supportID = Integer.parseInt(request.getParameter("supportID"));
            // Create a default MimeMessage object
            Message message = new MimeMessage(session);

            // Set From: header field of the header
            message.setFrom(new InternetAddress(fromEmail));

            // Set To: header field of the header
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(toEmail));

            // Set Subject: header field
            message.setSubject(subject);

            // Now set the actual message
            message.setText(messageBody);

            // Send message
            Transport.send(message);

            sessionCur.setAttribute("MAIL", "We have recieved your request. Happy shopping!");
            // Forward to a success page
            // Support status update "Done"
            SupportDAO spdao = new SupportDAO();
            ProcessSupportDTO spdto = new ProcessSupportDTO(edto.getEmpID(), supportID, messageBody,
                    (java.sql.Date) new java.util.Date());
            String status = spdao.supportStatusUpdate(custID);
            ProcessSupportDTO spdtos = spdao.addReplyHistory(spdto);
            url = SUCCESS;
            
            sessionCur.setAttribute("SUPPORT_STATUS", status);
            sessionCur.setAttribute("PROCESS_SUPPORT", spdtos);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);

        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
