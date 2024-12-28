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
    <title>Register - SB Admin</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="bg-primary">
<div id="layoutAuthentication">
    <div id="layoutAuthentication_content">
        <main>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-7">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header"><h3 class="text-center font-weight-light my-4">Create Account</h3></div>
                            <div class="card-body">
                                <form:form method="post"
                                      action="/handleRegister"
                                      modelAttribute="registerDTO">
                                    <c:set var="emailHasBindError">
                                        <form:errors path="email" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <c:set var="confirmPassHasError">
                                        <form:errors path="confirmPassword" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <c:set var="firstnamePassHasError">
                                        <form:errors path="firstName" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <c:set var="lastnamePassHasError">
                                        <form:errors path="lastName" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <form:input class="form-control ${not empty firstnamePassHasError? 'is-invalid':''}" path="firstName" type="text" placeholder="Enter your first name" />
                                                <label class="form-label">First name</label>
                                                    ${firstnamePassHasError}
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <form:input class="form-control ${not empty lastnamePassHasError? 'is-invalid':''}" path="lastName" type="text" placeholder="Enter your last name" />
                                                <label class="form-label">Last name</label>
                                                    ${lastnamePassHasError}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <form:input type="email" class="form-control ${not empty emailHasBindError? 'is-invalid':''}" path="email"/>
                                        <label class="form-label">Email address</label>
                                            ${emailHasBindError}
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <form:input class="form-control" path="password" type="password" placeholder="Create a password" />
                                                <label class="form-label">Password</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <form:input class="form-control ${not empty confirmPassHasError? 'is-invalid':''}" path="confirmPassword" type="password"  />
                                                <label class="form-label">Confirm Password</label>
                                                ${confirmPassHasError}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mt-4 mb-0">
                                        <div class="d-grid"><button class="btn btn-primary btn-block" type="submit">Create Account</button></div>
                                    </div>
                                </form:form>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </main>
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