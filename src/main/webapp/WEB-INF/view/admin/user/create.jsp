<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <title>Create User</title>
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

                <!-- SB Admin & Bootstrap -->
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

                <style>
                    #avatarPreview {
                        max-width: 500px;
                        /* ảnh không rộng quá 500px */
                        max-height: 250px;
                        /* ảnh không cao quá 250px */
                        width: auto;
                        height: auto;
                        display: none;
                        border: 1px solid #ccc;
                        border-radius: 10px;
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

                            <!-- Form Create User -->
                            <div class="container mt-4">
                                <div class="row">
                                    <div class="col-md-8 col-12 mx-auto">
                                        <div class="card shadow-sm border-0">
                                            <div class="card-body">
                                                <h3 class="text-center mb-4">Create a user</h3>
                                                <hr>

                                                <form:form action="/admin/user/create" method="post"
                                                    modelAttribute="newUser" class="form" enctype="multipart/form-data">
                                                    <c:set var="errorEmail">
                                                                <form:errors path="email" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <c:set var="errorFullname">
                                                                <form:errors path="fullname" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <c:set var="errorPassword">
                                                                <form:errors path="password" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <c:set var="errorPhone">
                                                                <form:errors path="phone" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <div class="row">
                                                        <!-- Email -->
                                                        <div class="col-md-6 mb-3">
                                                            
                                                            <label for="email" class="form-label">Email:</label>
                                                            <form:input path="email" id="email" type="text"
                                                                class="form-control ${not empty errorEmail ? 'is-invalid':''}"
                                                                placeholder="Enter your email"/>
                                                                ${errorEmail}
                                                           
                                                        </div>

                                                        <!-- Password -->
                                                        <div class="col-md-6 mb-3">
                                                            <label for="password" class="form-label">Password:</label>
                                                            <form:password path="password" id="password"
                                                                class="form-control ${not empty errorPassword?'is-invalid':''}" 
                                                                placeholder="Enter your password" />
                                                                ${errorEmail}
                                                            
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <!-- Phone -->
                                                        <div class="col-md-6 mb-3">
                                                            <label for="phone" class="form-label">Phone number:</label>
                                                            <form:input path="phone" id="phone" type="text"
                                                                class="form-control ${not empty errorPhone ? 'is-invalid':''}"
                                                                placeholder="Enter your phone number" />
                                                                ${errorPhone}
                                                        </div>

                                                        <!-- Full Name -->
                                                        <div class="col-md-6 mb-3">
                                                            <label for="fullname" class="form-label">Full Name:</label>
                                                            <form:input path="fullname" id="fullname" type="text"
                                                                class="form-control ${not empty errorFullname ? 'is-invalid':''}"
                                                                placeholder="Enter your full name" />
                                                                ${errorFullname}
                                                        </div>
                                                    </div>

                                                    <!-- Address -->
                                                    <div class="mb-3">
                                                        <label for="address" class="form-label">Address:</label>
                                                        <form:input path="address" id="address" type="text"
                                                            class="form-control" placeholder="Enter your address" />
                                                    </div>

                                                    <div class="row">
                                                        <!-- Role -->
                                                        <div class="col-md-6 mb-3">
                                                            <label for="role" class="form-label">Role:</label>
                                                            <form:select path="role.name" id="role" class="form-select">
                                                                <form:option value="ADMIN">ADMIN</form:option>
                                                                <form:option value="USER">USER</form:option>

                                                            </form:select>
                                                        </div>

        
                                                        <!-- Avatar -->
                                                        <div class="col-md-12 mb-3">
                                                            <label for="avatar" class="form-label">Avatar:</label>
                                                            <input type="file" id="avatar" name="hoidanitFile"
                                                                class="form-control" accept=".png,.jpg,.jpeg" />

                                                            <!-- Khung preview căn giữa -->
                                                            <div class="d-flex justify-content-center mt-3">
                                                                <img id="avatarPreview" src="#" alt="Avatar Preview" />
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <!-- Submit -->
                                                    <div class="d-grid">
                                                        <button type="submit"
                                                            class="btn btn-primary btn-lg">Create</button>
                                                    </div>

                                                </form:form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>

                        <!-- Footer -->
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>

                <!-- Scripts -->
                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

                <!-- Avatar Preview Script -->
                <script>
                    $(document).ready(function () {
                        $("#avatar").on("change", function (e) {
                            const file = e.target.files[0];
                            if (file) {
                                const imgURL = URL.createObjectURL(file);
                                $("#avatarPreview")
                                    .attr("src", imgURL)
                                    .show();
                            }
                        });
                    });
                </script>
            </body>

            </html>