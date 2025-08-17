<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>Table Users</title>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="" />
            <meta name="author" content="" />
            <title>Dashboard - SB Admin</title>
            <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
            <link href="/css/styles.css" rel="stylesheet" />
            <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            <!-- Bootstrap CSS -->
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

            <style>
                body {
                    background-color: #f8f9fa;
                }

                .table-container {
                    max-width: 1200px;
                    /* Độ rộng tối đa của bảng */
                    margin: 50px auto;
                    /* Căn giữa bảng */
                }

                .table thead th,
                .table tbody td {
                    vertical-align: middle;
                    text-align: center;
                }
            </style>
        </head>

        <body>
            <!-- Header -->
            <jsp:include page="../layout/header.jsp" />

            <div id="layoutSidenav">
                <!-- Sidebar -->
                <jsp:include page="../layout/sidebar.jsp" />

                <div id="layoutSidenav_content">
                    <main class="container-fluid px-4">
                        <h1 class="mt-4">Dashboard</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                            <li class="breadcrumb-item active">User</li>
                        </ol>

                        <div class="table-container">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h3>Table Users</h3>
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
                                                    <a href="/admin/user/detail/${user.id}"
                                                        class="btn btn-success btn-sm">View</a>
                                                    <a href="/admin/user/update/${user.id}"
                                                        class="btn btn-warning btn-sm">Update</a>
                                                    <!-- <a href="/admin/user/delete/${user.id}" class="btn btn-danger btn-sm"
                                               onclick="return confirm('Are you sure?');">Delete</a> -->
                                                    <form action="<c:url value='/admin/user/delete/${user.id}'/>"
                                                        method="post" style="display:inline">
                                                        <input type="hidden" name="${_csrf.parameterName}"
                                                            value="${_csrf.token}" />
                                                        <button type="submit" class="btn btn-danger btn-sm"
                                                            onclick="return confirm('Are you sure?')">Delete</button>
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </main>

                    <!-- Footer -->
                    <jsp:include page="../layout/footer.jsp" />
                </div>
            </div>

            <!-- Scripts -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                crossorigin="anonymous"></script>
            <script src="/js/scripts.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
                crossorigin="anonymous"></script>
            <script src="/assets/demo/chart-area-demo.js"></script>
            <script src="/assets/demo/chart-bar-demo.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
                crossorigin="anonymous"></script>
            <script src="/js/datatables-simple-demo.js"></script>
        </body>

        </html>