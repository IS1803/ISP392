/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.isp392.controllers;

import com.mycompany.isp392.brand.ManageBrandDTO;
import com.mycompany.isp392.user.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import utils.DbUtils;

@WebServlet(name = "DeleteUserController", urlPatterns = {"/DeleteUserController"})
public class DeleteUserController extends HttpServlet {

    private static final String ERROR = "SearchUserController";
    private static final String SUCCESS = "SearchUserController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        UserDAO dao = new UserDAO();
        UserError userError = new UserError();
        boolean checkValidation = true;
        try {
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            int empID = loginUser.getUserID();
            int UserID = Integer.parseInt(request.getParameter("UserID"));
            int oldStatus = Integer.parseInt(request.getParameter("status"));
            int roleID = Integer.parseInt(request.getParameter("roleID"));

            if (loginUser.getUserID() == UserID) {
                userError.setUserIDError("You cannot delete your own account.");
                checkValidation = false;
            }

            String action = request.getParameter("delete");
            ManageUserDTO manage = null;
            
            if (checkValidation) {
                int newStatus = dao.deleteUser1(UserID);
//                if (checkDelete) {
//                    request.setAttribute("SUCCESS_MESSAGE", "USER DELETED SUCCESSFULLY !");
//                    url = SUCCESS;
//                } else {
//                    userError.setError("UNABLE TO DELETE USER !");
//                    request.setAttribute("DELETE_ERROR", userError);
//                }

                if (newStatus != -1) {
                    List<String> oldList = new ArrayList<>();
                    List<String> newList = new ArrayList<>();
                    oldList.add(String.valueOf("Status: " + oldStatus));
                    newList.add(String.valueOf("Status: " + newStatus));
                    manage = new ManageUserDTO(UserID, empID, oldList, newList, action);
                    if(roleID != 4) {
                    boolean checkAdd = DbUtils.addCheckLogToDB("SuperviseEmployees", "UserID", manage);
                    } else {
                    boolean checkAdd = DbUtils.addCheckLogToDB("SuperviseCustomers", "UserID", manage);    
                    }
                    request.setAttribute("SUCCESS_MESSAGE", "USER DELETED SUCCESSFULLY !");
                    url = SUCCESS;
                } else {
                    userError.setError("UNABLE TO DELETE USER !");
                    request.setAttribute("DELETE_ERROR", userError);
                }
            } else {
                request.setAttribute("DELETE_ERROR", userError);
            }
        } catch (Exception e) {
            log("Error at DeleteUserController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
