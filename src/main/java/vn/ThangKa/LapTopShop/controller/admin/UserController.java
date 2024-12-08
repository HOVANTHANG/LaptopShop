package vn.ThangKa.LapTopShop.controller.admin;

import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import vn.ThangKa.LapTopShop.configuration.SecurityConfiguration;
import vn.ThangKa.LapTopShop.domain.Role;
import vn.ThangKa.LapTopShop.domain.User;
import vn.ThangKa.LapTopShop.service.RoleService;
import vn.ThangKa.LapTopShop.service.UploadFile;
import vn.ThangKa.LapTopShop.service.UserService;

import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;

    @Autowired
    private UploadFile uploadFile;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @RequestMapping(value = "/admin/user",method = RequestMethod.GET)
    public String listUser(Model model){
        List<User> listUser = userService.getAllUsers();
        model.addAttribute("listUsers", listUser);
        return "/admin/user/index";
    }

    @RequestMapping(value = "/admin/user/create",method = RequestMethod.GET)
    public String createUser(Model model){
        model.addAttribute("newUser", new User());
        return "/admin/user/create";
    }


    @PostMapping(value = "/admin/user/saveuser")
    public String submit(Model model,
                         @ModelAttribute("newUser") @Valid User user,
                         BindingResult newUserbindingResult,
                        // @RequestParam("fileAnh") MultipartFile[] file
                         @RequestParam("fileAnh") MultipartFile file
                         ){
        List<FieldError> errors = newUserbindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println("<<<<"+error.getField()+"-"+error.getDefaultMessage());
        }
        if (newUserbindingResult.hasErrors()) {
            return "/admin/user/create";
        }
        String avatar=this.uploadFile.uploadFileHandler(file,"avatar");
        String hashPassword=this.passwordEncoder.encode(user.getPassword());


        user.setAvatar(avatar);
        user.setPassword(hashPassword);
        System.out.println(user.getRole().getName());
        user.setRole(roleService.getrolebyname(user.getRole().getName()));

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
        model.addAttribute("fileAnh", user.getAvatar());
        model.addAttribute("role", user.getRole().getName());
        return "/admin/user/update";
    }

    @RequestMapping(value = "/admin/user/update",method = RequestMethod.POST)
    public String update(Model model,
                         @ModelAttribute("Userupdate") @Valid  User user,
                         BindingResult userupdateBindingResult,
                         @RequestParam("fileAnh") MultipartFile file){
        User updateUser = userService.findUserById(user.getId());
        List<FieldError> errors = userupdateBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println("<<<<"+error.getField()+"-"+error.getDefaultMessage());
        }
        if (userupdateBindingResult.hasErrors()) {
            model.addAttribute("fileAnh", updateUser.getAvatar());
            return "/admin/user/update";
        }
        if(!file.isEmpty()) {
            String avatar = this.uploadFile.uploadFileHandler(file, "avatar");
            updateUser.setAvatar(avatar);
        }


        updateUser.setRole(roleService.getrolebyname(user.getRole().getName()));
        updateUser.setEmail(user.getEmail());
        updateUser.setPassword(user.getPassword());
        updateUser.setFullName(user.getFullName());
        updateUser.setPhone(user.getPhone());
        updateUser.setAddress(user.getAddress());

        userService.UpdateUser(updateUser);
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
