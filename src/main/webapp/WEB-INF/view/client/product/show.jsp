<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>All Product</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
    <link href="/css/styles.css" rel="stylesheet" />
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
<!-- Page Preloder -->
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

                </div>
            </div>
        </div>
        <div class="humberger__open">
            <i class="fa fa-bars"></i>
        </div>
    </div>
</header>

<!-- Header Section End -->


<section class="featured spad">
<div class="container">
        <div class="row">
            <div class="col-12 col-md-4">
               <div class="row g-4">
                   <div class="col-12" id="factoryFilter">
                       <div class="mb-2"><b>Hang san xuat</b></div>
                       <div class="form-check form-check-inline">
                           <input class="form-check-input" type="checkbox" value="APPLE" id="flexCheckDefault">
                           <label class="form-check-label" for="flexCheckDefault">
                               Apple
                           </label>
                       </div>
                       <div class="form-check form-check-inline">
                           <input class="form-check-input" type="checkbox" value="DELL"  >
                           <label class="form-check-label" >
                               DELL
                           </label>
                       </div>
                       <div class="form-check form-check-inline">
                           <input class="form-check-input" type="checkbox" value="Asus"  >
                           <label class="form-check-label" >
                               Asus
                           </label>
                       </div>
                       <div class="form-check form-check-inline">
                           <input class="form-check-input" type="checkbox" value="Lenovo"  >
                           <label class="form-check-label" >
                               Lenovo
                           </label>
                       </div>
                       <div class="form-check form-check-inline">
                           <input class="form-check-input" type="checkbox" value="HP"  >
                           <label class="form-check-label" >
                               Microsoft
                           </label>
                       </div>

                   </div>
                   <div class="col-12" id="targetFilter">
                       <div class="mb-2"><b>Mục đích sử dụng</b></div>
                       <div class="form-check form-check-inline">
                           <input class="form-check-input" type="checkbox" value="gaming">
                           <label class="form-check-label" for="flexCheckDefault">
                               Gaming
                           </label>
                       </div>
                       <div class="form-check form-check-inline">
                           <input class="form-check-input" type="checkbox" value="Sinhvienvanphong"  >
                           <label class="form-check-label" >
                               Sinh viên-văn phòng
                           </label>
                       </div>
                       <div class="form-check form-check-inline">
                           <input class="form-check-input" type="checkbox" value="thietkedohoa"  >
                           <label class="form-check-label" >
                               Thiết kế đồ họa
                           </label>
                       </div>
                       <div class="form-check form-check-inline">
                           <input class="form-check-input" type="checkbox" value="doanhnhan"  >
                           <label class="form-check-label" >
                               Doanh nhân
                           </label>
                       </div>
                       <div class="form-check form-check-inline">
                           <input class="form-check-input" type="checkbox" value="mongnhe"  >
                           <label class="form-check-label" >
                               Mỏng nhẹ
                           </label>
                       </div>

                   </div>
                   <div class="col-12" id="priceFilter">
                       <div class="mb-2"><b>Mức giá</b></div>
                       <div class="form-check form-check-inline">
                           <input class="form-check-input" type="checkbox" value="duoi-25-trieu" >
                           <label class="form-check-label" >
                               Dưới 25 triệu
                           </label>
                       </div>
                       <div class="form-check form-check-inline">
                           <input class="form-check-input" type="checkbox" value="tu-25-40-trieu"  >
                           <label class="form-check-label" >
                               Từ 25-40 triệu
                           </label>
                       </div>
                       <div class="form-check form-check-inline">
                           <input class="form-check-input" type="checkbox" value="tu-40-50-trieu"  >
                           <label class="form-check-label" >
                               Từ 40-50 triệu
                           </label>
                       </div>
                       <div class="form-check form-check-inline">
                           <input class="form-check-input" type="checkbox" value="tren-50-trieu"  >
                           <label class="form-check-label" >
                               Trên 50 triệu
                           </label>
                       </div>


                   </div>
                   <div class="col-12">
                       <div class="mb-2"><b>Sắp xếp</b></div>
                       <div class="form-check">
                           <input type="radio" class="form-check-input"  name="optradio" value="giatangdan" >
                           <label class="form-check-label" >Giá Tăng Dần</label>
                       </div>
                       <div class="form-check">
                           <input type="radio" class="form-check-input"  name="optradio" value="giagiamdan">
                           <label class="form-check-label" >Giá Giảm Dần</label>
                       </div>
                       <div class="form-check">
                           <input type="radio" class="form-check-input"  name="optradio" value="gia-nothing" checked>
                           <label class="form-check-label">Không Sắp Xếp</label>
                       </div>


                   </div>
                   <button class="btn btn-outline-success " id="btnFilter">
                      Lọc Sản Phẩm
                   </button>
               </div>
            </div>
            <div class="col-12 col-md-8 row featured__filter">
                <c:if test="${totalPage<=0}">
                    <h3>Don't have product!</h3>
                </c:if>

            <c:forEach var="listproduct" items="${listProducts}" >
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                    <div class="featured__item border-danger">
                        <div class="featured__item__pic set-bg" style="width:auto;height: 200px;" data-setbg="/images/product/${listproduct.image}">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="/product/detail/${listproduct.id}">${listproduct.name}</a></h6>
                            <h6><a href="/product/detail/${listproduct.id}">${listproduct.shortDesc}</a></h6>
                            <h5>$${listproduct.price}</h5>
                            <form action="/add-product-to-cart/${listproduct.id}" method="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <button class="btn btn-outline-success">Add to cart</button>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>

                <c:if test="${totalPage>0}">
                <div>
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center">
                            <li class="page-item">
                                <a class="${currentPage eq 0 ? 'page-link disabled':'page-link'}" href="/products?page=${currentPage}${queryString}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <c:forEach begin="0" end="${totalPage-1}" varStatus="loop">
                                <li class="page-item"><a class="${currentPage eq (loop.index) ? 'page-link active':'page-link'}" href="/products?page=${loop.index +1}${queryString}">${loop.index+1}</a></li>
                            </c:forEach>
                            <li class="page-item">
                                <a class="${currentPage eq (totalPage-1) ? 'page-link disabled':'page-link'}" href="/products?page=${currentPage+2}${queryString}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
                </c:if>
            </div>

        </div>

</div>
</section>


<jsp:include page="../layout/footer.jsp" />

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