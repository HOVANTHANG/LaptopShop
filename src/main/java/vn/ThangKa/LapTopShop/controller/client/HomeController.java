package vn.ThangKa.LapTopShop.controller.client;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import vn.ThangKa.LapTopShop.domain.Product;
import vn.ThangKa.LapTopShop.domain.User;
import vn.ThangKa.LapTopShop.domain.dto.registerDTO;
import vn.ThangKa.LapTopShop.service.ProductService;
import vn.ThangKa.LapTopShop.service.RoleService;
import vn.ThangKa.LapTopShop.service.UserService;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private ProductService productService;

    @GetMapping("")
    public String home(Model model) {
        List<Product> products = productService.findAll();
        model.addAttribute("listProducts", products);
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

    @GetMapping("/register")
    public String getRegisterpage(Model model) {
        model.addAttribute("registerDTO", new registerDTO());
        return "client/auth/register";
    }
    @PostMapping ("/handleRegister")
    public String handleRegister(@ModelAttribute("registerDTO") registerDTO registerDTO) {
        User user = this.userService.registerDTOtoUser(registerDTO);

        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRole(this.roleService.getrolebyname("USER"));

        userService.UpdateUser(user);

        return "redirect:/login";
    }
    @GetMapping("/login")
    public String login(Model model) {

        return "client/auth/login";
    }
}
