package com.mycompany.isp392.controllers;

import com.mycompany.isp392.product.ProductDAO;
import com.mycompany.isp392.product.ProductDTO;
import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AddProductController extends HttpServlet {

    private static final String ERROR = "login.jsp";
    private static final String SUCCESS = "AddProduct.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String productName = request.getParameter("productName");
            String description = request.getParameter("description");
            int numberOfPurchase = 0; // Default value for a new product
            int status = 1; // Default status
            int brandID = Integer.parseInt(request.getParameter("brandID"));

            ProductDTO product = new ProductDTO(0, productName, description, numberOfPurchase, status, brandID);
            ProductDAO productDAO = new ProductDAO();
            boolean check = productDAO.addProduct(product);
            if (check) {
                int productID = productDAO.getLatestProductID();
                request.setAttribute("MESSAGE", "Product added successfully!");
                request.setAttribute("PRODUCT_ID", productID);
                url = SUCCESS;
            }
        } catch (NumberFormatException | SQLException e) {
            log("Error at AddProductController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "AddProductController";
    }
}
