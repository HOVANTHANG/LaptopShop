

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
    <title>Delete User</title>
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
                <a href="/admin/user">User</a>/
                <a href="/admin/user">Delete</a>


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




