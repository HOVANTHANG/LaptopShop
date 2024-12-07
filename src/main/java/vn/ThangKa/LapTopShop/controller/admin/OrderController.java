package vn.ThangKa.LapTopShop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {
    @RequestMapping("/admin/orders")
    public String getorders() {
        return "admin/order/index";
    }
}
