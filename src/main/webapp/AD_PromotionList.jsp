<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.mycompany.isp392.user.UserDTO" %>
<%@ page import="com.mycompany.isp392.promotion.PromotionDTO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Promotion List</title>
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/ruang-admin.min.css" rel="stylesheet">
        <style>
            .pagination .page-link {
                border-radius: 20px;
            }
            .pagination .page-item.active .page-link {
                background-color: #007bff;
                border-color: #007bff;
            }
            .pagination .page-link:focus,
            .pagination .page-link:hover {
                background-color: #007bff;
                border-color: #007bff;
            }
            .pagination .page-item:first-child .page-link {
                border-top-left-radius: 15px;
                border-bottom-left-radius: 15px;
            }
            .pagination .page-item:last-child .page-link {
                border-top-right-radius: 15px;
                border-bottom-right-radius: 15px;
            }
            .container {
                display: flex;
                align-items: center;
                justify-content: center;
                margin-top: 10px;
            }
            .container input[type="date"] {
                padding: 10px;
                margin: 30px 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                width: 400px;
            }
            .container button:hover {
                background-color: #0056b3;
            }
        </style>
    </head>

    <body id="page-top">

        <div id="wrapper">
            <!-- Sidebar -->
            <%@include file="AD_sidebar.jsp" %>
            <!-- Sidebar -->
            <div id="content-wrapper" class="d-flex flex-column">
                <div id="content">
                    <!---Header --->
                    <!-- Container Fluid-->
                    <%@include file="AD_header.jsp" %>
                    <%
           if (loginUser == null || 2 != loginUser.getRoleID()) {
               response.sendRedirect("US_SignIn.jsp");
               return;
           }
           String search = request.getParameter("search");
           if (search == null) {
               search = "";
           }
                    %>

                    <div class="container-fluid" id="container-wrapper">
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-900"><b>Promotions</b></h1>
                        </div>
                        <div class="d-flex justify-content-end mb-4">
                            <a href="AD_CreatePromotion.jsp" class="btn btn-danger" style="background: #C43337;">Create Promotion</a>
                        </div>
                        <div class="row mb-3">
                            <!-- Invoice Example -->
                            <div class="col-xl-12 mb-4">
                                <div class="card">
                                    <form action="MainController">
                                        <div class="table-responsive">
                                            <div class="container">
                                                <div class="input-group" style="width: 500px">
                                                    <input type="text" class="form-control" placeholder="Search..." name="search" value="<%= search%>">
                                                    <div class="input-group-append">
                                                        <button class="btn btn-outline-secondary" type="submit" name="action" value="Search promotion">Search</button>
                                                    </div>
                                                </div>
                                            </div>
                                                    </br>
                                            <table class="table align-items-center table-flush">
                                                <thead class="thead-light">
                                                    <tr>
                                                        <th class="text-center">ID</th>
                                                        <th class="text-center">Code Name</th>
                                                        <th class="text-center">Start Date</th>
                                                        <th class="text-center">End Date</th>
                                                        <th class="text-center">Percentage</th>
                                                        <th class="text-center">Condition</th>
                                                        <th class="text-center">Status</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <%
                                                List<PromotionDTO> promotionList = (List<PromotionDTO>) request.getAttribute("LIST_PROMOTION");
                                                if (promotionList != null) {
                                                    for (PromotionDTO promotion : promotionList) {
                                                %>
                                                <tbody id="tableBody">
                                                    <tr>
                                                        <td class="text-center"><%= promotion.getPromotionID() %></td>
                                                        <td class="text-center"><a href="MainController?action=ViewDetailPromotion&promotionID=<%= promotion.getPromotionID() %>"><%= promotion.getPromotionName() %></td>
                                                        <td class="text-center"><%= promotion.getStartDate() %></td>
                                                        <td class="text-center"><%= promotion.getEndDate() %></td>
                                                        <td class="text-center"><%= promotion.getDiscountPer() %></td>
                                                        <td class="text-center">Points >=<%= promotion.getCondition() %></td>
                                                        <td class="text-center"><span class="badge <%= promotion.getStatus() == 1 ? "badge-success" : "badge-warning" %>"><%= promotion.getStatus() == 1 ? "Available" : "Deleted" %></span></td>
                                                        <td>
                                                            <% 
                                                            if (promotion.getStatus() == 0){  
                                                            %>
                                                            <a href="#" class="btn btn-sm btn-danger disabled" aria-disabled="true">Delete</a> 
                                                            <% 
                                                                } else {  
                                                            %>
                                                            <a href="MainController?action=DeletePromotion&promotionID=<%= promotion.getPromotionID() %>" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#confirmDeleteModal" data-id="<%= promotion.getPromotionID() %>">Delete</a> 
                                                            <% 
                                                                }
                                                            %>
                                                            <a href="MainController?action=EditPromotion&promotionID=<%= promotion.getPromotionID()%>" class="btn btn-sm btn-dark">Edit</a>
                                                        </td>
                                                    </tr>                                        
                                                </tbody>
                                                <% 
                                                    }
                                                } else {
                                                %>
                                                <tr>
                                                    <td colspan="10" class="text-center">No promotions found</td>
                                                </tr>
                                                <% 
                                                }
                                                %>
                                            </table>
                                            <hr>

                                        </div>
                                    </form>
                                    <div class="card-footer"></div>
                                </div>
                            </div>
                        </div>
                        <!--Row-->

                        <!-- Modal Logout -->
                        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelLogout" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabelLogout">Oh No!</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <p>Are you sure you want to logout?</p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Cancel</button>
                                        <a href="US_SignIn.jsp" class="btn btn-primary">Logout</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!---Mode up delete item in voice -->
                        <!-- Modal Xác nhận Xóa -->
                        <div class="modal fade" id="confirmDeleteModal" tabindex="-1" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header bg-danger text-white">
                                        <h5 class="modal-title" id="confirmDeleteModalLabel">Confirm Delete</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        Are you sure you want to delete this item?
                                    </div>
                                    <div class="modal-footer">
                                        <form id="deleteForm" method="post">
                                            <input type="hidden" name="id" id="modalID" value="">
                                            <input type="hidden" name="action" value="DeletePromotion">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                            <button type="submit" class="btn btn-danger">Delete</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Success Modal -->
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
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <% } %>
                        <script>
                            //Sort Date
                            function locNgay() {
                                const ngayBatDau = document.getElementById('ngayBatDau').value;
                                const ngayKetThuc = document.getElementById('ngayKetThuc').value;
                                const tableBody = document.getElementById('tableBody');
                                const rows = tableBody.getElementsByTagName('tr');

                                if (ngayBatDau && ngayKetThuc) {
                                    const startDate = new Date(ngayBatDau);
                                    const endDate = new Date(ngayKetThuc);

                                    for (let i = 0; i < rows.length; i++) {
                                        const cells = rows[i].getElementsByTagName('td');
                                        const ngayBatDauRow = new Date(cells[3].textContent.trim());
                                        const ngayKetThucRow = new Date(cells[4].textContent.trim());

                                        if (ngayBatDauRow >= startDate && ngayKetThucRow <= endDate) {
                                            rows[i].style.display = '';
                                        } else {
                                            rows[i].style.display = 'none';
                                        }
                                    }
                                } else {
                                    for (let i = 0; i < rows.length; i++) {
                                        rows[i].style.display = '';
                                    }
                                }
                            }

                            // Handle delete modal
                            document.querySelectorAll('.btn-danger[data-toggle="modal"]').forEach(btn => {
                                btn.addEventListener('click', function () {
                                    const id = this.getAttribute('data-id');
                                    document.getElementById('modalID').value = id;
                                });
                            });

                            // Display success modal if message exists
                            $(document).ready(function () {
                                const successMessage = '<%= request.getAttribute("SUCCESS_MESSAGE") %>';
                                if (successMessage) {
                                    document.getElementById('successMessage').innerText = successMessage;
                                    $('#successModal').modal('show');
                                }
                            });
                        </script>

                        <script src="vendor/jquery/jquery.min.js"></script>
                        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
                        <script src="js/ruang-admin.min.js"></script>
                        <script src="vendor/chart.js/Chart.min.js"></script>
                        <script src="js/demo/chart-area-demo.js"></script>  
                        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
                        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDzwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
                        </body>
                        </html>
