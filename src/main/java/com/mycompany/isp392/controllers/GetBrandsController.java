package com.mycompany.isp392.controllers;

import com.mycompany.isp392.brand.BrandDAO;
import com.mycompany.isp392.brand.BrandDTO;
import com.mycompany.isp392.category.CategoryDAO;
import com.mycompany.isp392.category.ChildrenCategoryDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

public class GetBrandsController extends HttpServlet {

    private static final String BRAND_PAGE = "AD_ManageBrands.jsp";
    private static final String ADD_PRODUCT_PAGE = "AD_CreateProduct.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = BRAND_PAGE;

        try {
            HttpSession session = request.getSession();
            BrandDAO dao = new BrandDAO();
            CategoryDAO categoryDAO = new CategoryDAO();
            
            List<BrandDTO> brands = dao.getAllBrands();
            List<ChildrenCategoryDTO> categories = categoryDAO.getListCDCategory();

            // Filter active brands
            List<BrandDTO> activeBrands = brands.stream()
                    .filter(brand -> brand.getStatus() == 1)
                    .collect(Collectors.toList());

            // Filter active categories
            List<ChildrenCategoryDTO> activeCategories = categories.stream()
                    .filter(category -> category.getStatus() == 1)
                    .collect(Collectors.toList());

            session.setAttribute("BRAND_LIST", brands);
            request.setAttribute("ACTIVE_BRAND_LIST", activeBrands);
            request.setAttribute("BRAND_LIST", brands);

            if ("AddProductPage".equals(request.getParameter("ProductPage")) || request.getAttribute("PRODUCT_ERROR") != null) {
                request.setAttribute("CATEGORY_LIST", activeCategories);
                url = ADD_PRODUCT_PAGE;
            } else {
                url = BRAND_PAGE;
            }
        } catch (Exception e) {
            log("Error at LoadBrandsController: " + e.toString());
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
