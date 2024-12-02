package vn.ThangKa.LapTopShop.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import vn.ThangKa.LapTopShop.domain.User;
import vn.ThangKa.LapTopShop.service.UserService;

import java.util.List;
import java.util.Optional;

@Controller
public class AdminController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/admin/user",method = RequestMethod.GET)
    public String listUser(Model model){
        List<User> listUser = userService.getAllUsers();
        model.addAttribute("listUsers", listUser);
        return "/admin/user/listuser";
    }

    @RequestMapping(value = "/admin/user/create",method = RequestMethod.GET)
    public String createUser(Model model){
        model.addAttribute("newUser", new User());
        return "/admin/user/create";
    }


    @RequestMapping(value = "/admin/user/saveuser",method = RequestMethod.POST)
    public String submit(Model model, @ModelAttribute("newUser") User user){

       userService.createUser(user);
       return "redirect:/admin/user";
    }

    @RequestMapping(value = "/admin/user/detail/{id}",method = RequestMethod.GET)
    public String detail(Model model, @PathVariable Long id){
        User user = userService.findUserById(id);
        model.addAttribute("user", user);
        return "/admin/user/detail";
    }

    @RequestMapping(value = "/admin/user/update/{id}",method = RequestMethod.GET)
    public String update(Model model, @PathVariable Long id){
        User user = userService.findUserById(id);
        model.addAttribute("Userupdate", user);
        return "/admin/user/update";
    }

    @RequestMapping(value = "/admin/user/update",method = RequestMethod.POST)
    public String update(Model model, @ModelAttribute("Userupdate") User user){
        userService.UpdateUser(user);
        return "redirect:/admin/user";
    }

    @RequestMapping(value = "/admin/user/delete/{id}",method = RequestMethod.GET)
    public String delete(Model model, @PathVariable Long id){
        User user = userService.findUserById(id);
        model.addAttribute("Userdelete", user);
        return "/admin/user/delete";
    }

    @RequestMapping(value = "/admin/user/deleteconfirm/{id}",method = RequestMethod.POST)
    public String deleteConfirm(Model model, @PathVariable Long id){
        userService.DeleteUser(id);
        return "redirect:/admin/user";
    }






}
