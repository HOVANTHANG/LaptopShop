
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
    <title>Update Order</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>
        $(document).ready(() => {
            const avatarFile = $("#avatarFile");
            avatarFile.change(function (e) {
                const imgURL = URL.createObjectURL(e.target.files[0]);
                $("#avatarPreview").attr("src", imgURL);
                $("#avatarPreview").css({"display": "block"});
                $("#avatarAlterview").css({"display":"none"});
            });
        });
    </script>
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
                <a href="/admin/product/update">Update</a>


                <div class="container mt-5">
                    <div class="row">
                        <div class="col-md-6 col-12 mx-auto">
                            <h1>Update a product</h1><hr>
                            <form:form method="post"
                                       action="/admin/order/update"
                                       modelAttribute="order"
                                       class="row">
                                <div class="mb-3 col-md-6 col-12">
                                    <label class="form-label">Order id:</label>
                                    <form:input type="text" class="form-control" path="id" readonly="true"/>
                                </div>
                                <div class="mb-3 col-md-6 col-12">
                                    <label class="form-label">Price:</label>
                                    <form:input type="number" class="form-control" path="totalPrice" readonly="true"/>
                                </div>
                                <div class="mb-3 col-md-12 col-12">
                                    <label class="form-label">User</label>
                                    <form:input type="text" class="form-control" path="user.fullName" readonly="true"/>
                                </div>
                                <div class="mb-3 col-md-6 col-12">
                                    <label class="form-label">Status:</label>
                                    <form:select class="form-select" path="status">
                                        <option selected="${order.status}">${order.status}</option>
                                        <form:option value="PENDING">PENDING</form:option>
                                        <form:option value="SHIPPING">SHIPPING</form:option>
                                        <form:option value="COMPLETE">COMPLETE</form:option>
                                        <form:option value="CANCLE">CANCLE</form:option>
                                    </form:select>
                                </div>

                                <button type="submit" class="btn btn-warning">Update</button>
                            </form:form>
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




