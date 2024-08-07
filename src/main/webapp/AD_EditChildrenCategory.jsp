<%-- 
    Document   : CreateCategrories
    Created on : Jun 2, 2024, 4:15:51 PM
    Author     : jojo
--%>

<%@page import="com.mycompany.isp392.category.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
        <title>Edit Children Category</title>
        <style>
            .form-container {
                max-width: 800px;
                margin: 50px auto;
                padding: 20px;
                border: 1px solid #dee2e6;
                border-radius: 12px;
                background-color: #f8f9fa;
            }
            .form-group label {
                font-weight: bold;
            }
        </style>
    </head>
    <body id="page-top">
        <%
            ChildrenCategoryDTO cdCategory = (ChildrenCategoryDTO) request.getAttribute("CHILDREN_CATEGORY");
        %>
        <div id="wrapper">
            <!-- Sidebar -->
            <%@include file="AD_sidebar.jsp" %>

            <!-- Sidebar -->
            <div id="content-wrapper" class="d-flex flex-column">

                <div id="content">
                    <!-- Header -->
                    <%@include file="AD_header.jsp" %>
                    <%
                                                                        if (loginUser == null || 2 != loginUser.getRoleID()) {
                                                                            response.sendRedirect("US_SignIn.jsp");
                                                                            return;
                                                                        }
                    %>
                    <div class="container-fluid" id="container-wrapper">

                        <div class="form-container">
                            <h2 class="text-center" style="color: #000; font-weight: bold;">Edit Category Children</h2>
                            <form style="margin-top: 50px;" action="MainController" method="POST">
                                <input type="hidden" name="cdCategoryID" value="<%= cdCategory.getCdCategoryID()%>" readonly=""/>
                                <input type="hidden" name="parentID" value="<%= cdCategory.getParentID()%>" readonly=""/>
                                <input type="hidden" name="oldName" value="<%= cdCategory.getCategoryName()%>" readonly=""/>
                                <input type="hidden" name="oldStatus" value="<%= cdCategory.getStatus()%>" readonly=""/>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="categoryName">Children Category Name</label>
                                        <input type="text" class="form-control" id="categoryName" name="categoryName" style="margin-top: 10px;" value="<%= cdCategory.getCategoryName()%>" required="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="status">Status</label>
                                    <select name="status" style="width: 375px" class="form-select form-control" id="status" aria-label=".form-select-sm">
                                        <option value="0" <%= cdCategory.getStatus() == 0 ? "selected" : "" %>>Inactive</option>
                                        <option value="1" <%= cdCategory.getStatus() == 1 ? "selected" : "" %>>Active</option>
                                    </select>
                                </div>
                                <div class="form-group text-center" style="margin-top: 30px;">
                                    <button type="submit" class="btn btn-danger btn-custom" name="action" value="Edit_ChildrenCategory">Submit</button>
                                    <button type="reset" class="btn btn-secondary btn-custom">Reset</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Include necessary scripts -->
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
            <script src="vendor/jquery/jquery.min.js"></script>
            <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
            <script src="js/ruang-admin.min.js"></script>
            <script src="vendor/chart.js/Chart.min.js"></script>
            <script src="js/demo/chart-area-demo.js"></script>
    </body>
</html>
