<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
<%
    String id = request.getParameter("id");
    String name = "", studentId = "", program = "", email = "", hobbies = "", introduction = "";

    if (request.getMethod().equals("POST")) {
        name = request.getParameter("name");
        studentId = request.getParameter("studentId");
        program = request.getParameter("program");
        email = request.getParameter("email");
        hobbies = request.getParameter("hobbies");
        introduction = request.getParameter("introduction");
        id = request.getParameter("id");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_profiles", "root", "");
            PreparedStatement ps = conn.prepareStatement("UPDATE profiles SET name=?, student_id=?, program=?, email=?, hobbies=?, introduction=? WHERE id=?");
            ps.setString(1, name); ps.setString(2, studentId); ps.setString(3, program);
            ps.setString(4, email); ps.setString(5, hobbies); ps.setString(6, introduction);
            ps.setInt(7, Integer.parseInt(id));
            ps.executeUpdate();
            conn.close();
            response.sendRedirect("viewProfiles.jsp");
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    } else {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_profiles", "root", "");
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM profiles WHERE id=?");
            ps.setInt(1, Integer.parseInt(id));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                name = rs.getString("name");
                studentId = rs.getString("student_id");
                program = rs.getString("program");
                email = rs.getString("email");
                hobbies = rs.getString("hobbies");
                introduction = rs.getString("introduction");
            }
            conn.close();
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    }
%>
            <div class="card p-4">
                <h4>Edit Profile</h4>
                <form method="POST">
                    <input type="hidden" name="id" value="<%= id %>">
                    <div class="mb-3">
                        <label class="form-label">Name</label>
                        <input type="text" class="form-control" name="name" value="<%= name %>" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Student ID</label>
                        <input type="text" class="form-control" name="studentId" value="<%= studentId %>" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Program</label>
                        <input type="text" class="form-control" name="program" value="<%= program %>">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" class="form-control" name="email" value="<%= email %>" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Hobbies</label>
                        <input type="text" class="form-control" name="hobbies" value="<%= hobbies %>">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Introduction</label>
                        <textarea class="form-control" name="introduction" rows="3"><%= introduction %></textarea>
                    </div>
                    <button type="submit" class="btn btn-success">Save Changes</button>
                    <a href="viewProfiles.jsp" class="btn btn-secondary">Cancel</a>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
