<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hello JSP</title>
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
    <h1>Hello from JSP!</h1>
    <p>Giá trị biến eric: <strong>${user}</strong></p>
    <p>Test: This JSP file is working!</p>
    <button type="submit" class>Submit</button>
</body>
</html>
