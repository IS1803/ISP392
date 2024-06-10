/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.isp392.brand;

import java.util.List;

import utils.DbUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author notlongfen
 */
public class BrandDAO {
    private static final String SEARCH_BRAND = "SELECT * FROM Brand WHERE brandName LIKE ?";
    
    public List<BrandDTO> searchForBrand(String brandName) {
        List<BrandDTO> list = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DbUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_BRAND);
                ptm.setString(1, "%" + brandName + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int brandID = rs.getInt("brandID");
                    int status = rs.getInt("status"); 
                    
                    if (list == null) {
                        list = new java.util.ArrayList<>();
                    }
                    list.add(new BrandDTO(brandID, brandName, status));
                }
            }

        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
    }
}