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

</head>
<body>
<div class="container mt-5">
    <div class="row">
        <div class="col-md-6 col-12 mx-auto">
            <h1>Are you sure to delete?</h1><hr>
            <div class="mb-3">
                <label class="form-label">Email address:</label><br>
                <label class="form-label">${Userdelete.email}</label>
            </div>
            <div class="mb-3">
                <label class="form-label">Password:</label><br>
                <label class="form-label">${Userdelete.password}</label>
            </div>
            <div class="mb-3">
                <label class="form-label">Phone Number:</label><br>
                <label class="form-label">${Userdelete.phone}</label>
            </div>
            <div class="mb-3">
                <label class="form-label">Full Name:</label><br>
                <label class="form-label">${Userdelete.fullName}</label>
            </div>
            <div class="mb-3">
                <label class="form-label">Address:</label><br>
                <label class="form-label">${Userdelete.address}</label>
            </div>
            <div class="mb-3">
                <form method="post" action="/admin/user/deleteconfirm/${Userdelete.id}">
                    <button type="submit" class="btn btn-danger">Confirm</button>
                    <a class="btn btn-primary" href="/admin/user">No</a>
                </form>

            </div>


        </div>
    </div>
</div>
</body>
</html>