



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
                                       action="/admin/product/updateproduct"
                                       modelAttribute="product"
                                       enctype="multipart/form-data"
                                       class="row">
                                <form:input type="hidden" class="form-control" path="id"/>
                                <div class="mb-3 col-md-6 col-12">
                                    <c:set var="nameHasBindError">
                                        <form:errors path="name" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label class="form-label">Name:</label>
                                    <form:input type="text" class="form-control ${not empty nameHasBindError?'is-invalid':''}" path="name"/>
                                        ${nameHasBindError}
                                </div>
                                <div class="mb-3 col-md-6 col-12">
                                    <c:set var="priceHasBindError">
                                        <form:errors path="price" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label class="form-label">Price:</label>
                                    <form:input type="number" class="form-control ${not empty priceHasBindError?'is-invalid':''}" path="price"/>
                                        ${priceHasBindError}
                                </div>
                                <div class="mb-3 col-md-12 col-12">
                                    <label class="form-label">Detail description:</label>
                                    <form:input type="text" class="form-control" path="detailDesc"/>
                                </div>
                                <div class="mb-3 col-md-6 col-12">
                                    <label class="form-label">Short description:</label>
                                    <form:input type="text" class="form-control" path="shortDesc"/>
                                </div>
                                <div class="mb-3 col-md-12 col-12">
                                    <c:set var="quantityHasBindError">
                                        <form:errors path="quantity" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label class="form-label">Quantity:</label>
                                    <form:input type="number" class="form-control ${not empty quantityHasBindError?'is-invalid':''}" path="quantity"/>
                                        ${quantityHasBindError}
                                </div>
                                <div class="mb-3 col-md-6 col-12">
                                    <label class="form-label">Factory</label>
                                    <form:select class="form-select" path="factory">
                                        <option selected="${product.factory}">${product.factory}</option>
                                        <form:option value="APPLE">Apple</form:option>
                                        <form:option value="WINDOWN">Windown</form:option>
                                    </form:select>
                                </div>
                                <div class="mb-3 col-md-6 col-12">
                                    <label class="form-label">Target:</label>
                                    <form:select class="form-select" path="target">
                                        <option selected="${product.target}">${product.target}</option>
                                        <form:option value="GAMING">Gaming</form:option>
                                        <form:option value="CODE">Code</form:option>
                                    </form:select>
                                </div>
                                <div class="mb-3 col-md-6 col-12">
                                    <label for="avatarFile" class="form-label">Avatar</label>
                                    <input class="form-control" type="file" id="avatarFile"
                                           accept=".png, .jpg , .jpeg"
                                           name="fileAnh"
                                    />
                                </div>
                                <%--                                <div class="mb-3 col-md-12 col-12">--%>
                                <%--                                    <label for="avatarFile" class="form-label">Avatar</label>--%>
                                <%--                                    <input class="form-control" type="file"--%>
                                <%--                                           accept=".png, .jpg , .jpeg"--%>
                                <%--                                           name="fileAnh"--%>
                                <%--                                    />--%>
                                <%--                                </div>--%>
                                <div class="col-12 mb-3">
                                    <img style="max-height: 250px;display: none;" alt="avatar preview"
                                         id="avatarPreview" />
                                </div>
                                <div class="col-12 mb-3">
                                    <img style="max-height: 250px;" src="/images/product/${fileAnh}"
                                         id="avatarAlterview" />
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




