/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.isp392.product;

import java.util.Objects;

/**
 *
 * @author TTNHAT
 */
public class ProductDTO {

    private int productID;
    private String productName;
    private String description;
    private int numberOfPurchase;
    private int status;
    private int brandID;
    private ProductDetailsDTO productDetails;

    public ProductDTO() {
    }

    public ProductDTO(int productID, String productName, String description, int numberOfPurchase, int status, int brandID) {
        this.productID = productID;
        this.productName = productName;
        this.description = description;
        this.numberOfPurchase = numberOfPurchase;
        this.status = status;
        this.brandID = brandID;
    }

    public ProductDTO(String productName, String description, int numberOfPurchase, int status, int brandID) {
        this.productName = productName;
        this.description = description;
        this.numberOfPurchase = numberOfPurchase;
        this.status = status;
        this.brandID = brandID;
    }

    public ProductDTO(String productName) {
        this.productName = productName;
    }

    public int getProductID() {
        return productID;
    }

    public String getProductName() {
        return productName;
    }

    public String getDescription() {
        return description;
    }

    public int getNumberOfPurchase() {
        return numberOfPurchase;
    }

    public int getStatus() {
        return status;
    }

    public int getBrandID() {
        return brandID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setNumberOfPurchase(int numberOfPurchase) {
        this.numberOfPurchase = numberOfPurchase;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public void setBrandID(int brandID) {
        this.brandID = brandID;
    }

    public ProductDetailsDTO getProductDetails() {
        return productDetails;
    }

    public void setProductDetails(ProductDetailsDTO productDetails) {
        this.productDetails = productDetails;
    }

    @Override
    public String toString() {
        return "ProductDTO{" + "productID=" + productID + ", productName=" + productName + ", description=" + description + ", numberOfPurchase=" + numberOfPurchase + ", status=" + status + ", brandID=" + brandID + '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        ProductDTO that = (ProductDTO) o;
        return productID == that.productID;
    }

    @Override
    public int hashCode() {
        return Objects.hash(productID);
    }
}
