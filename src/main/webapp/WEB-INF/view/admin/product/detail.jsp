<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Product Detail</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

  <!-- SB Admin & Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
  <link href="/css/styles.css" rel="stylesheet" />
  <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

  <style>
    :root { --radius: .9rem; }
    /* Ảnh luôn chuẩn, không tràn cột */
    .thumb-wrap .ratio { border-radius: var(--radius); overflow: hidden; }
    .object-cover { width:100%; height:100%; object-fit:cover; display:block; }

    /* Hộp thông tin bên phải */
    .meta-box{
      background:#fff; border:1px dashed #e5e7eb; border-radius:.75rem;
      padding:.65rem 1rem; display:flex; align-items:center; justify-content:space-between;
      gap:1rem; position:relative; z-index:1;
    }
    .meta-label{ color:#6b7280; }
    .meta-value{ font-weight:700; }

    /* Card cao bằng nhau */
    .equal .card{ height:100%; }
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
          <li class="breadcrumb-item"><a href="/admin/product">Product</a></li>
          <li class="breadcrumb-item active">Detail</li>
        </ol>

        <div class="container mt-3">
          <div class="row">
            <div class="col-lg-10 col-12 mx-auto">
              <div class="card shadow-sm border-0 mb-4">
                <div class="card-body">
                  <!-- Header hàng đầu -->
                  <div class="d-flex flex-wrap align-items-center justify-content-between gap-2 mb-3">
                    <h3 class="mb-0">
                      <i class="fa-solid fa-box-open me-2 text-primary"></i>
                      <c:out value="${product.name}"/>
                    </h3>
                    <div class="d-flex gap-2">
                      <c:if test="${not empty product.id}">
                        <a href="/admin/product/edit/${product.id}" class="btn btn-outline-secondary btn-sm">
                          <i class="fa-regular fa-pen-to-square me-1"></i>Edit
                        </a>
                      </c:if>
                      <a href="/admin/product" class="btn btn-primary btn-sm">
                        <i class="fa-solid fa-list me-1"></i>List
                      </a>
                    </div>
                  </div>
                  <hr/>

                  <!-- 2 cột: ảnh & thông tin (đã căn đều) -->
                  <div class="row g-4 align-items-stretch equal">
                    <!-- Cột ảnh -->
                    <div class="col-lg-6">
                      <div class="card border-0 shadow-sm h-100">
                        <div class="card-body p-3 thumb-wrap">
                          <div class="ratio ratio-16x9">
                            <c:choose>
                              <c:when test="${not empty product.image}">
                                <c:url value="/resources/images/product/${product.image}" var="imgSrc"/>
                                <img src="${imgSrc}" alt="<c:out value='${product.name}'/>" class="object-cover">
                              </c:when>
                              <c:otherwise>
                                <img src="/client/img/single-item.jpg" alt="no-image" class="object-cover">
                              </c:otherwise>
                            </c:choose>
                          </div>
                        </div>
                      </div>
                    </div>

                    <!-- Cột thông tin -->
                    <div class="col-lg-6">
                      <div class="card border-0 shadow-sm h-100">
                        <div class="card-body">
                          <div class="row gy-2">
                            <div class="col-12">
                              <div class="meta-box">
                                <span class="meta-label">Factory / Brand</span>
                                <span class="meta-value"><c:out value="${product.factory}"/></span>
                              </div>
                            </div>
                            <div class="col-12">
                              <div class="meta-box">
                                <span class="meta-label">Target audience</span>
                                <span class="meta-value"><c:out value="${product.target}"/></span>
                              </div>
                            </div>
                            <div class="col-12">
                              <div class="meta-box">
                                <span class="meta-label">Sold</span>
                                <span class="meta-value"><c:out value="${product.sold}"/></span>
                              </div>
                            </div>
                            <div class="col-12">
                              <div class="meta-box">
                                <span class="meta-label">Price</span>
                                <span class="meta-value">
                                  <fmt:formatNumber value="${product.price}" type="number" minFractionDigits="0" maxFractionDigits="2"/> $
                                </span>
                              </div>
                            </div>
                          </div>

                          <div class="mt-4">
                            <h5 class="mb-2">Short description</h5>
                            <p class="text-muted mb-0"><c:out value="${product.shortDesc}"/></p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>

                  <!-- Detailed description -->
                  <div class="mt-4">
                    <h5 class="mb-2">Detailed description</h5>
                    <div class="border rounded p-3 bg-white">
                      <p class="mb-0"><c:out value="${product.detailDesc}"/></p>
                    </div>
                  </div>

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
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
  <script src="/js/scripts.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
  <script src="/assets/demo/chart-area-demo.js"></script>
  <script src="/assets/demo/chart-bar-demo.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
  <script src="/js/datatables-simple-demo.js"></script>
</body>
</html>
