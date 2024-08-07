/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.isp392.controllers;

import com.mycompany.isp392.category.*;
import com.mycompany.isp392.user.UserDTO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.DbUtils;

/**
 *
 * @author TTNHAT
 */
@WebServlet(name = "DeleteChildrenCategoryController", urlPatterns = {"/DeleteChildrenCategoryController"})
public class DeleteChildrenCategoryController extends HttpServlet {

    //fill out
    private static final String ERROR = "AD_ChildrenCategory.jsp";
    private static final String SUCCESS = "SearchChildrenCategoryController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        CategoryDAO dao = new CategoryDAO();
        CategoryError error = new CategoryError();
        try {
            int cdCategoryID = Integer.parseInt(request.getParameter("cdCategoryID"));
            int parentID = dao.getParentID(cdCategoryID);
            
            HttpSession session = request.getSession();
            session.setAttribute("PARENT_CATEGORY_ID", parentID);
            boolean checkDelete = dao.deleteChildrenCategory(cdCategoryID);
            if (checkDelete) {
                List<String> oldList = new ArrayList<>();
                List<String> newList = new ArrayList<>();
                UserDTO user = (UserDTO) request.getSession().getAttribute("LOGIN_USER");

                oldList.add("Status: " + String.valueOf(1));
                newList.add("Status: " + String.valueOf(0));

                boolean isCD = true;
                ManageCategoryDTO manageCategory = new ManageCategoryDTO(cdCategoryID, user.getUserID(), oldList, newList, "Delete", isCD);
                DbUtils.addCheckLogToDB("ManageCDCategories", "CDCategoryID", manageCategory);

                request.setAttribute("SUCCESS_MESSAGE", "CHILDREN CATEGORY DELETED SUCCESSFULLY !");
                url = SUCCESS;
            } else {
                error.setError("UNABLE TO DELETE CHILDREN CATEGORY !");
                request.setAttribute("CHILDREN_CATEGORY_ERROR", error);
            }
        } catch (Exception e) {
            log("Error at DeleteChildrenCategoryController: " + e.toString());
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
