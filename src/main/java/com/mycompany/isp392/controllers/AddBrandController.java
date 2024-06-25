package com.mycompany.isp392.controllers;

import com.mycompany.isp392.brand.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;

public class AddBrandController extends HttpServlet {

    private static final String ERROR = "brand.jsp";
    private static final String SUCCESS = "brand.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        BrandError brandError = new BrandError();
        boolean checkValidation = true;

        try {
            String brandName = request.getParameter("brandName");
            BrandDAO brandDAO = new BrandDAO();
            if (brandDAO.checkBrandExists(brandName)) {
                brandError.setBrandNameError("Brand Name already exists.");
                checkValidation = false;
            }
            if (checkValidation) {
                boolean check = brandDAO.addBrand(brandName);
                if (check) {
                    request.setAttribute("MESSAGE", "BRAND ADDED SUCCESSFULLY !");
                    url = SUCCESS;
                } else {
                    brandError.setError("UNABLE TO ADD BRAND TO DATABASE !");
                    request.setAttribute("BRAND_ERROR", brandError);
                }
            } else {
                request.setAttribute("BRAND_ERROR", brandError);
            }
        } catch (SQLException e) {
            log("Error at AddBrandController: " + e.toString());
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