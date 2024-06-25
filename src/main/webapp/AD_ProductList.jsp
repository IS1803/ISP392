<%-- 
    Document   : ProductList
    Created on : Jun 2, 2024, 4:31:06 PM
    Author     : jojo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Product List</title>
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
                    <!---Header --->

                    <!-- Container Fluid-->
                    <%@include file="AD_header.jsp" %>

                    <div class="container-fluid" id="container-wrapper">
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-900">All Products</h1>
                        </div>
                        <div class="d-flex justify-content-end mb-4">
                             <a href="AD_CreateProduct.jsp" class="btn btn-danger" style="background: #C43337;">Create Product</a>
                            <a href="AD_ProductDetail.jsp" class="btn btn-danger" style="margin-left: 20px; background: #C43337; ">View products detail</a>
                        </div>
                        <div class="row mb-3">
                            <!-- Invoice Example -->
                            <div class="col-xl-12 mb-4">
                                <div class="card">
                                    <div class=" py-3 d-flex flex-row align-items-center justify-content-between">
                                        <!--<h6 class="m-0 font-weight-bold text-primary">Invoice</h6>-->
                                    </div>
                                    <div class="table-responsive">
                                        <form>
                                            <div class="row mb-4 mx-2 justify-content-between">
                                                <div class="col-md-3">
                                                    <div class="input-group">
                                                        <select id="entriesSelect" class="custom-select">
                                                            <option value="Select Entries">Select Entries</option>
                                                            <option value="5">5</option>
                                                            <option value="10">10</option>
                                                            <option value="15">15</option>
                                                            <option value="20">20</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="input-group">
                                                        <select id="brandSelect" class="custom-select">
                                                            <option value="Select Brand">Select Brand</option>
                                                            <option value="Nike">Nike</option>
                                                            <option value="Adidas">Adidas</option>
                                                            <option value="Puma">Puma</option>
                                                            <option value="Vans">Vans</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-md-3">
                                                    <select id="statusSelect" class="custom-select">
                                                        <option value="Select Status">Select Status</option>
                                                        <option value="True">True</option>
                                                        <option value="False">False</option>
                                                    </select>
                                                </div>
                                                </form>
                                                <div class="col-md-3">
                                                    <form action="MainController" method="GET">
                                                        <div class="input-group">
                                                            <input type="text" class="form-control" placeholder="Search..." name="search">
                                                            <div class="input-group-append">
                                                                <button class="btn btn-outline-secondary" type="submit" value="Search_Product">Search</button>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>

                                        <table class="table align-items-center table-flush">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th>ID</th>
                                                    <th>
                                                        <button class="btn p-0" onclick="sortTable()">Name <span id="sortIconProduct">▲</span></button>
                                                    </th>
                                                    <th>
                                                        <button class="btn p-0" onclick="sortBrandTable()">Brand <span id="sortIconProduct">▲</span></button>
                                                    </th>
                                                    <th>
                                                        <button class="btn p-0" onclick="">Category <span id="sortIconProduct"></span></button>
                                                    </th>
                                                    <th>Status</th>
                                                    <th>Number of purchasing</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody id="tableBody">
                                                <tr>
                                                    <td>P1</td>
                                                    <td>Air Jordan 1 Low OG "Silver"</td>
                                                    <td>Nike</td>
                                                    <td>Men</td>
                                                    <td><span class="badge badge-success">True</span></td>
                                                    <td>1000</td>
                                                    <td>
                                                        <a href="#" class="btn btn-sm btn-danger">Delete</a>
                                                        <a href="AD_EditProduct.jsp" class="btn btn-sm btn-dark">Edit</a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>P2</td>
                                                    <td>CONTINENTAL 80 STRIPES SHOES</td>
                                                    <td>Adidas</td>
                                                    <td>Women</td>
                                                    <td><span class="badge badge-success">True</span></td>
                                                    <td>1200</td>
                                                    <td>
                                                        <a href="#" class="btn btn-sm btn-danger">Delete</a>
                                                        <a href="EditProduct.jsp" class="btn btn-sm btn-dark">Edit</a>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>P3</td>
                                                    <td>Unisex Puma X-Playstation Sneakers</td>
                                                    <td>Puma</td>
                                                    <td>Men</td>
                                                    <td><span class="badge badge-success">True</span></td>
                                                    <td>1300</td>
                                                    <td>
                                                        <a href="#" class="btn btn-sm btn-danger">Delete</a>
                                                        <a href="EditProduct.jsp" class="btn btn-sm btn-dark">Edit</a>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>P4</td>
                                                    <td>Nike Air Force 1 '07 EasyOn</td>
                                                    <td>Nike</td>
                                                    <td>Men</td>
                                                    <td><span class="badge badge-warning">False</span></td>
                                                    <td>2</td>
                                                    <td>
                                                        <a href="#" class="btn btn-sm btn-danger">Delete</a>
                                                        <a href="EditProduct.jsp" class="btn btn-sm btn-dark">Edit</a>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>P5</td>
                                                    <td>VANS SLIP ON FLORAL CHECK MARSHMALLOW</td>
                                                    <td>Vans</td>
                                                    <td>Women</td>
                                                    <td><span class="badge badge-warning">False</span></td>
                                                    <td>3</td>
                                                    <td>
                                                        <a href="#" class="btn btn-sm btn-danger">Delete</a>
                                                        <a href="EditProduct.jsp" class="btn btn-sm btn-dark">Edit</a>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>P6</td>
                                                    <td>VANS CLASSIC SLIP-ON BLACK/WHITE</td>
                                                    <td>Vans</td>
                                                    <td>Women</td>
                                                    <td><span class="badge badge-success">True</span></td>
                                                    <td>1300</td>
                                                    <td>
                                                        <a href="#" class="btn btn-sm btn-danger">Delete</a>
                                                        <a href="EditProduct.jsp" class="btn btn-sm btn-dark">Edit</a>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <hr>
                                        <!-- Pagination -->
                                        <nav aria-label="Page navigation">
                                            <ul class="pagination justify-content-center mt-3">
                                                <li class="page-item">
                                                    <a class="page-link" href="#" aria-label="Previous" style="color: #C43337">
                                                        <span aria-hidden="true">&laquo;</span>
                                                    </a>
                                                </li>
                                                <li class="page-item mx-1"><a class="page-link" href="#" style="color: #C43337">1</a></li>
                                                <li class="page-item mx-1"><a class="page-link" href="#" style="color: #C43337">2</a></li>
                                                <li class="page-item mx-1"><a class="page-link" href="#" style="color: #C43337">3</a></li>
                                                <li class="page-item" >
                                                    <a class="page-link" href="#" aria-label="Next" style="color: #C43337">
                                                        <span aria-hidden="true">&raquo;</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </nav>
                                        <!-- End Pagination -->
                                    </div>
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

                        <!---Mode up delete item in voice -->
                        <!-- Modal Xác nhận Xóa -->
                        <div class="modal fade" id="confirmDeleteModal" tabindex="-1" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="confirmDeleteModalLabel">Xác nhận Xóa</h5>
