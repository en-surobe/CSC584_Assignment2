<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Profile Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card p-4">
                <h4 class="mb-3">Profile Saved!</h4>
                <table class="table table-bordered">
                    <tr><th>Name</th><td><%= request.getAttribute("name") %></td></tr>
                    <tr><th>Student ID</th><td><%= request.getAttribute("studentId") %></td></tr>
                    <tr><th>Program</th><td><%= request.getAttribute("program") %></td></tr>
                    <tr><th>Email</th><td><%= request.getAttribute("email") %></td></tr>
                    <tr><th>Hobbies</th><td><%= request.getAttribute("hobbies") %></td></tr>
                    <tr><th>Introduction</th><td><%= request.getAttribute("introduction") %></td></tr>
                </table>
                <a href="index.html" class="btn btn-secondary">Back to Form</a>
                <a href="viewProfiles.jsp" class="btn btn-primary">View All Profiles</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
