<%-- 
    Document   : CreateProduct
    Created on : Jun 2, 2024, 4:10:09 PM
    Author     : jojo
--%>

<%@page import="com.mycompany.isp392.user.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
        <title>Edit Employee</title>
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
            UserDTO user = (UserDTO) request.getAttribute("EMPLOYEE");
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
                                                                        if (loginUser == null || 1 != loginUser.getRoleID()) {
                                                                            response.sendRedirect("US_SignIn.jsp");
                                                                            return;
                                                                        }
                    %>
                    <div class="container-fluid" id="container-wrapper">

                        <div class="form-container">
                            <h2 class="text-center" style="color: #000; font-weight: bold;">Edit Employee</h2>
                            <form action="MainController" method="POST">
                                <input type="hidden" name="userID" value="<%= user.getUserID()%>"/>
                                <input type="hidden" name="oldStatus" value="<%= user.getStatus()%>"/>
                                <input type="hidden" name="oldRoleID" value="<%= user.getRoleID()%>"/>
                                <input type="hidden" name="edit" value="Edit"/>
                                <div class="form-row mb-3">
                                     <div class="form-group col-md-6">
                                        <label for="roleID">Role</label>
                                        <select class="form-select form-control" id="roleID" aria-label=".form-select-sm" 
                                                style="width: 375px" name="roleID">
                                            <option value="1" <%= user.getRoleID() == 1 ? "selected" : "" %>>System Manager</option>
                                            <option value="2" <%= user.getRoleID() == 2 ? "selected" : "" %>>Shop Manager</option>
                                            <option value="3" <%= user.getRoleID() == 3 ? "selected" : "" %>>Shop Staff</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="status">Status</label>
                                        <select name="status" style="width: 375px" class="form-select form-control" id="status" aria-label=".form-select-sm">
                                            <option value="0" <%= user.getStatus() == 0 ? "selected" : "" %>>Inactive</option>
                                            <option value="1" <%= user.getStatus() == 1 ? "selected" : "" %>>Active</option>
                                        </select>
                                    </div>
                                </div>     
                                <div class="form-group text-center">
                                    <button type="submit" name="action" value="EditEmployee" class="btn btn-danger btn-custom">Submit</button>
                                    <button type="reset" class="btn btn-secondary btn-custom">Reset</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
                                        
            <!-- Error Modal -->
            <div class="modal fade" id="errorModal" tabindex="-1" role="dialog" aria-labelledby="errorModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header bg-danger text-white">
                            <h5 class="modal-title" id="errorModalLabel">Error</h5>
                            <button type="button" class="close text-white" data-bs-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <ul class="list-group list-group-flush">
                                <%
                                    UserError error = (UserError) request.getAttribute("EDIT_ERROR");
                                    if (error != null) {
                                        if (error.getEmailError() != null && !error.getEmailError().isEmpty()) {
                                %>
                                    <li class="list-group-item list-group-item-danger"><%= error.getEmailError() %></li>
                                <%
                                        }
                                        if (error.getPhoneError() != null && !error.getPhoneError().isEmpty()) {
                                %>
                                    <li class="list-group-item list-group-item-danger"><%= error.getPhoneError() %></li>
                                <%
                                        }
                                        if(error.getUserIDError() != null && !error.getUserIDError().isEmpty()){

                                %>
                                    <li class="list-group-item list-group-item-danger"><%= error.getUserIDError() %></li>
                                <%
                                        }
                                    }
                                %>
                            </ul>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>

            <% if (request.getAttribute("EDIT_ERROR") != null) { %>
            <script>
                $(document).ready(function () {
                    $('#errorModal').modal('show');
                });
            </script>
            <% } %>

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
        <script src="AD_js/demo/chart-area-demo.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
