package com.mycompany.isp392.controllers;

import com.mycompany.isp392.product.ManageProductDTO;
import com.mycompany.isp392.product.ProductDAO;
import com.mycompany.isp392.product.ProductError;
import com.mycompany.isp392.user.UserDTO;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.DbUtils;

@WebServlet(name = "EditProductController", urlPatterns = {"/EditProductController"})
public class EditProductController extends HttpServlet {

    private static final String ERROR = "GetSpecificProductController";
    private static final String SUCCESS = "GetProductsController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        ProductError productError = new ProductError();
        boolean checkValidation = true;
        ProductDAO productDAO = new ProductDAO();
        try {
            int productID = Integer.parseInt(request.getParameter("productID"));
            String productName = request.getParameter("productName");
            String description = request.getParameter("description");
            int numberOfPurchasing = Integer.parseInt(request.getParameter("numberOfPurchasing"));
            int brandID = Integer.parseInt(request.getParameter("brandID"));
            String[] categoryIDs = request.getParameterValues("categoryIDs");
            int status = Integer.parseInt(request.getParameter("status"));

            String oldProductName = request.getParameter("oldProductName");
            String oldDescription = request.getParameter("oldDescription");
            int oldNumberOfPurchasing = Integer.parseInt(request.getParameter("oldNumberOfPurchasing"));
            int oldBrandID = Integer.parseInt(request.getParameter("oldBrandID"));

            if (productDAO.checkProductExists(productName, productID)) {
                productError.setProductNameError("Product already exists.");
                checkValidation = false;
            }

            if (checkValidation) {
                boolean check = productDAO.editProduct(productID, productName, description, numberOfPurchasing, brandID, categoryIDs, status);
                if (check) {
                    List<String> oldList = new ArrayList<>();
                    List<String> newList = new ArrayList<>();
                    if (!oldProductName.equals(productName) && !oldDescription.equals(description) && oldNumberOfPurchasing != numberOfPurchasing && oldBrandID != brandID) {
                        oldList.add("Name: " + oldProductName);
                        oldList.add("Description: " + oldDescription);
                        oldList.add("Number of purchasing: " + String.valueOf(oldNumberOfPurchasing));
                        oldList.add("BrandID: " + String.valueOf(oldBrandID));
                        newList.add("Name: " +productName);
                        newList.add("Description: " + description);
                        newList.add("Number of purchasing: " + String.valueOf(numberOfPurchasing));
                        newList.add("BrandID: " + String.valueOf(brandID));
                    } else {
                        if (!oldProductName.equals(productName)) {
                            oldList.add("Name: " + oldProductName);
                            newList.add("Name: " +productName);
                        }
                        if (!oldDescription.equals(description)) {
                            oldList.add("Description: " + oldDescription);
                            newList.add("Description: " + description);
                        }
                        if (oldNumberOfPurchasing != numberOfPurchasing) {
                            oldList.add("Number of purchasing: " + String.valueOf(oldNumberOfPurchasing));
                            newList.add("Number of purchasing: " + String.valueOf(numberOfPurchasing));
                        }
                        if (oldBrandID != brandID) {
                            oldList.add("BrandID: " + String.valueOf(oldBrandID));
                            newList.add("BrandID: " + String.valueOf(brandID));
                        }
                    }
                    if (oldList.size() > 0 && newList.size() > 0) {
                        String action = request.getParameter("edit");
                        UserDTO user = (UserDTO) request.getSession().getAttribute("LOGIN_USER");
                        int empID = user.getUserID();
                        ManageProductDTO manage = new ManageProductDTO(productID, empID, oldList, newList, action);
                        DbUtils.addCheckLogToDB("OverseeProducts", "ProductID", manage);
                    }
                    request.getSession().setAttribute("SUCCESS_MESSAGE", "Product updated successfully!");
                    response.sendRedirect(SUCCESS);
                    return;
                } else {
                    productError.setError("UNABLE TO UPDATE INFORMATION!");
                    request.getSession().setAttribute("PRODUCT_ERROR", productError);
                }
            } else {
                request.getSession().setAttribute("PRODUCT_ERROR", productError);
            }
        } catch (Exception e) {
            request.getSession().setAttribute("ERROR_MESSAGE", "Error updating product: " + e.getMessage());
        }
        request.getRequestDispatcher(ERROR).forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EditProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EditProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
