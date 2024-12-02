package vn.ThangKa.LapTopShop.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import vn.ThangKa.LapTopShop.domain.User;
import vn.ThangKa.LapTopShop.service.UserService;

@Controller
public class AdminController {

    @Autowired
    private UserService userService;
    @RequestMapping(value = "/admin/user",method = RequestMethod.GET)
    public String createUser(Model model){
        model.addAttribute("newUser", new User());
        return "/admin/user/create";
    }
    @RequestMapping(value = "/admin/user/create1",method = RequestMethod.POST)
    public void submit(Model model, @ModelAttribute("newUser") User user){

        System.out.println(userService.createUser(user).toString());
    }
}
