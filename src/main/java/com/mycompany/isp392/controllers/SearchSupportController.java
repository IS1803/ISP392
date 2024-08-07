package com.mycompany.isp392.controllers;

import java.io.IOException;

import com.mycompany.isp392.support.SupportDAO;
import com.mycompany.isp392.support.SupportDTO;
import com.mycompany.isp392.user.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SearchSupportController", urlPatterns = {"/SearchSupportController"})
public class SearchSupportController extends HttpServlet {

    private static final String ERROR = "AD_SupportList.jsp";
    private static final String SUCCESS = "AD_SupportList.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String search = request.getParameter("search");
            UserDAO userDAO = new UserDAO();
            SupportDAO supportDAO = new SupportDAO();
            List<UserDTO> userList = new ArrayList<>();
            List<SupportDTO> supportList = supportDAO.searchSupport(search);
            if (supportList.size() > 0) {
                for (SupportDTO support : supportList) {
                    UserDTO user = userDAO.getUserInfo(support.getSupportID());
                    userList.add(user);
                }
                request.setAttribute("USER_LIST", userList);
                request.setAttribute("LIST_SUPPORT", supportList);
                request.setAttribute("MESSAGE", "SUPPORT FOUND !");
                url = SUCCESS;
            } else {
                request.setAttribute("MESSAGE", "NO SUPPORT FOUND !");
            }
        } catch (Exception e) {
            log("Error at SearchSupportController: " + e.toString());
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
