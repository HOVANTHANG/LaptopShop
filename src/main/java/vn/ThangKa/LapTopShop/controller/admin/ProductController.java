package vn.ThangKa.LapTopShop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {
    @RequestMapping("/admin/products")
    public String getproducts() {
        return "admin/product/index";
    }
}
