
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>List User</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp"/>
<div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp"/>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Manager User</h1><br>
                <a href="/admin/index">DashBoard</a>/
                <a href="/admin/user">User</a>

                <div class="mt-5">

                    <div class="row">
                        <div class="d-flex justify-content-between">
                            <div><h3>Table User</h3></div>
                            <div><a href="/admin/user/create" class="btn btn-primary">Create User</a></div>
                        </div><hr>
                        <div class="col-md-12 col-12 mx-auto">
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">EMAIL</th>
                                    <th scope="col">FULLNAME</th>
                                    <th scope="col">ROLE</th>
                                    <th scope="col">Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="listUser" items="${listUsers}">
                                    <tr>
                                        <th scope="row">${listUser.id}</th>
                                        <td>${listUser.email}</td>
                                        <td>${listUser.fullName}</td>
                                        <td>${listUser.role.getName()}</td>
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
            </div>
        </main>
        <jsp:include page="../layout/footer.jsp" />
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="/js/chart-area-demo.js"></script>
<script src="/js/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="/js/datatables-simple-demo.js"></script>
</body>
</html>



