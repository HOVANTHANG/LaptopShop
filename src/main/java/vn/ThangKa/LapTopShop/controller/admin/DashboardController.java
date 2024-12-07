package vn.ThangKa.LapTopShop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DashboardController {



    @RequestMapping("/admin/index")
    public String getdashboard() {
        return "admin/dashboard/index";
    }
}
