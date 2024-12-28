package vn.ThangKa.LapTopShop.controller.client;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import vn.ThangKa.LapTopShop.domain.Cart;
import vn.ThangKa.LapTopShop.domain.CartDetails;
import vn.ThangKa.LapTopShop.domain.Product;
import vn.ThangKa.LapTopShop.domain.User;
import vn.ThangKa.LapTopShop.service.ProductService;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ProductClientController {

    @Autowired
    private ProductService productService;


    @GetMapping("/product/detail/{id}")
    public String getProductById(Model model,
                                 @PathVariable Long id) throws Exception {

        Product product = this.productService.findById(id).orElseThrow(()-> new Exception("Don't exist ProductID"));
        model.addAttribute("product", product);
        return "client/product/product-detail";
    }

    @PostMapping("/add-product-to-cart/{id}")
    public String addproducttocart(@PathVariable Long id, HttpServletRequest http) throws Exception {
        long product_id = id;
        HttpSession session = http.getSession();

        String email = (String) session.getAttribute("email");
        this.productService.handlerAddproduct(email,product_id,session);

        return "redirect:/" ;
    }

    @GetMapping("/cart")
    public String cart(Model model,HttpServletRequest http) throws Exception {
        User user = new User();
        long user_id = (long)http.getSession().getAttribute("id");
        user.setId(user_id);
        Cart cart = this.productService.fetchByUser(user);
        List<CartDetails> cartDetails = cart==null?new ArrayList<CartDetails>():cart.getCart_details();
        double totolprice=0;
        for (var c: cartDetails){
            totolprice+=c.getPrice()*c.getQuantity();
        }

        model.addAttribute("cartdetails", cartDetails);
        model.addAttribute("totalprice", totolprice);
        model.addAttribute("cart", cart);


        return "client/cart/cart-details";
    }

    @PostMapping("/deleteCart_detail/{id}")
    public String deleteCartdetail(@PathVariable long id, HttpServletRequest http) throws Exception {

        HttpSession session = http.getSession(false);
        long cartdetail_id = id;
        this.productService.handlerDeleteCartDetails(cartdetail_id,session);
        return "redirect:/cart";
    }
    @GetMapping("/checkout")
    public String checkout(Model model,HttpServletRequest http){
        User user = new User();
        HttpSession session = http.getSession();
        long user_id = (long)session.getAttribute("id");
        user.setId(user_id);

        Cart cart = this.productService.fetchByUser(user);

        List<CartDetails> cartDetails = cart==null?new ArrayList<CartDetails>():cart.getCart_details();

        double totolprice=0;
        for (var c: cartDetails){
            totolprice+=c.getPrice()*c.getQuantity();
        }

        model.addAttribute("cartdetails", cartDetails);
        model.addAttribute("totalprice", totolprice);


        return "client/cart/checkout";

    }


    @PostMapping("/confirm-checkout")
    public String confirmCheckout(@ModelAttribute("cart") Cart cart){
        List<CartDetails> cartDetails = cart==null?new ArrayList<CartDetails>():cart.getCart_details();
        this.productService.handlerCartBeforeCheckout(cartDetails);
        return "redirect:/checkout";

    }

    @PostMapping("/place-order")
    public String handlerPlaceOrder(HttpServletRequest http,
                                    @RequestParam("receiverName") String receiverName,
                                    @RequestParam("receiverAddress") String receiverAddress,
                                    @RequestParam("receiverPhone") String receiverPhone){
        User user = new User();
        HttpSession session = http.getSession();
        long user_id = (long)session.getAttribute("id");
        user.setId(user_id);

        this.productService.handlerPlaceOrder(user,session,receiverName,receiverAddress,receiverPhone);




        return "redirect:/thanks";
    }
    @GetMapping("/thanks")
    public String thanks(Model model)  {
        return "client/cart/place-order-success";
    }



}
