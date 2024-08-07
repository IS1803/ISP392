<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.mycompany.isp392.brand.BrandDTO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Manage Brands</title>
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="AD_css/ruang-admin.min.css" rel="stylesheet">
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
                    <!-- Header -->
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
                    <!-- Container Fluid-->
                    <div class="container-fluid" id="container-wrapper">
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-900" style="font-weight: bold">Brands</h1>
                        </div>
                        <div class="d-flex justify-content-end mb-4">
                            <a href="AD_AddBrands.jsp" class="btn btn-danger" style="background: #C43337;">Add new brands</a>
                        </div>
                        <div class="row mb-3" style="margin-left: 150px">
                            <!-- Invoice Example -->
                            <div class="col-lg-10 mb-4">
                                <div class="card">
                                    <div class="py-3 d-flex flex-row align-items-center justify-content-between">
                                    </div>
                                    <div class="table-responsive">                                
                                        <div class="row mb-4 mx-5 justify-content-md-start">
                                            <div class="col-md-3">
                                                <div class="input-group">
                                                    <select id="brandSelect" class="custom-select">
                                                        <option value="Select Brand">Select Brand</option>
                                                        <% 
                                                        List<BrandDTO> brands = (List<BrandDTO>) request.getAttribute("BRAND_LIST");
                                                        if (brands != null) {
                                                            for (BrandDTO brand : brands) {
                                                        %>
                                                        <option value="<%= brand.getBrandName() %>"><%= brand.getBrandName() %></option>
                                                        <% 
                                                            }
                                                        }
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <select id="statusSelect" class="custom-select">
                                                    <option value="Select Status">Select Status</option>
                                                    <option value="Available">Available</option>
                                                    <option value="Deleted">Deleted</option>
                                                </select>
                                            </div>
                                            <div class="col">
                                                <form action="MainController" method="post">
                                                    <div class="input-group" style="auto">
                                                        <input type="text" name="searchText" class="form-control" placeholder="Search...">
                                                        <div class="input-group-append">
                                                            <button class="btn btn-outline-secondary" type="submit" name="action" value="Search_Brand">Search</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                        <table class="table align-items-center table-flush">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th class="text-center">ID</th>
                                                    <th class="text-center">
                                                        <button class="btn p-0" onclick="sortTable()">Brand Name <span id="sortIconProduct">▲</span></button>
                                                    </th>
                                                    <th class="text-center">Image</th>
                                                    <th class="text-center">Status</th>
                                                    <th class="text-center">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody id="tableBody">
                                                <% 
                                                if (brands != null) {
                                                    for (BrandDTO brand : brands) {
                                                %>
                                                <tr>
                                                    <td class="text-center"><%= brand.getBrandID() %></td>
                                                    <td class="text-center"><%= brand.getBrandName() %></td>
                                                    <td class="text-center"><img src="<%= brand.getImage() %>" alt="Brand Image" style="max-width: 100px; max-height: 100px;"></td>
                                                    <td class="text-center"><span class="badge <%= brand.getStatus() == 1 ? "badge-success" : "badge-warning" %>"><%= brand.getStatus() == 1 ? "Available" : "Deleted" %></span></td>
                                                    <td class="text-center action-buttons">
                                                        <form action="MainController" method="post" style="display:inline;">
                                                        <% if (brand.getStatus() == 1) { %>
                                                            <button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#confirmDeleteModal" data-id="<%= brand.getBrandID() %>" data-status="<%= brand.getStatus() %>">Delete</button>
                                                        <% } else { %>
                                                            <button type="button" class="btn btn-sm btn-danger delete-btn-disabled" disabled aria-disabled="true">Delete</button>
                                                        <% } %>
                                                            <input type="hidden" name="id" value="<%= brand.getBrandID() %>">
                                                            <input type="hidden" name="brandID" value="<%= brand.getBrandID() %>">
                                                            <button type="submit" class="btn btn-sm btn-dark" name="action" value="Edit_Brand_Page">Edit</button>
                                                        </form>
                                                    </td>
                                                </tr>
                                                <% 
                                                    }
                                                } else {
                                                %>
                                                <tr>
                                                    <td colspan="5" class="text-center">No brands found</td>
                                                </tr>
                                                <% 
                                                }
                                                %>
                                            </tbody>
                                        </table>
                                        <hr>
                                    </div>                                  
                                </div>
                            </div>
                        </div>
                        <!--Row-->
                        <!-- Modal Logout -->
                        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelLogout" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabelLogout">Ohh No!</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <p>Are you sure you want to logout?</p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Cancel</button>
                                        <a href="login.html" class="btn btn-primary">Logout</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!---Modal to confirm delete action -->
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
                                            <input type="hidden" name="status" id="modalStatus" value="">
                                            <input type="hidden" name="delete" value="delete">
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
                                        <span id="successMessage"><%= request.getAttribute("SUCCESS_MESSAGE") %></span>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <% } %>
                        <!-- Scroll to top -->
                        <a class="scroll-to-top rounded" href="#page-top">
                            <i class="fas fa-angle-up"></i>
                        </a>
                        <script>
                            let ascending = true;

                            function sortTable() {
                                const tableBody = document.getElementById('tableBody');
                                const rows = Array.from(tableBody.querySelectorAll('tr'));

                                rows.sort((a, b) => {
                                    const cellA = a.querySelectorAll('td')[1].textContent.trim();
                                    const cellB = b.querySelectorAll('td')[1].textContent.trim();

                                    if (ascending) {
                                        return cellA.localeCompare(cellB);
                                    } else {
                                        return cellB.localeCompare(cellA);
                                    }
                                });

                                rows.forEach(row => tableBody.appendChild(row));

                                ascending = !ascending;
                                document.getElementById('sortIconProduct').textContent = ascending ? '▲' : '▼';
                            }

                            document.getElementById('brandSelect').addEventListener('change', function () {
                                const name = this.value;
                                const tableBody = document.getElementById('tableBody');
                                const rows = Array.from(tableBody.rows);

                                rows.forEach(row => {
                                    const rowBrand = row.querySelector('td:nth-child(2)').textContent.trim();
                                    if (name === "Select Brand") {
                                        row.style.display = '';
                                    } else if (rowBrand === name) {
                                        row.style.display = '';
                                    } else {
                                        row.style.display = 'none';
                                    }
                                });
                            });

                            document.getElementById('statusSelect').addEventListener('change', function () {
                                const status = this.value;
                                const tableBody = document.getElementById('tableBody');
                                const rows = Array.from(tableBody.rows);

                                rows.forEach(row => {
                                    const rowStatus = row.querySelector('td:nth-child(4) .badge').textContent.trim();
                                    if (status === "Select Status") {
                                        row.style.display = '';
                                    } else if (rowStatus === status) {
                                        row.style.display = '';
                                    } else {
                                        row.style.display = 'none';
                                    }
                                });
                            });

                            document.querySelectorAll('.btn-danger[data-toggle="modal"]').forEach(btn => {
                                btn.addEventListener('click', function () {
                                    const id = this.getAttribute('data-id');
                                    const status = this.getAttribute('data-status');
                                    document.getElementById('modalID').value = id;
                                    document.getElementById('modalStatus').value = status;
                                    document.getElementById('deleteForm').action = 'DeleteBrandController';
                                });
                            });

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
                        <script src="AD_js/ruang-admin.min.js"></script>
                        <script src="vendor/chart.js/Chart.min.js"></script>
                        <script src="AD_js/demo/chart-area-demo.js"></script>
                        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
                        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDzwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
