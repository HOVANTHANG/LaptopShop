/*  ---------------------------------------------------
    Template Name: Ogani
    Description:  Ogani eCommerce  HTML Template
    Author: Colorlib
    Author URI: https://colorlib.com
    Version: 1.0
    Created: Colorlib
---------------------------------------------------------  */

'use strict';

(function ($) {

    /*------------------
        Preloader
    --------------------*/
    $(window).on('load', function () {
        $(".loader").fadeOut();
        $("#preloder").delay(200).fadeOut("slow");

        /*------------------
            Gallery filter
        --------------------*/
        $('.featured__controls li').on('click', function () {
            $('.featured__controls li').removeClass('active');
            $(this).addClass('active');
        });
        if ($('.featured__filter').length > 0) {
            var containerEl = document.querySelector('.featured__filter');
            var mixer = mixitup(containerEl);
        }
    });

    /*------------------
        Background Set
    --------------------*/
    $('.set-bg').each(function () {
        var bg = $(this).data('setbg');
        $(this).css('background-image', 'url(' + bg + ')');
    });

    //Humberger Menu
    $(".humberger__open").on('click', function () {
        $(".humberger__menu__wrapper").addClass("show__humberger__menu__wrapper");
        $(".humberger__menu__overlay").addClass("active");
        $("body").addClass("over_hid");
    });

    $(".humberger__menu__overlay").on('click', function () {
        $(".humberger__menu__wrapper").removeClass("show__humberger__menu__wrapper");
        $(".humberger__menu__overlay").removeClass("active");
        $("body").removeClass("over_hid");
    });

    /*------------------
		Navigation
	--------------------*/
    $(".mobile-menu").slicknav({
        prependTo: '#mobile-menu-wrap',
        allowParentLinks: true
    });

    /*-----------------------
        Categories Slider
    ------------------------*/
    $(".categories__slider").owlCarousel({
        loop: true,
        margin: 0,
        items: 4,
        dots: false,
        nav: true,
        navText: ["<span class='fa fa-angle-left'><span/>", "<span class='fa fa-angle-right'><span/>"],
        animateOut: 'fadeOut',
        animateIn: 'fadeIn',
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: true,
        responsive: {

            0: {
                items: 1,
            },

            480: {
                items: 2,
            },

            768: {
                items: 3,
            },

            992: {
                items: 4,
            }
        }
    });


    $('.hero__categories__all').on('click', function(){
        $('.hero__categories ul').slideToggle(400);
    });

    /*--------------------------
        Latest Product Slider
    ----------------------------*/
    $(".latest-product__slider").owlCarousel({
        loop: true,
        margin: 0,
        items: 1,
        dots: false,
        nav: true,
        navText: ["<span class='fa fa-angle-left'><span/>", "<span class='fa fa-angle-right'><span/>"],
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: true
    });

    /*-----------------------------
        Product Discount Slider
    -------------------------------*/
    $(".product__discount__slider").owlCarousel({
        loop: true,
        margin: 0,
        items: 3,
        dots: true,
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: true,
        responsive: {

            320: {
                items: 1,
            },

            480: {
                items: 2,
            },

            768: {
                items: 2,
            },

            992: {
                items: 3,
            }
        }
    });

    /*---------------------------------
        Product Details Pic Slider
    ----------------------------------*/
    $(".product__details__pic__slider").owlCarousel({
        loop: true,
        margin: 20,
        items: 4,
        dots: true,
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: true
    });

    /*-----------------------
		Price Range Slider
	------------------------ */
    var rangeSlider = $(".price-range"),
        minamount = $("#minamount"),
        maxamount = $("#maxamount"),
        minPrice = rangeSlider.data('min'),
        maxPrice = rangeSlider.data('max');
    rangeSlider.slider({
        range: true,
        min: minPrice,
        max: maxPrice,
        values: [minPrice, maxPrice],
        slide: function (event, ui) {
            minamount.val('$' + ui.values[0]);
            maxamount.val('$' + ui.values[1]);
        }
    });
    minamount.val('$' + rangeSlider.slider("values", 0));
    maxamount.val('$' + rangeSlider.slider("values", 1));

    /*--------------------------
        Select
    ----------------------------*/
    $("select").niceSelect();

    /*------------------
		Single Product
	--------------------*/
    $('.product__details__pic__slider img').on('click', function () {

        var imgurl = $(this).data('imgbigurl');
        var bigImg = $('.product__details__pic__item--large').attr('src');
        if (imgurl != bigImg) {
            $('.product__details__pic__item--large').attr({
                src: imgurl
            });
        }
    });

    /*-------------------
		Quantity change
	--------------------- */
    var proQty = $('.pro-qty');
    proQty.prepend('<span class="dec qtybtn">-</span>');
    proQty.append('<span class="inc qtybtn">+</span>');
    proQty.on('click', '.qtybtn', function () {
        let change=0;
        var $button = $(this);
        var oldValue = $button.parent().find('input').val();
        if ($button.hasClass('inc')) {
            var newVal = parseFloat(oldValue) + 1;
            change=1;
        } else {
            // Don't allow decrementing below zero
            if (oldValue > 1) {
                var newVal = parseFloat(oldValue) - 1;
                change=-1;
            } else {
                newVal = 1;
            }
        }
        const input = $button.parent().find('input');
        input.val(newVal);
        //set form index
        const  index = input.attr("data-cart-detail-index")
        const el = document.getElementById(`cart_details${index}.quantity`);
        $(el).val(newVal);




        //get Price
        const price = input.attr("data-cart-detail-price");
        const id = input.attr("data-cart-detail-id");

        const  priceElement = $(`p[data-cart-detail-id='${id}']`);
        if (priceElement){
            const  newPrice = newVal*(+price);
            priceElement.text(newPrice.toFixed(2)+"$");
        }

        const totalPrice = $(`span[data-cart-total-price]`);
        if (totalPrice && totalPrice.length){
            const currentTotal = totalPrice.first().attr("data-cart-total-price");
            let newtotal = +currentTotal;
            if (change==0){
                newtotal = +currentTotal;
            }else{
                newtotal = change*(+price) + (+currentTotal);
            }
            change = 0;
            totalPrice.each(function (index, element) {
                $(element).text(newtotal.toFixed(2)+"$");
                $(element).attr("data-cart-total-price", newtotal);
            });


        }


    });

    $("#btnFilter").click(function (e){
        e.preventDefault();

        let factoryArr=[];
        let targetArr=[];
        let priceArr=[];

        $("#factoryFilter .form-check-input:checked").each(function (e){
            factoryArr.push($(this).val());
        });
        $("#targetFilter .form-check-input:checked").each(function (e){
            targetArr.push($(this).val());
        });
        $("#priceFilter .form-check-input:checked").each(function (e){
            priceArr.push($(this).val());
        });

        let sortValue=$('input[name="optradio"]:checked').val();
        const  currentURL = new URL(window.location.href);
        const searchParams = currentURL.searchParams;

        searchParams.set('page','1');
        searchParams.set('sort',sortValue);

        //reset
        searchParams.delete('factory')
        searchParams.delete('target')
        searchParams.delete('price')

        if (factoryArr.length>0){
            searchParams.set('factory',factoryArr.join(','));
        }
        if (targetArr.length>0){
            searchParams.set('target',targetArr.join(','));
        }
        if (priceArr.length>0){
            searchParams.set('price',priceArr.join(','));
        }

        window.location.href = currentURL.toString();

    });
      const params = new URLSearchParams(window.location.search);

    if (params.has('factory')){
        const factories = params.get('factory').split(',');
        factories.forEach(factory => {
            $('#factoryFilter .form-check-input[value="' + factory + '"]').prop('checked', true);
        });
    }
    if (params.has('target')){
        const targets = params.get('target').split(',');
        targets.forEach(target => {
            $('#targetFilter .form-check-input[value="' + target + '"]').prop('checked', true);
        });
    }
    if (params.has('price')){
        const prices = params.get('price').split(',');
        prices.forEach(price => {
            $('#priceFilter .form-check-input[value="' + price + '"]').prop('checked', true);
        });
    }




})(jQuery);
