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


<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Humberger Begin -->
<div class="humberger__menu__overlay"></div>
<div class="humberger__menu__wrapper">
    <div class="humberger__menu__logo">
        <a href="#"><img src="/client/images/logo.png" alt=""></a>
    </div>
    <div class="humberger__menu__cart">
        <ul>
            <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
            <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
        </ul>
        <div class="header__cart__price">item: <span>$150.00</span></div>
    </div>
    <div class="humberger__menu__widget">
        <div class="header__top__right__language">
            <img src="/client/images/language.png" alt="">
            <div>English</div>
            <span class="arrow_carrot-down"></span>
            <ul>
                <li><a href="#">Spanis</a></li>
                <li><a href="#">English</a></li>
            </ul>
        </div>
        <div class="header__top__right__auth">
            <a href="#"><i class="fa fa-user"></i> Login</a>
        </div>
    </div>
    <nav class="humberger__menu__nav mobile-menu">
        <ul>
            <li class="active"><a href="./index.html">Home</a></li>
            <li><a href="./shop-grid.html">Shop</a></li>
            <li><a href="#">Pages</a>
                <ul class="header__menu__dropdown">
                    <li><a href="./shop-details.html">Shop Details</a></li>
                    <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                    <li><a href="./checkout.html">Check Out</a></li>
                    <li><a href="./blog-details.html">Blog Details</a></li>
                </ul>
            </li>
            <li><a href="./blog.html">Blog</a></li>
            <li><a href="./contact.html">Contact</a></li>
        </ul>
    </nav>
    <div id="mobile-menu-wrap"></div>
    <div class="header__top__right__social">
        <a href="#"><i class="fa fa-facebook"></i></a>
        <a href="#"><i class="fa fa-twitter"></i></a>
        <a href="#"><i class="fa fa-linkedin"></i></a>
        <a href="#"><i class="fa fa-pinterest-p"></i></a>
    </div>
    <div class="humberger__menu__contact">
        <ul>
            <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
            <li>Free Shipping for all Order of $99</li>
        </ul>
    </div>
</div>
<!-- Humberger End -->

<!-- Header Section Begin -->
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__left">
                        <ul>
                            <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                            <li>Free Shipping for all Order of $99</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__right">
                        <div class="header__top__right__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-linkedin"></i></a>
                            <a href="#"><i class="fa fa-pinterest-p"></i></a>
                        </div>
                        <div class="header__top__right__language">
                            <img src="/client/images/language.png" alt="">
                            <div>English</div>
                            <span class="arrow_carrot-down"></span>
                            <ul>
                                <li><a href="#">Spanish</a></li>
                                <li><a href="#">English</a></li>
                            </ul>
                        </div>
                        <div class="header__top__right__auth">
                            <a href="#"><i class="fa fa-user"></i> Login</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="header__logo">
                    <a href="./index.html"><img src="/client/images/logo.png" alt=""></a>
                </div>
            </div>
            <div class="col-lg-6">
                <nav class="header__menu">
                    <ul>
                        <li class="active"><a href="/">Home</a></li>
                        <li><a href="/client/shop">Product</a></li>
                    </ul>
                </nav>
            </div>
            <div class="col-lg-3">
                <div class="header__cart">
                    <ul class="nav-list">
                        <c:if test="${not empty pageContext.request.userPrincipal}">
                            <!-- Shopping Cart Item -->
                            <li class="nav-item">
                                <a href="/cart" class="cart-link">
                                    <i class="fa fa-shopping-bag"></i>
                                    <span class="cart-count">${sessionScope.sum}</span>
                                </a>
                            </li>

                            <!-- User Profile Dropdown -->
                            <li class="nav-item dropdown my-auto">
                                <div class="dropdown">
                                    <a href="#"
                                       class="dropdown-toggle"
                                       role="button"
                                       id="dropdownMenuLink"
                                       data-bs-toggle="dropdown"
                                       aria-expanded="false">
                                        <i class="fa fa-user fa-2x"></i>
                                    </a>

                                    <ul class="header__menu__dropdown dropdown-menu dropdown-menu-end p-4"
                                        aria-labelledby="dropdownMenuLink">
                                        <li class="user-profile d-flex align-items-center flex-column" style="min-width: 300px;">
                                            <img class="profile-image"
                                                 src="/images/avatar/${sessionScope.avatar}"
                                                 alt="User profile"
                                                 style="width: 80px; height: 80px; border-radius: 50%; object-fit: cover;" />
                                            <div class="username text-center my-3">
                                                    ${sessionScope.fullName}
                                            </div>
                                        </li>
                                        <li><a class="dropdown-item" href="#">Quản lý tài khoản</a></li>
                                        <li><a class="dropdown-item" href="#">Lịch sử mua hàng</a></li>
                                        <li><hr class="dropdown-divider"></li>
                                        <li>
                                            <form method="post" action="/logout">
                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                <button class="dropdown-item" >Đăng xuất</button>
                                            </form>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                        </c:if>
                        <c:if test="${empty pageContext.request.userPrincipal}">
                            <li class="nav-item">
                                <a href="/login" class="cart-link">
                                    <i class="fa fa-user"></i>
                                    Login
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
        <div class="humberger__open">
            <i class="fa fa-bars"></i>
        </div>
    </div>
