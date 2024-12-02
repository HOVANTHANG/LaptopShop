<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Document</title>
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="/css/demo.css" rel="stylesheet">



</head>
<body>
<div class="container mt-5">
    <div class="row">
        <div class="col-md-6 col-12 mx-auto">
            <h1>Detail user</h1><hr>
            <div class="mb-3">
                <label class="form-label">Email address:</label><br>
                <label class="form-label">${user.email}</label>
            </div>
            <div class="mb-3">
                <label class="form-label">Password:</label><br>
                <label class="form-label">${user.password}</label>
            </div>
            <div class="mb-3">
                <label class="form-label">Phone Number:</label><br>
                <label class="form-label">${user.phone}</label>
            </div>
            <div class="mb-3">
                <label class="form-label">Full Name:</label><br>
                <label class="form-label">${user.fullName}</label>
            </div>
            <div class="mb-3">
                <label class="form-label">Address:</label><br>
                <label class="form-label">${user.address}</label>
            </div>

        </div>
    </div>
</div>
</body>
</html>