/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.isp392.controllers;

import java.io.IOException;
import java.io.PrintWriter;

import com.mycompany.isp392.forgetpassword.ForgetPasswordDAO;
import com.mycompany.isp392.forgetpassword.ForgetPasswordDTO;
import com.mycompany.isp392.forgetpassword.ForgetPasswordErrors;
import com.mycompany.isp392.user.UserDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author notlongfen
 */
@WebServlet(name = "VerifyToken", urlPatterns = {"/VerifyToken"})
public class VerifyToken extends HttpServlet {

    private static final String ERROR = "US_CreateNewPassword.jsp";
    private static final String SUCCESS = "US_SignIn.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        ForgetPasswordErrors error = new ForgetPasswordErrors();
        try {
            String token = request.getParameter("token");
            String newPassword = request.getParameter("newPassword");

            ForgetPasswordDAO dao = new ForgetPasswordDAO();
            UserDAO userDAO = new UserDAO();
            ForgetPasswordDTO dto = dao.checkToken(token);
            if (dto != null) {
                if (userDAO.resetPassword(userDAO.getUserInfoByUserID(dto.getUserID()).getEmail(), newPassword)) {
                    dao.invalidateToken(token);
                    url = SUCCESS;
                } else {
                    error.setError("Reset password failed");
                    request.setAttribute("ERROR", error);
                }
            } else {
                error.setError("Token is invalid");
                request.setAttribute("ERROR", error);
            }

        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        } finally {
            response.sendRedirect(url);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

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
