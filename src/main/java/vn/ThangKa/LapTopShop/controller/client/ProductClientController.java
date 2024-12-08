package vn.ThangKa.LapTopShop.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ProductClientController {


    @GetMapping("/product/{id}")
    public String getProductById(@PathVariable Long id) {

        return "client/product/product-detail";
    }
}
