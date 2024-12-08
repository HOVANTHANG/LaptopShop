



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
    <title>Create Product</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp"/>
<div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp"/>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Manager Product</h1><br>
                <a href="/admin/index">DashBoard</a>/
                <a href="/admin/products">Product</a>/
                <a href="/admin/product/create">Create</a>


                <div class="container mt-5">
                    <div class="row">
                        <div class="col-md-6 col-12 mx-auto">
                            <h1>Create a user</h1><hr>
                            <form:form modelAttribute="product"
                                       enctype="multipart/form-data"
                                       class="row">
                                <form:input type="hidden" class="form-control" path="id" readonly="true"/>
                                <div class="mb-3 col-md-6 col-12">
                                    <label class="form-label">Name:</label>
                                    <form:input type="readonly" class="form-control" path="name" readonly="true"/>
                                </div>
                                <div class="mb-3 col-md-6 col-12">
                                    <label class="form-label">Price:</label>
                                    <form:input type="number" class="form-control" path="price" readonly="true"/>
                                </div>
                                <div class="mb-3 col-md-12 col-12">
                                    <label class="form-label">Detail description:</label>
                                    <form:input type="text" class="form-control" path="detailDesc" readonly="true"/>
                                </div>
                                <div class="mb-3 col-md-6 col-12">
                                    <label class="form-label">Short description:</label>
                                    <form:input type="text" class="form-control" path="shortDesc" readonly="true"/>
                                </div>
                                <div class="mb-3 col-md-12 col-12">
                                    <label class="form-label">Quantity:</label>
                                    <form:input type="number" class="form-control" path="quantity" readonly="true"/>
                                </div>
                                <div class="mb-3 col-md-6 col-12">
                                    <label class="form-label">Factory</label>
                                    <form:input type="text" class="form-control" path="factory" readonly="true"/>
                                </div>
                                <div class="mb-3 col-md-6 col-12">
                                    <label class="form-label">Target:</label>
                                    <form:input type="text" class="form-control" path="target" readonly="true"/>
                                </div>
                                <%--                                <div class="mb-3 col-md-12 col-12">--%>
                                <%--                                    <label for="avatarFile" class="form-label">Avatar</label>--%>
                                <%--                                    <input class="form-control" type="file"--%>
                                <%--                                           accept=".png, .jpg , .jpeg"--%>
                                <%--                                           name="fileAnh"--%>
                                <%--                                    />--%>
                                <%--                                </div>--%>
                                <div class="col-12 mb-3">
                                    <img style="max-height: 250px;" src="/images/product/${fileAnh}"
                                         id="avatarAlterview" />
                                </div>
                            </form:form>
                           <a href="/admin/products" class="btn btn-primary">Back</a>
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




