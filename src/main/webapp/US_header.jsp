<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.mycompany.isp392.user.UserDTO"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Header</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Colo Shop Template">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" href="plugins/themify-icons/themify-icons.css">
        <link rel="stylesheet" type="text/css" href="plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
        <link rel="stylesheet" type="text/css" href="US_css/single_style.css">
        <link rel="stylesheet" type="text/css" href="US_css/single_responsive.css">
    </head>
    <style>
        .search-container {
            display: flex;
            justify-content: center;
            margin-top: 10px;
        }

        .search-container form {
            display: flex;
            border: 1px solid #ccc;
            border-radius: 20px;
            overflow: hidden;
        }

        .search-container input[type="text"] {
            border: none;
            padding: 5px;
            font-size: 16px;
            outline: none;
            width: 300px;
            border-radius: 25px 0 0 25px;
        }

        /*        .search-container button {
                    background-color: #4CAF50;
                    color: white;
                    border: none;
                    padding: 10px 15px;
                    cursor: pointer;
                    border-radius: 0 25px 25px 0;
                }
        
                .search-container button:hover {
                    background-color: #45a049;
                }
        
                .search-container .fa-search {
                    margin-right: 5px;
                }*/
        
                .search-btn {
                    background: none; /* Remove default background */
                    border: none; /* Remove default border */
                    padding: 0; /* Adjust padding if needed */
                    cursor: pointer; /* Change cursor to pointer */
                    font-size: 1.2rem; /* Adjust font size if needed */
                    color: inherit; /* Use inherited text color */
                    margin-left: 10px; /* Add margin to move the button to the right */
                    margin-right: 5px;
                }

                .search-btn i {
                    color: black; /* Change icon color if needed */
                }

                .search-btn:focus {
                    outline: none; /* Remove default focus outline */
                }

                .search-btn:hover {
                    /* Add hover effects if desired */
                    color: gray; /* Change color on hover */
                }
                
                 .logo_container a {
                    color: #b21f2d; /* Default color for "Kro" */
                    text-decoration: none; /* Removes underline */
                }

                .logo_container a span {
                    color: black; /* Color for "no" */
                }
                
                .logo_container a:hover {
                    color: #b21f2d; 
                    text-decoration: underline;
                }
    </style>
    <body>
        <%
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
            
            UserDTO checkLogin = (UserDTO) session.getAttribute("LOGIN_USER");
        %>
        <div class="super_container">

            <!-- Header -->

            <header class="header trans_300">

                <!-- Top Navigation -->

                <div class="top_nav">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="top_nav_left"></div>
                            </div>
                            <div class="col-md-6 text-right">
                                <div class="top_nav_right">
                                    <ul class="top_nav_menu">

                                        <!-- Currency / Language / My Account -->

                                        <li class="currency">
                                           
                                        </li>
                                        <li class="language">
                                         
                                        </li>
                                        <li class="account">
                                            <a href="#">
                                                My Account
                                                <i class="fa fa-angle-down"></i>
                                            </a>
                                            <ul class="account_selection">
                                                <%
                                                    if(checkLogin == null){
                                                %>
                                                <li><a href="US_SignIn.jsp"><i class="fa fa-sign-in" aria-hidden="true" ></i>Sign In</a></li>
                                                <li><a href="US_SignUp.jsp"><i class="fa fa-user-plus" aria-hidden="true" ></i>Register</a></li>
                                                <%
                                                    } else {
                                                %>
                                                <li><a href="MainController?action=Logout"><i class="fa fa-sign-in" aria-hidden="true" ></i>Logout</a></li>
                                                <%
                                                    }
                                                %>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Main Navigation -->

                <div class="main_nav_container">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-12 text-right">
                                <div class="logo_container" >
                                    <a href="HomePageController">Kro<span>no</span></a>
                                </div>
                                <nav class="navbar">
                                    <ul class="navbar_menu" >
                                        <li><a href="MainController">home</a></li>
                                        <li><a href="MainController?action=All_Product">shop</a></li>
                                        <li><a href="MainController?action=View promotion">promotion</a></li>
                                    </ul>
                                    <ul class="navbar_user">
                                        <li>
                                            <div class="search-container">                                      
                                                <form action="MainController" method="POST" id="search-form">
                                                    <!-- <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a> -->
                                                    <input type="hidden" id="search-button" value="SearchProductForHeaderController"/>
                                                    <button type="submit" name= "action" value="FindProduct" class="search-btn"><i class="fa fa-search" aria-hidden="true"></i></button>
                                                    <input type="text" placeholder="Search..." name="search" value="<%= search%>"> 
                                                </form>
                                            </div>
                                        </li>
                                        <li><a href="MainController?action=View profile&from=<%=request.getContextPath()%>"><i class="fa fa-user" aria-hidden="true"></i></a></li>
                                        <li class="checkout">
                                            <a href="MainController?action=View_Cart">
                                                <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                                                <!--<span id="checkout_items" class="checkout_items">2</span>-->
                                            </a>
                                        </li>

                                        <li class="checkout">
                                            <a href="MainController?action=wishlist&from=wishlist">
                                                <i class="fa fa-heart" aria-hidden="true"></i>
                                                <!--<span id="checkout_items" class="checkout_items">2</span>-->
                                            </a>
                                        </li>
                                    </ul>
                                    <div class="hamburger_container">
                                        <i class="fa fa-bars" aria-hidden="true"></i>
                                    </div>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>

            </header>
            <!-- Top Navigation -->

            <!-- Main Navigation -->

            <div class="main_nav_container">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 text-right">
                            <div class="logo_container">
                                <a href="#">colo<span>shop</span></a>
                            </div>
                            <nav class="navbar">
                                <ul class="navbar_menu">
                                    <li><a href="index.html">home</a></li>
                                    <li><a href="#">shop</a></li>
                                    <li><a href="#">promotion</a></li>
                                </ul>
                                <ul class="navbar_user">
                                    <li><a href="#"><i class="fa fa-search" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-user" aria-hidden="true"></i></a></li>
                                    <li class="checkout">
                                        <a href="#">
                                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                                            <span id="checkout_items" class="checkout_items">2</span>
                                        </a>
                                    </li>
                                </ul>
                                <div class="hamburger_container">
                                    <i class="fa fa-bars" aria-hidden="true"></i>
                                </div>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Hamburger Menu -->

            <!--            <div class="hamburger_menu">
                            <div class="hamburger_close"><i class="fa fa-times" aria-hidden="true"></i></div>
                            <div class="hamburger_menu_content text-right">
                                <ul class="menu_top_nav">
                                    <li class="menu_item has-children">
                                        <a href="#">
                                            usd
                                            <i class="fa fa-angle-down"></i>
                                        </a>
                                        <ul class="menu_selection">
                                            <li><a href="#">cad</a></li>
                                            <li><a href="#">aud</a></li>
                                            <li><a href="#">eur</a></li>
                                            <li><a href="#">gbp</a></li>
                                        </ul>
                                    </li>
                                    <li class="menu_item has-children">
                                        <a href="#">
                                            English
                                            <i class="fa fa-angle-down"></i>
                                        </a>
                                        <ul class="menu_selection">
                                            <li><a href="#">French</a></li>
                                            <li><a href="#">Italian</a></li>
                                            <li><a href="#">German</a></li>
                                            <li><a href="#">Spanish</a></li>
                                        </ul>
                                    </li>
                                    <li class="menu_item has-children">
                                        <a href="#">
                                            My Account
                                            <i class="fa fa-angle-down"></i>
                                        </a>
                                        <ul class="menu_selection">
                                            <li><a href="#"><i class="fa fa-sign-in" aria-hidden="true"></i>Sign In</a></li>
                                            <li><a href="#"><i class="fa fa-user-plus" aria-hidden="true"></i>Register</a></li>
                                        </ul>
                                    </li>
                                    <li class="menu_item"><a href="#">home</a></li>
                                    <li class="menu_item"><a href="#">shop</a></li>
                                    <li class="menu_item"><a href="#">promotion</a></li>
                                    <li class="menu_item"><a href="#">pages</a></li>
                                    <li class="menu_item"><a href="#">blog</a></li>
                                    <li class="menu_item"><a href="#">contact</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>-->

            <script src="javascript/jquery-3.2.1.min.js"></script>
            <script src="styles/bootstrap4/popper.js"></script>
            <script src="styles/bootstrap4/bootstrap.min.js"></script>
            <script src="plugins/Isotope/isotope.pkgd.min.js"></script>
            <script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
            <script src="plugins/easing/easing.js"></script>
            <script src="plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
            <script src="javascript/single_custom.js"></script>
    </body>

</html>
