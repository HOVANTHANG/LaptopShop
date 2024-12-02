<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>Document</title>
</head>
<body>
<div class="container mt-5">

    <div class="row">
        <div class="d-flex justify-content-between">
            <div><h1>Table User</h1></div>
            <div><a href="/admin/user/create" class="btn btn-primary">Create User</a></div>
        </div><hr>
    <div class="col-md-12 col-12 mx-auto">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">EMAIL</th>
                <th scope="col">FULLNAME</th>
                <th scope="col">Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="listUser" items="${listUsers}">
            <tr>
                <th scope="row">${listUser.id}</th>
                <td>${listUser.email}</td>
                <td>${listUser.fullName}</td>
                <td>
                    <a class="btn btn-success" href="/admin/user/detail/${listUser.id}">View</a></button>
                    <a class="btn btn-warning" href="/admin/user/update/${listUser.id}">Update</a></button>
                    <a class="btn btn-danger" href="/admin/user/delete/${listUser.id}">Delete</a></button>
                </td>
            </tr>
            </c:forEach>

            </tbody>
        </table>

    </div>
    </div>
</div>

</body>
</html>