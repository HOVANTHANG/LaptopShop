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
    <h1>Create a user</h1><hr>
            <form:form method="post"
                       action="/admin/user/saveuser"
                       modelAttribute="newUser">
                <div class="mb-3">
                    <label class="form-label">Email address</label>
                    <form:input type="email" class="form-control" path="email"/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <form:input type="password" class="form-control" path="password"/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Phone Number</label>
                    <form:input type="text" class="form-control" path="phone"/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Full Name</label>
                    <form:input type="text" class="form-control" path="fullName"/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Address</label>
                    <form:input type="text" class="form-control" path="address"/>
                </div>

                <button type="submit" class="btn btn-primary">Submit</button>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>