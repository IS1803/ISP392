<%-- 
    Document   : systemManager
    Created on : Jun 11, 2024, 10:58:13 AM
    Author     : Oscar
--%>

<%@page import="java.util.List"%>
<%@page import="com.mycompany.isp392.user.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>System Manager Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || 1 != loginUser.getRoleID()) {
                response.sendRedirect("US_SignIn.jsp");
                return;
            }
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        <h1> Welcome: <%= loginUser.getUserName()%>  </h1>
        <form action="MainController">
            Search:<input type="text" name="search" value="<%= search%>"/>
            <input type="submit" name="action" value ="Search_User"/>
        </form>
        <form> <input type="submit" name="action" value="Add_Employee_View"/></form>
            <%
                List<UserDTO> listUser = (List<UserDTO>) request.getAttribute("LIST_USER");
                if (listUser != null) {
                    if (listUser.size() > 0) {
            %>
        <table border="1">
            <thead>
                <tr>
                    <th>NO</th>
                    <th>User ID</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Role</th>
                    <th>Phone Number</th>
                    <th>Status</th>
                    <th>Edit</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (UserDTO user : listUser) {
                %>
                <tr>
                    <td><%= count++%></td>
                    <td><%= user.getUserID()%></td>
                    <td><%= user.getUserName()%></td>
                    <td><%= user.getEmail()%></td>
                    <td><%= user.getPassword()%></td>
                    <td>
                        <%
                            int roleID = user.getRoleID();
                            String roleName = "";
                            switch (roleID) {
                                case 1:
                                    roleName = "System Manager";
                                    break;
                                case 2:
                                    roleName = "Shop Manager";
                                    break;
                                case 3:
                                    roleName = "Shop Staff";
                                    break;
                                case 4:
                                    roleName = "Customer";
                                    break;
                                default:
                                    roleName = "Unknown Role";
                            }
                        %>
                        <%= roleName%>
                    </td>
                    <td><%= user.getPhone()%></td>
                    <td><%= (user.getStatus() == 1) ? "Active" : "Inactive"%></td>
                    <td>
                        <form action="MainController" method="POST">
                            <%
                                if(roleID==4){
                            %>
                            <input type="hidden" name="userID" value="<%= user.getUserID()%>">
                            <input type="hidden" name="action" value="EditCustomerPage">
                            <button type="submit" class="btn btn-danger">Edit</button>
                            <%
                                }else{
                            %>
                            <input type="hidden" name="userID" value="<%= user.getUserID()%>">
                            <input type="hidden" name="action" value="EditEmployeePage">
                            <button type="submit" class="btn btn-danger">Edit</button>
                            <%
                                }
                            %>
                        </form>
                    <td>
                        <a href="MainController?action=DeleteUser&UserID=<%= user.getUserID() %>"> Delete</a>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <%
                }
            }
        %>
    </body>
</html>
