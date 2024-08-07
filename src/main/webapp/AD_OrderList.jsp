<%-- 
    Document   : ProductList
    Created on : Jun 2, 2024, 4:31:06 PM
    Author     : jojo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.isp392.order.*" %>
<%@ page import="com.mycompany.isp392.user.*" %>
<%@ page import="java.sql.Date" %>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Order List</title>
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
                if (loginUser == null || 2!=loginUser.getRoleID() ) {
                    response.sendRedirect("US_SignIn.jsp");
                    return;
                }
                    %>

                    <div class="container-fluid" id="container-wrapper">
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-900"><b>Orders</b></h1>
                        </div>

                        <div class="row mb-3" style="margin-left: 70px; margin-top: 70px;">
                            <!-- Invoice Example -->
                            <div class="col-xl-11">
                                <div class="card">
                                    <div class=" py-3 d-flex flex-row align-items-center justify-content-between">
                                        <!--<h6 class="m-0 font-weight-bold text-primary">Invoice</h6>-->
                                    </div>
                                    <div class="table-responsive">
                                        <form>
                                            <div class="row mb-4 mx-2 justify-content-between">
                                                <div class="col-md-3">
                                                    <select id="statusSelect" class="custom-select">
                                                        <option value="Select Status">Select Status</option>
                                                        <option value="Cancelled">Cancelled</option>
                                                        <option value="Pending">Pending</option>
                                                        <option value="Processing">Processing</option>
                                                        <option value="Delivering">Delivering</option>
                                                        <option value="Completed">Completed</option>
                                                    </select>
                                                </div>
                                                <%
                                                 String search = request.getParameter("search");
                                                 if (search == null) {
                                                     search = "";
                                                     }
                                                %>
                                                <form action="MainController" >
                                                    <div class="col-md-3">
                                                        <div class="input-group">
                                                            <input type="text" class="form-control" placeholder="Search..." name="searchText" value="<%= search%>">
                                                            <div class="input-group-append">
                                                                <button class="btn btn-outline-secondary" type="submit" name="action" value="Search Order">Search</button> 
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </form>

                                        <table class="table align-items-center table-flush">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th class="text-center" >Order ID</th>
                                                    <th class="text-center">Customer ID</th>
                                                    <th class="text-center">Order Date</th>
                                                    <th class="text-center">Total</th>
                                                    <th class="text-left">Status</th>
                                                    <th class="text-left">Action</th>
                                                </tr>
                                            </thead>
                                            <%
                                                
                                               List<OrderDTO> orderList = (List<OrderDTO>) request.getAttribute("LIST_ORDER");
                                               NumberFormat formatter = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
                                               if (orderList != null) {
                                                   for (OrderDTO order : orderList) {
                                            %>
                                            <tbody id="tableBody">
                                                <tr>
                                                    <td class="text-center"><a href="MainController?action=ViewOrderDetail&orderID=<%= order.getOrderID()%>"><%= order.getOrderID() %></a></td>
                                                    <td class="text-center"><%= order.getCustID() %></td>
                                                    <td class="text-center"><%= order.getOrderDate() %></td>
                                                    <td class="text-center"><%= formatter.format(order.getTotal()) %></td>
                                                    <td class="text-left">
                                                        <span class="badge 
                                                              <%= order.getStatus() == 0 ? "badge-secondary" : 
                                                                  order.getStatus() == 1 ? "badge-danger" : 
                                                                  order.getStatus() == 2 ? "badge-warning" : 
                                                                  order.getStatus() == 3 ? "badge-info" : 
                                                                  order.getStatus() == 4 ? "badge-success" : "" %>">
                                                            <%= order.getStatus() == 0 ? "Cancelled" : 
                                                                order.getStatus() == 1 ? "Pending" : 
                                                                order.getStatus() == 2 ? "Processing" : 
                                                                order.getStatus() == 3 ? "Delivering" : 
                                                                order.getStatus() == 4 ? "Completed" : "" %>
                                                        </span>
                                                    </td>  
                                                    <td> 
                                                        <!-- DELETE -->
                                                        <% 
                                                            if (order.getStatus() == 0 || order.getStatus() == 2 || order.getStatus() == 3 || order.getStatus() == 4){  
                                                        %>
                                                        <a href="#" class="btn btn-sm btn-danger disabled" aria-disabled="true">Delete</a> 
                                                        <% 
                                                            } else {  
                                                        %>
                                                        <a href="MainController?action=DeleteOrder&orderID=<%= order.getOrderID()%>&status=0&oldStatus=<%= order.getStatus()%>" class="btn btn-sm btn-danger">Delete</a> 
                                                        <% 
                                                            }
                                                        %>
                                                        <!-- EDIT -->
                                                        <a href="MainController?action=EditOrder&orderID=<%= order.getOrderID()%>" class="btn btn-sm btn-dark">Edit</a>
                                                    </td>
                                                </tr>                                        
                                            </tbody>
                                            <% 
                                                    }
                                                }
                                            %>
                                        </table>
                                        <hr>

                                    </div>
                                    <div class="card-footer"></div>
                                </div>
                            </div>
                        </div>
                        <!--Row-->
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

                        <!---Mode up delete item in voice -->
                        <!-- Modal Xác nhận Xóa -->
                        <div class="modal fade" id="confirmDeleteModal" tabindex="-1" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="confirmDeleteModalLabel">Confirm Delete</h5>
                                    </div>
                                    <div class="modal-body">
                                        Are you sure you want to change this order's status to canceled?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                        <button type="button" class="btn btn-danger" id="confirmDeleteButton">Confirm</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!---Container Fluid-->
                </div>
                <!-- Footer -->
                <!-- Footer -->
            </div>
        </div>

        <!-- Scroll to top -->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <script>
            let ascending = true;

//Select theo status
            document.getElementById('statusSelect').addEventListener('change', function () {
                const status = this.value;
                const tableBody = document.getElementById('tableBody');
                const rows = Array.from(tableBody.rows);

                rows.forEach(row => {
                    const rowStatus = row.querySelector('td:nth-child(5) .badge').textContent.trim();
                    if (status === "Select Status") {
                        row.style.display = '';
                    } else if (rowStatus === status) {
                        row.style.display = '';
                    } else {
                        row.style.display = 'none';
                    }
                });
            });
            // Thêm sự kiện click vào nút xóa trong mỗi dòng
            document.querySelectorAll('.btn-danger').forEach(btn => {
                btn.addEventListener('click', function () {
                    // Hiển thị modal xác nhận xóa
                    $('#confirmDeleteModal').modal('show');

                    // Lưu trữ thông tin dòng cần xóa vào một thuộc tính data để sử dụng sau này
                    const rowToDelete = this.closest('tr');
                    $('#confirmDeleteButton').data('rowToDelete', rowToDelete);
                });
            });

// Thêm sự kiện click vào nút xác nhận xóa trong modal
            document.getElementById('confirmDeleteButton').addEventListener('click', function () {
                // Ẩn modal xác nhận xóa
                $('#confirmDeleteModal').modal('hide');

                // Lấy thông tin dòng cần xóa từ thuộc tính data đã lưu trữ
                const rowToDelete = $('#confirmDeleteButton').data('rowToDelete');

                // Xóa dòng
                rowToDelete.remove();
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
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


    </body>

</html>

