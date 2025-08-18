<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Update Product</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!-- SB Admin & Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <style>
        #imagePreview {
            max-width: 500px;   /* ảnh không rộng quá 500px */
            max-height: 250px;  /* ảnh không cao quá 250px */
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
                    <li class="breadcrumb-item active">Product</li>
                </ol>

                <!-- Form Create Product -->
                <div class="container mt-4">
                    <div class="row">
                        <div class="col-md-8 col-12 mx-auto">
                            <div class="card shadow-sm border-0">
                                <div class="card-body">
                                    <h3 class="text-center mb-4">Upadate a product</h3>
                                    <hr>
                                    <div class="detail-label">Avatar:</div>
                                    <div class="detail-value">
                                        <c:if test="${not empty newProduct.image}">
                                            <img src="/images/product/${newProduct.image}" 
                                                 alt="Avatar" 
                                                 style="max-width:150px; max-height:150px; border-radius:10px; border:1px solid #ccc;">
                                        </c:if>
                                        <c:if test="${empty newProduct.image}">
                                            <span class="text-muted">No avatar</span>
                                        </c:if>
                                    </div>
                                    <form:form action="/admin/product/update" method="post"
                                                modelAttribute="newProduct" class="form" enctype="multipart/form-data">

                                        <!-- Hidden field for product ID -->
                                        <form:hidden path="id" />

                                        <!-- Collect errors theo format bạn dùng -->
                                        <c:set var="errorName">
                                            <form:errors path="name" cssClass="invalid-feedback" />
                                        </c:set>
                                        <c:set var="errorPrice">
                                            <form:errors path="price" cssClass="invalid-feedback" />
                                        </c:set>
                                        <c:set var="errorShortDesc">
                                            <form:errors path="shortDesc" cssClass="invalid-feedback" />
                                        </c:set>
                                        <c:set var="errorDetailDesc">
                                            <form:errors path="detailDesc" cssClass="invalid-feedback" />
                                        </c:set>
                                        <c:set var="errorSold">
                                            <form:errors path="sold" cssClass="invalid-feedback" />
                                        </c:set>
                                        <c:set var="errorFactory">
                                            <form:errors path="factory" cssClass="invalid-feedback" />
                                        </c:set>
                                        <c:set var="errorTarget">
                                            <form:errors path="target" cssClass="invalid-feedback" />
                                        </c:set>

                                        <div class="row">
                                            <!-- Name -->
                                            <div class="col-md-6 mb-3">
                                                <label for="name" class="form-label">Product name:</label>
                                                <form:input path="name" id="name" type="text"
                                                    class="form-control ${not empty errorName ? 'is-invalid':''}"
                                                    placeholder="Enter product name" />
                                                ${errorName}
                                            </div>

                                            <!-- Price -->
                                            <div class="col-md-6 mb-3">
                                                <label for="price" class="form-label">Price:</label>
                                                <form:input path="price" id="price" type="number" step="0.01" min="0.01"
                                                    class="form-control ${not empty errorPrice ? 'is-invalid':''}"
                                                    placeholder="Enter product price" />
                                                ${errorPrice}
                                            </div>
                                        </div>

                                        <div class="mb-3">
                                            <label for="shortDesc" class="form-label">Short description:</label>
                                            <form:textarea path="shortDesc" id="shortDesc" rows="3"
                                                class="form-control ${not empty errorShortDesc ? 'is-invalid':''}"
                                                placeholder="Short blurb for listing" />
                                            ${errorShortDesc}
                                        </div>

                                        <div class="mb-3">
                                            <label for="detailDesc" class="form-label">Detailed description:</label>
                                            <form:textarea path="detailDesc" id="detailDesc" rows="5"
                                                class="form-control ${not empty errorDetailDesc ? 'is-invalid':''}"
                                                placeholder="Full product details" />
                                            ${errorDetailDesc}
                                        </div>

                                        <div class="row">
                                            <!-- Sold -->
                                            <div class="col-md-6 mb-3">
                                                <label for="sold" class="form-label">Sold count:</label>
                                                <form:input path="sold" id="sold" type="number" min="1"
                                                    class="form-control ${not empty errorSold ? 'is-invalid':''}"
                                                    placeholder="Number of products sold" />
                                                ${errorSold}
                                            </div>

                                            <!-- Factory -->
                                            <div class="col-md-6 mb-3">
                                                <label for="factory" class="form-label">Factory / Brand:</label>
                                                <form:input path="factory" id="factory" type="text"
                                                    class="form-control ${not empty errorFactory ? 'is-invalid':''}"
                                                    placeholder="Factory or brand name" />
                                                ${errorFactory}
                                            </div>
                                        </div>

                                        <div class="mb-3">
                                            <label for="target" class="form-label">Target audience:</label>
                                            <form:input path="target" id="target" type="text"
                                                class="form-control ${not empty errorTarget ? 'is-invalid':''}"
                                                placeholder="Target market (e.g., Women 35+)" />
                                            ${errorTarget}
                                        </div>

                                        <!-- IMAGE AT THE END -->
                                        <div class="mb-3">
                                            <label for="image" class="form-label">Product image:</label>
                                            <input type="file" id="image" name="hoidanitFile"
                                                class="form-control" accept=".png,.jpg,.jpeg" />
                                            <div class="d-flex justify-content-center mt-3">
                                                <img id="imagePreview" src="#" alt="Image Preview" />
                                            </div>
                                        </div>

                                        <!-- Submit -->
                                        <div class="d-grid">
                                            <button type="submit" class="btn btn-primary btn-lg">Update</button>
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

    <!-- Image Preview Script -->
    <script>
        $(document).ready(function () {
            $("#image").on("change", function (e) {
                const file = e.target.files[0];
                if (file) {
                    const imgURL = URL.createObjectURL(file);
                    $("#imagePreview").attr("src", imgURL).show();
                }
            });
        });
    </script>
</body>

</html>
