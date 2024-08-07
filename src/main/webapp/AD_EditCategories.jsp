<%-- 
    Document   : EditProduct
    Created on : Jun 3, 2024, 4:15:02 PM
    Author     : jojo
--%>

<%@page import="com.mycompany.isp392.category.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Categories </title>
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
            .btn-custom {
                margin: 0 5px;
            }
            .text-center {
                text-align: center;
            }
            .mb-3 {
                margin-bottom: 1rem;
            }
            .mb-5 {
                margin-bottom: 3rem;
            }
        </style>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    </head>
    <body id="page-top">
        <%
            CategoryDTO category = (CategoryDTO) request.getAttribute("CATEGORY"); 
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
                            <h2 class="text-center mb-5" style="color: #000; font-weight: bold;">Edit Categories</h2>
                            <form id="categoryForm" action="EditCategoryController" method="POST" enctype="multipart/form-data">
                                <input type="hidden" name="categoryID" value="<%= category.getCategoryID()%>" readonly=""/>
                                <input type="hidden" name="oldName" value="<%= category.getCategoryName()%>" readonly=""/>
                                <input type="hidden" name="oldDescription" value="<%= category.getDescription()%>" readonly=""/>
                                <input type="hidden" name="oldStatus" value="<%= category.getStatus()%>" readonly=""/>
                                <input type="hidden" name="oldImage" value="<%= category.getImage()%>" readonly=""/>
                                <div class="form-row">
                                    <div class="form-group col-md-8">
                                        <label for="productName">Category Name</label>
                                        <input type="text" class="form-control" id="categoryName" name="categoryName" value="<%= category.getCategoryName()%>" style="width: 755px;" required="">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="description">Description</label>
                                    <!-- Sử dụng defaultValue để lấy giá trị mặc định của textarea -->
                                    <textarea class="form-control" name="description"  id="description" rows="3" required=""><%= category.getDescription()%></textarea>
                                </div>

                                
                                <div class="form-group">
                                    <label for="image">Category Image</label>
                                    <div class="col-md-3">
                                        <img src="<%= category.getImage() %>" alt="Category Image" class="img-thumbnail" style="max-width: 100px; max-height: 100px; margin-right: 10px;">
                                    </div>
                                    <div class="mt-3">
                                        <input type="file" class="form-control-file" id="image" name="image" style="width: 550px">
                                    </div>
                                </div>

                                <input type="hidden" name="oldStatus" value="<%= category.getStatus()%>" readonly=""/>
                                <div class="form-group">
                                    <label for="status">Status</label>
                                    <select name="status" style="width: 375px" class="form-select form-control" id="status" aria-label=".form-select-sm">
                                        <option value="0" <%= category.getStatus() == 0 ? "selected" : "" %>>Inactive</option>
                                        <option value="1" <%= category.getStatus() == 1 ? "selected" : "" %>>Active</option>
                                    </select>
                                </div>

                                <div class="form-group text-center">
                                    <button type="submit" class="btn btn-danger btn-custom" name="action"  value="Edit_Category">Submit</button>
                                    <button type="button" class="btn btn-secondary btn-custom" onclick="resetForm()">Reset</button>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
                <!-- Footer -->
                <%-- Include your footer file here if available --%>
            </div>
        </div>

        <!-- Include necessary scripts -->
        <script>
            // Hàm reset form
            function resetForm() {
                // Lấy form element
                const form = document.getElementById('categoryForm');

                // Reset form
                form.reset();

                // Đặt lại giá trị mặc định cho textarea (để tránh lỗi về placeholder)
                document.getElementById('description').value = '';
            }

            // Hàm gửi form qua AJAX
            function submitForm() {
                // Lấy giá trị từ các trường input/select/textarea
                const categoryName = document.getElementById("productName").value;
                const parentCategory = document.getElementById("parentCategory").value;
                const description = document.getElementById("description").value;

                // Tạo đối tượng dữ liệu
                const formData = {
                    name: categoryName,
                    parentCategory: parentCategory,
                    description: description
                };

                // Gửi dữ liệu qua AJAX (giả sử sử dụng fetch)
                fetch('https://example.com/api/categories', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify(formData),
                })
                        .then(response => response.json())
                        .then(data => {
                            // Xử lý kết quả từ server (nếu cần)
                            document.getElementById("submitResult").innerHTML = `
                    <h4>Submitted Successfully!</h4>
                    <p>Server response: ${JSON.stringify(data)}</p>
                `;
                        })
                        .catch((error) => {
                            console.error('Error:', error);
                        });
            }
        </script>
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
