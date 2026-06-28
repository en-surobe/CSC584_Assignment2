<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Profiles</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h3>All Profiles</h3>

    <form action="viewProfiles.jsp" method="GET" class="mb-3 d-flex gap-2">
        <input type="text" name="search" class="form-control w-25" placeholder="Search by name or student ID" value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">
        <button type="submit" class="btn btn-primary">Search</button>
        <a href="viewProfiles.jsp" class="btn btn-secondary">Clear</a>
    </form>

    <table class="table table-bordered">
        <thead class="table-dark">
            <tr>
                <th>Name</th><th>Student ID</th><th>Program</th><th>Email</th><th>Hobbies</th><th>Action</th>
            </tr>
        </thead>
        <tbody>
        <%
            String search = request.getParameter("search");
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_profiles", "root", "");
                PreparedStatement ps;
                if (search != null && !search.isEmpty()) {
                    ps = conn.prepareStatement("SELECT * FROM profiles WHERE name LIKE ? OR student_id LIKE ?");
                    ps.setString(1, "%" + search + "%");
                    ps.setString(2, "%" + search + "%");
                } else {
                    ps = conn.prepareStatement("SELECT * FROM profiles");
                }
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
        %>
            <tr>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("student_id") %></td>
                <td><%= rs.getString("program") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("hobbies") %></td>
                <td>
                    <a href="editProfile.jsp?id=<%= rs.getInt("id") %>" class="btn btn-sm btn-warning">Edit</a>
                    <a href="deleteProfile.jsp?id=<%= rs.getInt("id") %>" class="btn btn-sm btn-danger" onclick="return confirm('Delete this profile?')">Delete</a>
                </td>
            </tr>
        <%
                }
                conn.close();
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        %>
        </tbody>
    </table>
    <a href="index.html" class="btn btn-secondary">Back to Form</a>
</div>
</body>
</html>
