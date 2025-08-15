<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Table users</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .table-container {
            max-width: 1200px; /* Độ rộng tối đa của bảng */
            margin: 50px auto; /* Căn giữa bảng theo chiều ngang */
        }
        .table thead th {
            vertical-align: middle;
            text-align: center;
        }
        .table tbody td {
            vertical-align: middle;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="table-container">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h3>Table users</h3>
        <a href="/admin/user/create" class="btn btn-primary">Create</a>
    </div>

    <div class="table-responsive">
        <table class="table table-bordered table-striped">
            <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Email</th>
                <th>Full Name</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.email}</td>
                        <td>${user.fullname}</td>
                        <td>
                            <a href="/admin/user/detail/${user.id}" class="btn btn-success btn-sm">View</a>
                            <a href="/admin/update/${user.id}" class="btn btn-warning btn-sm">Update</a>
                            <a href="delete?id=1" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?');">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
