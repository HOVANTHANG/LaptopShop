<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="featured spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h2>Product</h2>
                </div>
                <div class="featured__controls">
                    <ul>
                        <li class="active" data-filter="*"><a href="/products">All Product</a></li>

                    </ul>
                </div>
            </div>
        </div>
        <div class="row featured__filter">
            <c:forEach var="listproduct" items="${listProducts}" >
            <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                <div class="featured__item border-danger">
                    <div class="featured__item__pic set-bg" data-setbg="/images/product/${listproduct.image}">
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
        </div>
    </div>
</section>