<!--                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">X</button>-->
                                    </div>
                                    <div class="modal-body">
                                        Bạn có chắc chắn muốn xóa mục này không?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                        <button type="button" class="btn btn-danger" id="confirmDeleteButton">Xóa</button>
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

            function sortBrandTable() {
                const tableBody = document.getElementById('tableBody');
                const rows = Array.from(tableBody.querySelectorAll('tr'));

                rows.sort((a, b) => {
                    const cellA = a.querySelectorAll('td')[2].textContent.trim();
                    const cellB = b.querySelectorAll('td')[2].textContent.trim();

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

            document.getElementById('entriesSelect').addEventListener('change', function () {
                const numEntries = parseInt(this.value);
                const tableBody = document.getElementById('tableBody');
                const rows = Array.from(tableBody.rows);

                rows.forEach((row, index) => {
                    if (isNaN(numEntries) || this.value === "Select Entries") {
                        row.style.display = '';
                    } else if (index < numEntries) {
                        row.style.display = '';
                    } else {
                        row.style.display = 'none';
                    }
                });
            });
//Select theo brand
            document.getElementById('brandSelect').addEventListener('change', function () {
                const name = this.value;
                const tableBody = document.getElementById('tableBody');
                const rows = Array.from(tableBody.rows);

                rows.forEach(row => {
                    const rowBrand = row.querySelector('td:nth-child(3)').textContent.trim();
                    if (name === "Select Brand") {
                        row.style.display = '';
                    } else if (rowBrand === name) {
                        row.style.display = '';
                    } else {
                        row.style.display = 'none';
                    }
                });
            });

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

        </script>
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
        <script src="AD_js/ruang-admin.min.js"></script>
        <script src="vendor/chart.js/Chart.min.js"></script>
        <script src="AD_js/demo/chart-area-demo.js"></script>  
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    
                     <!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>                  
    </body>
    
</html>