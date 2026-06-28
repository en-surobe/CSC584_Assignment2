<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_profiles", "root", "");
        PreparedStatement ps = conn.prepareStatement("DELETE FROM profiles WHERE id=?");
        ps.setInt(1, Integer.parseInt(id));
        ps.executeUpdate();
        conn.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
    response.sendRedirect("viewProfiles.jsp");
%>
