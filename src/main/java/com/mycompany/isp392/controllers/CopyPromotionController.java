package com.mycompany.isp392.controllers;

import com.mycompany.isp392.promotion.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "CopyPromotionController", urlPatterns = {"/CopyPromotionController"})
public class CopyPromotionController extends HttpServlet {

    private static final String ERROR = "AD_PromotionList.jsp";
    private static final String SUCCESS = "AD_EditPromotion.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        PromotionError error = new PromotionError();
        try {
            int promotionID = Integer.parseInt(request.getParameter("promotionID"));
            PromotionDAO dao = new PromotionDAO();
            PromotionDTO promotion = dao.getPromotionByID(promotionID);
            if (promotion != null) {
                request.setAttribute("PROMOTION", promotion);
                url = SUCCESS;
            } else {
                error.setError("UNABLE TO GET PROMOTION INFORMATION !");
                request.setAttribute("PROMOTION_ERROR", error);
            }
        } catch (Exception e) {
            log("Error at CopyPromotionController: " + e.toString());
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
