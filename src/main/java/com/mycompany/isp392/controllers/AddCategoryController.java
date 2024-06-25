
package com.mycompany.isp392.controllers;

import com.mycompany.isp392.category.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "AddCategoryController", urlPatterns = {"/AddCategoryController"})
public class AddCategoryController extends HttpServlet {

    //temp
    private static final String ERROR = "addCategory.jsp";
    private static final String SUCCESS = "login.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        CategoryDAO dao = new CategoryDAO();
        boolean checkValidation = true;
        CategoryError categoryError = new CategoryError();
        try {
            String categoryName = request.getParameter("categoryName");
            String description = request.getParameter("description");
            
            if(dao.checkCategoryDuplicate(categoryName)){
                categoryError.setCategoryNameError("This category already exists.");
                checkValidation = false;
            }
            
            if(checkValidation){
                int categoryID = dao.getLatestCategoryID() + 1;
                CategoryDTO category = new CategoryDTO(categoryID, categoryName, description, 1);
                boolean checkCategory = dao.addCategory(category);
                if(checkCategory){
                   request.setAttribute("MESSAGE", "BRAND ADDED SUCCESSFULLY !");
                    url = SUCCESS;
                }else {
                    categoryError.setError("UNABLE TO ADD CATEGORY TO DATABASE !");
                    request.setAttribute("CATEGORY_ERROR", categoryError);
                }
            }else{
                request.setAttribute("CATEGORY_ERROR",categoryError);
            }
            
        } catch (Exception e) {
            log("Error at AddCategoryController: " + e.toString());
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