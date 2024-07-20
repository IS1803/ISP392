package com.mycompany.isp392.controllers;

import com.mycompany.isp392.category.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.UUID;

@MultipartConfig
public class EditCategoryController extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "images";
    private static final String ERROR = "AD_EditCategories.jsp";
    private static final String SUCCESS = "SearchCategoryController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        CategoryDAO categoryDAO = new CategoryDAO();
        CategoryError categoryError = new CategoryError();
        try {
            int categoryID = Integer.parseInt(request.getParameter("categoryID"));
            String newName = request.getParameter("categoryName");
            String newDescription = request.getParameter("description");
            int oldStatus = Integer.parseInt(request.getParameter("oldStatus"));
            int newStatus = Integer.parseInt(request.getParameter("status"));
            Part filePart = request.getPart("image");
            
            String imagePath;
            if (filePart != null && filePart.getSize() > 0) {
                String path = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
                File uploadDir = new File(path);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }

                String fileName = UUID.randomUUID().toString() + "_" + Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                imagePath = UPLOAD_DIRECTORY + File.separator + fileName;
                filePart.write(path + File.separator + fileName);
            } else {
                imagePath = request.getParameter("oldImage");
            }

            boolean checkCategory = categoryDAO.updateCategory(categoryID, newName, newDescription, newStatus, imagePath);
            if (checkCategory) {
                if (newStatus == 0 && oldStatus != newStatus) {
                    boolean checkChildren = categoryDAO.deleteAllChildren(categoryID);
                    if (checkChildren) {
                        
                        request.setAttribute("SUCCESS_MESSAGE", "CATEGORY UPDATED SUCCESSFULLY !");
                        url = SUCCESS;
                    } else {
                        categoryError.setError("UNABLE TO UPDATE INFORMATION !");
                        request.setAttribute("CATEGORY_ERROR", categoryError); 
                        return;
                    }
                } else {
                    request.setAttribute("SUCCESS_MESSAGE", "CATEGORY UPDATED SUCCESSFULLY !");
                    url = SUCCESS;
                }
            } else {
                categoryError.setError("UNABLE TO UPDATE INFORMATION !");
                request.setAttribute("CATEGORY_ERROR", categoryError);
            }
        } catch (Exception e) {
            log("Error at EditCategoryController: " + e.toString());
            request.setAttribute("ERROR", "Error updating category: " + e.getMessage());
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
