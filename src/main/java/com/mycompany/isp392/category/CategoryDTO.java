package com.mycompany.isp392.category;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author TTNHAT
 */
public class CategoryDTO {
    private int categoryID;
    private String categoryName;
    private String description;
    private int status;

    public CategoryDTO() {
    }

    public CategoryDTO(int categoryID, String categoryName, String description, int status) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.description = description;
        this.status = status;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public String getDescription() {
        return description;
    }

    public int getStatus() {
        return status;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "CategoryDTO{" + "categoryID=" + categoryID + ", categoryName=" + categoryName + ", description=" + description + ", status=" + status + '}';
    }
}