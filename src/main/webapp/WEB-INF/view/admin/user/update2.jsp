<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update User</title>
    <!-- Latest compiled and minified CSS -->
<link 
rel="stylesheet" 
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

<!-- Latest compiled JavaScript -->
<script 
src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
</script>

<!-- jQuery -->
<script 
src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js">

</script>
<!-- <link rel="stylesheet" href="/css/demo.css"> -->
</head>
<body>
    <div >
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-6 col-12 mx-auto">
                    <div class="card shadow-sm border-0">
                        <div class="card-body">
                            <h3 class="text-center mb-4">Update User</h3>
                            <hr>
                            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                            <form:form action="/admin/user/update" method="post" modelAttribute="user" class="form">
                            
                            <!-- Hidden field for ID -->
                            <form:hidden path="id" />

                            <!-- Email -->
                            <div class="mb-3">
                                <label for="email" class="form-label">Email:</label>
                                <form:input path="email" id="email" type="email" class="form-control" placeholder="Enter your email" required="true"/>
                            </div>
                        
                            <!-- Password -->
                            <!-- <div class="mb-3">
                                <label for="password" class="form-label">Password:</label>
                                <form:password path="password" id="password" class="form-control" placeholder="Enter your password" required="true" />
                            </div>
                         -->
                            <!-- Full Name -->
                            <div class="mb-3">
                                <label for="fullname" class="form-label">Full Name:</label>
                                <form:input path="fullname" id="fullname" type="text" class="form-control" placeholder="Enter your full name" />
                            </div>
                        
                            <!-- Address -->
                            <div class="mb-3">
                                <label for="address" class="form-label">Address:</label>
                                <form:input path="address" id="address" type="text" class="form-control" placeholder="Enter your address" />
                            </div>
                        
                            <!-- Phone Number -->
                            <div class="mb-3">
                                <label for="phone" class="form-label">Phone Number:</label>
                                <form:input path="phone" id="phone" type="text" class="form-control" placeholder="Enter your phone number" />
                            </div>
                        
                            

                            <!-- Submit Button -->
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary btn-lg">Update User</button>
                            </div>
                        
                        </form:form>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
</body>
</html>
