package vn.ThangKa.LapTopShop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import vn.ThangKa.LapTopShop.service.UserService;

@Controller
public class DashboardController {

    private UserService userService;

    public DashboardController(UserService userService) {
        this.userService = userService;
    }


    @RequestMapping("/admin")
    public String getdashboard(Model model) {
        model.addAttribute("countUser", this.userService.countUser());
        model.addAttribute("countProduct",this.userService.countProduct() );
        model.addAttribute("countOrder",this.userService.countOrder() );

        return "admin/dashboard/index";
    }
}