</header>

<!-- Header Section End -->

<!-- Header Section End -->

<!-- Hero Section Begin -->
<section class="hero hero-normal">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="hero__categories">
                    <div class="hero__categories__all">
                        <i class="fa fa-bars"></i>
                        <span>All departments</span>
                    </div>
                    <ul>
                        <li><a href="#">Fresh Meat</a></li>
                        <li><a href="#">Vegetables</a></li>
                        <li><a href="#">Fruit & Nut Gifts</a></li>
                        <li><a href="#">Fresh Berries</a></li>
                        <li><a href="#">Ocean Foods</a></li>
                        <li><a href="#">Butter & Eggs</a></li>
                        <li><a href="#">Fastfood</a></li>
                        <li><a href="#">Fresh Onion</a></li>
                        <li><a href="#">Papayaya & Crisps</a></li>
                        <li><a href="#">Oatmeal</a></li>
                        <li><a href="#">Fresh Bananas</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="hero__search">
                    <div class="hero__search__form">
                        <form action="#">
                            <div class="hero__search__categories">
                                All Categories
                                <span class="arrow_carrot-down"></span>
                            </div>
                            <input type="text" placeholder="What do yo u need?">
                            <button type="submit" class="site-btn">SEARCH</button>
                        </form>
                    </div>
                    <div class="hero__search__phone">
                        <div class="hero__search__phone__icon">
                            <i class="fa fa-phone"></i>
                        </div>
                        <div class="hero__search__phone__text">
                            <h5>+65 11.188.888</h5>
                            <span>support 24/7 time</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Hero Section End -->

<!-- Shoping Cart Section Begin -->
<section class="shoping-cart spad">
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
                                        >
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
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__btns">
                    <a href="#" class="primary-btn cart-btn">CONTINUE SHOPPING</a>
                    <a href="#" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>
                        Upadate Cart</a>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="shoping__continue">
                    <div class="shoping__discount">
                        <h5>Discount Codes</h5>
                        <form action="#">
                            <input type="text" placeholder="Enter your coupon code">
                            <button type="submit" class="site-btn">APPLY COUPON</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="shoping__checkout">
                    <h5>Cart Total</h5>
                    <ul>
                        <li>Subtotal <span data-cart-total-price="${totalprice}">
                            <fmt:formatNumber type="number" value="${totalprice}"
                        /></span></li>
                        <li>Total <span data-cart-total-price="${totalprice}">
                            <fmt:formatNumber type="number" value="${totalprice}"
                        /></span></li>
                    </ul>
                    <form:form action="/confirm-checkout" method="post" modelAttribute="cart">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <div style="display: none;">
                            <c:forEach var="cartDetail" items="${cart.cart_details}" varStatus="status">
                                <div class="mb-3">
                                    <div class="form-group">
                                        <label>ID:</label>
                                        <form:input class="form-control" type="text"
                                                    value="${cartDetail.id}"
                                                    path="cart_details[${status.index}].id"/>
                                    </div>
                                    <div class="form-group">
                                        <label>Quantity:</label>
                                        <form:input class="form-control" type="text"
                                                    value="${cartDetail.quantity}"
                                                    path="cart_details[${status.index}].quantity"/>
                                    </div>
                                </div>

                            </c:forEach>

                        </div>
                        <button  class="primary-btn">PROCEED TO CHECKOUT</button>

                    </form:form>


                </div>
            </div>
        </div>
    </div>
</section>
<!-- Shoping Cart Section End -->

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
<script src="/client/js/main.js"></script>


</body>

</html>