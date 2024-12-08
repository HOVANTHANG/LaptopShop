package vn.ThangKa.LapTopShop.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("")
    public String home() {
        return "client/homepage/index";
    }
    @GetMapping("/client/shop")
    public String shop() {
        return "client/shop/shop-grid";
    }
    @GetMapping("/client/shop_detail")
    public String shop_detail() {
        return "client/shop/shop-detail";
    }
    @GetMapping("/client/checkout")
    public String checkout() {
        return "client/shop/checkout";
    }
}
