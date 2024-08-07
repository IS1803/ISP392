<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.isp392.product.ProductDTO"%>
<%@page import="com.mycompany.isp392.product.ProductDetailsDTO"%>
<%@page import="com.mycompany.isp392.brand.BrandDTO"%>
<%@page import="com.mycompany.isp392.category.CategoryDTO"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>All Products</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
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
                width: 150px;
                margin: 5px auto;
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
            a {
                text-decoration: none;
                color: #000;
            }
            a:hover {
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
            .container-fluid-a {
                background: #1E1E27;
                color: #fff;
            }
            .product-grid {
                font-family: 'Poppins', sans-serif;
                text-align: center;
            }
            .product-grid .product-image {
                overflow: hidden;
                position: relative;
                z-index: 1;
            }
            .product-grid .product-image a.image {
                display: block;
            }
            .product-grid .product-image img {
                width: 100%;
                height: auto;
            }
            .product-grid .product-discount-label {
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
            .product-grid .product-links {
                padding: 0;
                margin: 0;
                list-style: none;
                position: absolute;
                top: 10px;
                right: -50px;
                transition: all .5s ease 0s;
            }
            .product-grid:hover .product-links {
                right: 10px;
            }
            .product-grid .product-links li button {
                color: #333;
                background: transparent;
                font-size: 17px;
                line-height: 38px;
                width: 38px;
                height: 38px;
                display: block;
                transition: all 0.3s;
                border: none; /* Add this line to remove the border */
            }
            .product-grid .product-links li button:hover {
                color: #c53337;
            }

            .product-links li button:focus,
            .product-links li button:active {
                color: #c53337;
            }


            .product-grid .add-to-cart {
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
            .product-grid:hover .add-to-cart {
                bottom: 0;
            }
            .product-grid .add-to-cart:hover {
                background: rgb(199, 30, 61);
            }
            .product-grid .product-content {
                background: #fff;
                padding: 15px;
            }
            .product-grid .title {
                font-size: 16px;
                font-weight: 600;
                text-transform: capitalize;
                margin: 0 0 7px;
            }
            .product-grid .title a {
                color: black;
                transition: all 0.3s ease 0s;
                text-decoration: none;
            }
            .product-grid .title a:hover {
                color: #a5ba8d;
            }
            .product-grid .price {
                color: #c53337;
                font-size: 14px;
                font-weight: 600;
            }
            .product-grid .price span {
                color: #888;
                font-size: 13px;
                font-weight: 400;
                text-decoration: line-through;
                margin-left: 3px;
                display: inline-block;
            }
            .pagination-container {
                display: flex;
                justify-content: center;
                margin-top: 20px;
            }
            .pagination-container .pagination {
                display: flex;
                list-style: none;
                padding: 0;
            }
            .pagination-container .pagination li {
                margin: 0 5px;
            }
            .pagination-container .pagination li a {
                display: block;
                padding: 10px 15px;
                border: 1px solid #ddd;
                color: #333;
                text-decoration: none;
            }
            .pagination-container .pagination li a:hover {
                background-color: #f0f0f0;
                border-color: #ddd;
            }
            .pagination-container .pagination .active a {
                background-color: #c53337;
                color: #fff;
                border-color: #c53337;
            }
            .pagination-container .pagination .disabled a {
                color: #999;
                pointer-events: none;
            }
            .product_image1 {
                width: 270px;  /* ??t k�ch th??c c? ??nh cho ph?n t? cha */
                height: 250px; /* ??t k�ch th??c c? ??nh cho ph?n t? cha */
                overflow: hidden; /* ?n ph?n n�o c?a h�nh ?nh v??t qu� k�ch th??c khung ch?a */
            }
            .product_image1 img {
                width: 100%;
                height: 100%;
                object-fit: cover; /* B?n c� th? th? 'cover' ho?c 'contain' t�y theo mong mu?n */
            }
        </style>
    </head>
    <body>
        <%@include file="US_header.jsp" %>
        <div class="container-fluid-a p-3 mt-5">
            <h2 style="color: #fff; padding-left: 40px;">All Products</h2>
            <p style="padding-left: 40px; color: #fff">Buy and Sell items for all people on ISP392. Every item is ISP392 Verified.</p>
        </div>
        <div class="container mt-5 mb-5">
            <div class="row">
                <div class="col-md-3">
                    <hr>
                    <div>
                        <h4 style="color: #c53337">FILTER</h4>
                    </div>
                    <hr>
                    <div>
                        <h4 style="color: #c53337">CATEGORY</h4>
                        <ul class="list-unstyled">
                            <% List<CategoryDTO> categories = (List<CategoryDTO>) request.getAttribute("categories");
                                String selectedCategoryID = request.getParameter("categoryID");
                                if (categories != null) {
                                    for (CategoryDTO category : categories) {
                            %>
                            <li><label><input type="checkbox" name="category" class="category-filter" value="<%= category.getCategoryID() %>" <%= selectedCategoryID != null && selectedCategoryID.equals(String.valueOf(category.getCategoryID())) ? "checked" : "" %>> <%= category.getCategoryName() %></label></li>
                                    <%    }
                                        } %>
                        </ul>
                    </div>
                    <hr>
                    <div>
                        <h4 style="color: #c53337">BRANDS</h4>
                        <ul class="list-unstyled">
                            <% List<BrandDTO> brands = (List<BrandDTO>) request.getAttribute("brands");
                                String selectedBrandID = request.getParameter("brandID");
                                if (brands != null) {
                                    for (BrandDTO brand : brands) {
                            %>
                            <li><label><input type="checkbox" name="brand" class="brand-filter" value="<%= brand.getBrandID() %>" <%= selectedBrandID != null && selectedBrandID.equals(String.valueOf(brand.getBrandID())) ? "checked" : "" %>> <%= brand.getBrandName() %></label></li>
                                    <%    }
                                        } %>
                        </ul>
                    </div>
                    <hr>
                    <div>
                        <h4 style="color: #c53337">PRICE</h4>
                        <ul class="list-unstyled">
                            <li><label><input type="checkbox" name="price" class="price-filter" value="0-2000000"> Below 2.000.000</label></li>
                            <li><label><input type="checkbox" name="price" class="price-filter" value="2000000-5000000"> From 2.000.000 to 5.000.000</label></li>
                            <li><label><input type="checkbox" name="price" class="price-filter" value="5000000-10000000"> From 5.000.000 to 10.000.000</label></li>
                            <li><label><input type="checkbox" name="price" class="price-filter" value="10000000plus"> Above 10.000.000</label></li>
                        </ul>
                    </div>
                    <hr>
                </div>
                <div class="col-md-9">
                    <h5 style="color: grey;">
                        <a style="color: grey; text-decoration: none" href="HomePageController">Home ></a>
                        <a style="color: grey; text-decoration: none" href="ViewAllProductController">All Products</a>
                    </h5>
                    <div class="row" id="products-container">
                        <%
                            List<ProductDTO> products = (List<ProductDTO>) request.getAttribute("products");
                            Map<Integer, Map<String, ProductDetailsDTO>> productDetailsByColor = (Map<Integer, Map<String, ProductDetailsDTO>>) request.getAttribute("productDetailsByColor");

                            if (products != null && productDetailsByColor != null) {
                                for (ProductDTO product : products) {
                                    Map<String, ProductDetailsDTO> detailsByColor = productDetailsByColor.get(product.getProductID());
                                    if (detailsByColor != null) {
                                        for (ProductDetailsDTO detail : detailsByColor.values()) {
                        %>
                        <div class="col-md-4 mb-4">
                            <div class="product-grid">
                                <form action="MainController">
                                    <input type="hidden" name="page" value="allProduct">
                                    <div class="product-image">
                                        <a href="MainController?action=Get_product_detail&productID=<%= product.getProductID() %>&color=<%= detail.getColor() %>" >
                                            <div class="product_image1">
                                                <img src="<%= detail.getImage().split(";")[0] %>" alt="<%= product.getProductName() %>">
                                            </div>
                                        </a>
                                        <ul class="product-links">
                                            <li><button type="submit" name="action" value="AddToWishlist"><i class="fa fa-heart"></i></button></li>
                                            <input type="hidden" name="productDetailID" value="<%= detail.getProductDetailsID() %>">
                                            <input type="hidden" name="productID" value="<%= product.getProductID() %>">
                                        </ul>
                                    </div>
                                    <div class="product-content">
                                        <h3 class="title"><a href="MainController?action=Get_product_detail&productID=<%= product.getProductID() %>&color=<%= detail.getColor() %>"><%= product.getProductName() %></a></h3>
                                        <div class="price">
                                            <%
                                                NumberFormat formatter = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));

                                                int price = detail.getPrice();
                                                String formattedPrice = formatter.format(price);
                                            %>
                                            <%= formattedPrice %>
                                            <span></span></div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <%
                                        }
                                    }
                                }
                            }
                        %>
                    </div>
                    <div id="pagination-container" class="mt-3">
                        <nav aria-label="Page navigation">
                            <ul class="pagination justify-content-center mt-3">
                                <li class="page-item <%= (request.getAttribute("currentPage") != null && (int) request.getAttribute("currentPage") == 1) ? "disabled" : "" %>">
                                    <a class="page-link" href="javascript:void(0);" data-page="<%= (int) request.getAttribute("currentPage") - 1 %>" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <% int totalPages = (int) request.getAttribute("totalPages");
                                   int currentPage = (int) request.getAttribute("currentPage");
                                   for (int i = 1; i <= totalPages; i++) { %>
                                <li class="page-item <%= currentPage == i ? "active" : "" %>">
                                    <a class="page-link" href="javascript:void(0);" data-page="<%= i %>"><%= i %></a>
                                </li>
                                <% } %>
                                <li class="page-item <%= currentPage == totalPages ? "disabled" : "" %>">
                                    <a class="page-link" href="javascript:void(0);" data-page="<%= currentPage + 1 %>" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>

                    </div>
                </div>
                <% if (request.getAttribute("SUCCESS_MESSAGE") != null) { %>
                <div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header bg-success text-white">
                                <h5 class="modal-title" id="successModalLabel">Success</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <span id="successMessage"></span>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
        <jsp:include page="US_footer.jsp" />
        <%@include file="US_RequestSupport.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                function getSelectedValues(selector) {
                    return $(selector + ':checked').map(function () {
                        return this.value;
                    }).get();
                }

                function loadFilteredProducts(page = 1) {
                    var selectedBrands = getSelectedValues('.brand-filter');
                    var selectedPrices = getSelectedValues('.price-filter');
                    var selectedCategories = getSelectedValues('.category-filter');

                    $.ajax({
                        url: 'SearchProductForHeaderController',
                        type: 'GET',
                        data: {
                            brands: selectedBrands,
                            prices: selectedPrices,
                            categories: selectedCategories,
                            page: page,
                            search: $('#search-form input[name="search"]').val() // Get search term from input field
                        },
                        success: function (data) {
                            $('#products-container').html($(data).find('#products-container').html());
                            $('#pagination-container').html($(data).find('#pagination-container').html());

                            // Attach the click event handler again after updating the pagination
                            $('.page-link').click(function (e) {
                                e.preventDefault();
                                var page = $(this).data('page');
                                loadFilteredProducts(page);
                            });
                        },
                        error: function () {
                            alert('Error loading products. Please try again.');
                        }
                    });
                }

                // Attach the click event handler to pagination links
                $(document).on('click', '.page-link', function (e) {
                    e.preventDefault();
                    var page = $(this).data('page');
                    loadFilteredProducts(page);
                });

                // Check the brand filter if brandID is present in the URL
                var brandID = new URLSearchParams(window.location.search).get('brandID');
                if (brandID) {
                    $('input[name="brand"][value="' + brandID + '"]').prop('checked', true);
                }

                // Check the category filter if categoryID is present in the URL
                var categoryID = new URLSearchParams(window.location.search).get('categoryID');
                if (categoryID) {
                    $('input[name="category"][value="' + categoryID + '"]').prop('checked', true);
                }

                // Event listeners for the checkboxes
                $('.brand-filter, .price-filter, .category-filter').on('change', function () {
                    loadFilteredProducts();
                });

                // Initial load
                loadFilteredProducts();
            });

            function resetFilters() {
                $('input[type="checkbox"]').prop('checked', false);
                window.location.href = "MainController?action=All_Product";
                loadFilteredProducts();
            }

// Format prices to Vietnamese currency
            let priceElement = document.getElementById('productPrice');
            let price = parseFloat(priceElement.innerText.replace('$', ''));

// Format price to Vietnamese currency
            const formatter = new Intl.NumberFormat('vi-VN', {
                style: 'currency',
                currency: 'VND'
            });
            let formattedPrice = formatter.format(price);

// Update HTML/JSP element content
            priceElement.innerText = formattedPrice;

        </script>
    </body>
</html>
