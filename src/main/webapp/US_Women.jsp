<%-- 
    Document   : ViewCategory
    Created on : Jun 1, 2024, 8:14:43 AM
    Author     : jojo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.isp392.product.ProductDetailsDTO"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Women Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .price-button {
                display: flex;
                padding: 5px 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                text-align: center;
                font-size: 13px;
                color: #333;
                background-color: #fff;
                margin: 10px 0;
                text-decoration: none;
                width: 150px; /* Adjust the width as needed */
                margin: 5px auto; /* Center the box horizontally */
                transition: background-color 0.3s ease;
            }
            .price-button:hover {
                background-color: #f0f0f0;
            }
            .button-container {
                display: flex;
                flex-direction: column;
                align-items: center;
            }
            a{
                text-decoration: none;
                color: #000;
            }
            a:hover{
                color: #c53337;
                text-decoration: none;
            }
            .product-card {
                border: 1px solid #eee;
                border-radius: 5px;
                padding: 10px;
                text-align: center;
                margin-bottom: 20px;
            }
            .product-card img {
                max-width: 100%;
                height: auto;
            }
            .container-fluid1{
                background: #1E1E27;
                color: #fff;
            }

            .product-grid{
                font-family: 'Poppins', sans-serif;
                text-align: center;
            }
            .product-grid .product-image{
                overflow: hidden;
                position: relative;
                z-index: 1;
            }
            .product-grid .product-image a.image{
                display: block;
            }
            .product-grid .product-image img{
                width: 100%;
                height: auto;
            }
            .product-grid .product-discount-label{
                color: #fff;
                background: #c53337;
                font-size: 13px;
                font-weight: 600;
                line-height: 25px;
                padding: 0 20px;
                position: absolute;
                top: 10px;
                left: 0;
            }
            .product-grid .product-links{
                padding: 0;
                margin: 0;
                list-style: none;
                position: absolute;
                top: 10px;
                right: -50px;
                transition: all .5s ease 0s;
            }
            .product-grid:hover .product-links{
                right: 10px;
            }
            .product-grid .product-links li a{
                color: #333;
                background: transparent;
                font-size: 17px;
                line-height: 38px;
                width: 38px;
                height: 38px;
                /*                border: 1px solid #333;*/
                /*                border-bottom: none;*/
                display: block;
                transition: all 0.3s;
            }
            .product-grid .product-links li:last-child a{
                /*                border-bottom: 1px solid #333;*/
            }
            .product-grid .product-links li a:hover{
                color: #c53337;
                /*                background: #333;*/
            }
            .product-grid .add-to-cart{
                background: black;
                color: #fff;
                font-size: 16px;
                text-transform: uppercase;
                letter-spacing: 2px;
                width: 100%;
                padding: 10px 26px;
                position: absolute;
                left: 0;
                bottom: -60px;
                transition: all 0.3s ease 0s;
            }

            .sidebar-links a:hover {
                color: red;
            }

            .product-grid:hover .add-to-cart{
                bottom: 0;
            }
            .product-grid .add-to-cart:hover{
                /*                text-shadow: 4px 4px rgba(0,0,0,0.2);*/
                background: rgb(199, 30, 61);
            }
            .product-grid .product-content{
                background: #fff;
                padding: 15px;
                /*box-shadow: 0 0 0 5px rgba(0,0,0,0.1) inset;*/
            }
            .product-grid .title{
                font-size: 16px;
                font-weight: 600;
                text-transform: capitalize;
                margin: 0 0 7px;
            }
            .product-grid .title a{
                color: black;
                transition: all 0.3s ease 0s;
                text-decoration: none;
            }
            .product-grid .title a:hover{
                color: #a5ba8d;
            }
            .product-grid .price{
                color: #c53337;
                font-size: 14px;
                font-weight: 600;
            }
            .product-grid .price span{
                color: #888;
                font-size: 13px;
                font-weight: 400;
                text-decoration: line-through;
            }
            .pagination .page-link {
                border-radius: 20px;
                color: #c53337;

            }

            .pagination .page-item.active .page-link {
                background-color: #c53337;
                border-color: #c53337;
            }

            .pagination .page-link:focus,
            .pagination .page-link:hover {
                background-color: #c53337;
                border-color: #c53337;
                color: #fff;
            }

            .pagination .page-item:first-child .page-link {
                border-top-left-radius: 15px;
                border-bottom-left-radius: 15px;
            }

            .pagination .page-item:last-child .page-link {
                border-top-right-radius: 15px;
                border-bottom-right-radius: 15px;
            }
            @media screen and (max-width: 990px){
                .product-grid{
                    margin-bottom: 30px;
                }
            }
        </style>
    </head>
    <body>

        <%@include file="US_header.jsp" %>
        <div class="container-fluid1 p-3 mt-5">
            <h2 style="color: #fff; padding-left: 40px;">Women</h2>
            <p style="padding-left: 40px; color: #fff">Buy and Sell items for Women on ISP392. Every item is ISP392 Verified. </p>
        </div>
        <div class="container mt-5 mb-5">
            <div class="row">
                <!-- Sidebar -->
                <div class="col-md-3">
                    <!--                    <h3 class="mb-2" style="color: #c53337">FILTER</h3>-->
                    <hr>
                    <div>
                        <h4 style="color: #c53337">FILTER</h4>
                        <ul class="list-unstyled" style="text-decoration: none; ">
                            <li><a href="#" style="color: #000;">Sneakers</a></li>
                            <li><a href="#" style="color: #000;">Clothes</a></li>
                            <li><a href="#" style="color: #000;">Accessories</a></li>
                        </ul>
                    </div>
                    <hr>

                    <div>
                        <h4 style="color: #c53337 ">BRANDS</h4>
                        <ul class="list-unstyled">
                            <li><input type="checkbox"> Nike</li>
                            <li><input type="checkbox"> Adidas</li>
                            <li><input type="checkbox"> Puma</li>
                            <li><input type="checkbox"> Supreme</li>
                            <li><input type="checkbox"> Gucci</li>
                            <li><input type="checkbox"> Louis Vuitton</li>
                            <li><input type="checkbox"> New Balance</li>
                            <li><input type="checkbox"> Vans</li>
                        </ul>
                    </div>
                    <hr>
                    <div>
                        <h4 style="color: #c53337">PRICE</h4>
                        <ul class="list-unstyled col-sm-3">
                            <li><a href="#" class="price-button">5$ - 10$</a></li>
                            <li><a href="#" class="price-button">10$ - 20$</a></li>
                            <li><a href="#" class="price-button">20$ - 30$</a></li>
                            <li><a href="#" class="price-button">30$ - 40$</a></li>
                        </ul>
                    </div>
                </div>

                <!-- Main Content -->
                <!-- Main Content -->
                <div class="col-md-9">
                    <h5 style="color: grey;"><a style="color: grey; text-decoration: none" href="US_index.jsp">Home ></a> <a style="color: grey; text-decoration: none" href="Men.jsp">Men</a></h5>
                    <!--                    <hr>-->
                    <div class="row">
                        <%
                        List<ProductDetailsDTO> listProduct = (List<ProductDetailsDTO>) session.getAttribute("womenProduct");
                        if (listProduct != null && listProduct.size() > 0) {
                        for (ProductDetailsDTO list : listProduct) {
                        %>
                        <div class="col-md-3 col-sm-6">
                            <div class="product-grid">
                                <form action="MainController">
                                    <div class="product-image">
                                        <a href="#" class="image">
                                            <img src="<%= list.getImage() %>">
                                            <input type="hidden" name="image" value="<%= list.getImage() %>"/>
                                            <input type="hidden" name="productID" value="<%= list.getProductID() %>"/>
                                        </a>
                                        <!--<span class="product-discount-label">-23%</span>-->
                                        <ul class="product-links">
                                            <li><button type="submit" name="action" value="AddToWishlist"><i class="fa fa-heart"></i></button></li>
                                        </ul>
                                        <a href="" class="add-to-cart">Add to Cart</a>
                                    </div>
                                    <div class="product-content">
                                        <h3 class="title"><a href="#"><%= list.getProductName() %></a></h3>
                                        <input type="hidden" name="productName" value="<%= list.getProductName() %>"/>

                                        <div class="price"><%= list.getPrice() %></div>
                                        <input type="hidden" name="price" value="<%= list.getPrice() %>"/>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <%
                            }
} else {
                        %>
                        <h1>No products found</h1>

                        <%
                        }
                        %>

                        <nav aria-label="Page navigation">
                            <ul class="pagination justify-content-center mt-3">
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <li class="page-item mx-1"><a class="page-link" href="#">1</a></li>
                                <li class="page-item mx-1"><a class="page-link" href="#">2</a></li>
                                <li class="page-item mx-1"><a class="page-link" href="#">3</a></li>
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>


                </div>
            </div>
        </div>
        <jsp:include page="US_footer.jsp" />
        <%@include file="US_RequestSupport.jsp" %>

        <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
