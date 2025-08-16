<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Detail</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Dashboard - SB Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script> 
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .detail-card {
            max-width: 600px;
            margin: 50px auto;
        }
        .detail-label {
            font-weight: bold;
            width: 150px;
        }
        .detail-value {
            flex: 1;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="card detail-card shadow-sm">
        <div class="card-header bg-primary text-white">
            <h4 class="mb-0">User Detail</h4>
        </div>
        <div class="card-body">
            <div class="d-flex mb-3">
                <div class="detail-label">Avatar:</div>
                <div class="detail-value">
                    <c:if test="${not empty user.avatar}">
                        <img src="/images/avatar/${user.avatar}" 
                             alt="Avatar" 
                             style="max-width:150px; max-height:150px; border-radius:10px; border:1px solid #ccc;">
                    </c:if>
                    <c:if test="${empty user.avatar}">
                        <span class="text-muted">No avatar</span>
                    </c:if>
                </div>
            </div>
            
            <div class="d-flex mb-3">
                <div class="detail-label">ID:</div>
                <div class="detail-value">${user.id}</div>
            </div>
            <div class="d-flex mb-3">
                <div class="detail-label">Full Name:</div>
                <div class="detail-value">${user.fullname}</div>
            </div>
            <div class="d-flex mb-3">
                <div class="detail-label">Email:</div>
                <div class="detail-value">${user.email}</div>
            </div>
            <div class="d-flex mb-3">
                <div class="detail-label">Role:</div>
                <div class="detail-value">
                    <c:if test="${user.role.id == 1}">ADMIN</c:if>
                    <c:if test="${user.role.id != 1}">USER</c:if>
                </div>
            </div>
            
            <div class="d-flex mb-3">
                <div class="detail-label">Address:</div>
                <div class="detail-value">${user.address}</div>
            </div>
        </div>
        <div class="card-footer d-flex justify-content-end gap-2">
            <a href="/admin/user" class="btn btn-secondary">Back</a>
            <a href="/admin/update/${user.id}" class="btn btn-warning">Update</a>
            <a href="/admin/user/delete/${user.id}" class="btn btn-danger"
               onclick="return confirm('Are you sure you want to delete this user?');">Delete</a>
        </div>
    </div>
</div>

</body>
</html>
