<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ogani | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="/client/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/client/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/client/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/client/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/client/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/client/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/client/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/client/css/style.css" type="text/css">
</head>

<body>
<jsp:include page="../layout/header.jsp" />



    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="/client/images/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Checkout</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Checkout</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
<div class="container">
<div class="row">
    <div class="col-lg-12">
        <div class="shoping__cart__table">
            <c:if test="${sessionScope.sum!=0}">
                <table>
                    <thead>
                    <tr>
                        <th class="shoping__product">Products</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="cartdetail" items="${cartdetails}" varStatus="status">
                        <tr>
                            <td class="shoping__cart__item">
                                <img class="img-fluid me-5 rounded-circle"
                                     style="height:100px; width:100px;" src="images/product/${cartdetail.product.image}" alt="">
                                <h5><a href="/product/detail/${cartdetail.product.id}" target="_blank" class="btn-outline-success">${cartdetail.product.name}</a></h5>
                            </td>
                            <td class="shoping__cart__price">
                                <p>
                                    <fmt:formatNumber type="number" value="${cartdetail.price}"
                                    />
                                </p>
                            </td>
                            <td class="shoping__cart__quantity">
                                <div class="quantity">
                                    <div class="pro-qty">
                                        <input type="text" value="${cartdetail.quantity}"
                                               data-cart-detail-id="${cartdetail.id}"
                                               data-cart-detail-price="${cartdetail.price}"
                                               data-cart-detail-index="${status.index}"
                                               readonly >
                                    </div>
                                </div>
                            </td>
                            <td class="shoping__cart__total">
                                <p data-cart-detail-id="${cartdetail.id}">
                                    <fmt:formatNumber type="number" value="${cartdetail.price*cartdetail.quantity}"
                                    />
                                </p>

                            </td>
                            <td class="shoping__cart__item__close">
                                <form action="/deleteCart_detail/${cartdetail.id}" method="post">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <button class="btn btn-md rounded-circle bg-light border">

                                        <i class="fa fa-times text-danger"></i>
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </c:if>
            <c:if test="${sessionScope.sum==0}">
                <table>
                    <thead>
                    <tr>
                        <th class="shoping__product">Products</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td colspan="4">
                            <p>Don't have product in Cart Details!</p>
                        </td>
                    </tr>

                    </tbody>
                </table>
            </c:if>
        </div>
    </div>
</div>
</div>


    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h6><span class="icon_tag_alt"></span> Have a coupon? <a href="#">Click here</a> to enter your code
                    </h6>
                </div>
            </div>
            <div class="checkout__form">
                <h4>Recevier Information</h4>
                <form action="/place-order" method="post">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="checkout__input">
                                        <p>Full Name<span>*</span></p>
                                        <input type="text" name="receiverName" required>
                            </div>
                            <div class="checkout__input">
                                        <p>Address<span>*</span></p>
                                        <input type="text" name="receiverAddress" required>
                                    </div>
                            <div class="checkout__input">
                                <p>Phone<span>*</span></p>
                                <input type="number" name="receiverPhone" required>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4>Your Order</h4>
                                <div class="checkout__order__subtotal">Subtotal <span>$<fmt:formatNumber type="number" value="${totalprice}"/></span></div>
                                <div class="checkout__order__subtotal">Deliver fee <span>$0</span></div>
                                <div class="checkout__order__total">Total <span>$<fmt:formatNumber type="number" value="${totalprice}"/></span></div>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <button type="submit" class="site-btn">PLACE ORDER</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->

    <!-- Footer Section Begin -->
<jsp:include page="../layout/footer.jsp" />
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="/client/js/jquery-3.3.1.min.js"></script>
    <script src="/client/js/bootstrap.min.js"></script>
    <script src="/client/js/jquery.nice-select.min.js"></script>
    <script src="/client/js/jquery-ui.min.js"></script>
    <script src="/client/js/jquery.slicknav.js"></script>
    <script src="/client/js/mixitup.min.js"></script>
    <script src="/client/js/owl.carousel.min.js"></script>
    <script src="/client/js/main1.js"></script>



</body>

</html>