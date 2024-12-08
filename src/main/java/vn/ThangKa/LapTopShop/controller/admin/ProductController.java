package vn.ThangKa.LapTopShop.controller.admin;

import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import vn.ThangKa.LapTopShop.domain.Product;
import vn.ThangKa.LapTopShop.service.ProductService;
import vn.ThangKa.LapTopShop.service.UploadFile;

import java.lang.reflect.Field;
import java.util.List;

@Controller
public class ProductController {

    @Autowired
    private UploadFile uploadFile;

    @Autowired
    private ProductService productService;

    @RequestMapping("/admin/products")
    public String getproducts(Model model) {

        model.addAttribute("listproduct", productService.findAll());
        return "admin/product/index";
    }



    @GetMapping("/admin/product/create")
    public String create(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/createproduct")
    public String saveProduct(Model model,
                              @ModelAttribute("newProduct") @Valid Product product,
                              BindingResult newProductbindingResult,
                              @RequestParam("fileAnh") MultipartFile file) {
        List<FieldError> errors = newProductbindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println("<<<<< "+error.getField()+"-"+error.getDefaultMessage());
        }
        if (newProductbindingResult.hasErrors()) {
            return "admin/product/create";
        }

        if (!file.isEmpty()) {
            String images = this.uploadFile.uploadFileHandler(file,"product");
            product.setImage(images);
        }

        productService.createProduct(product);
        return "redirect:/admin/products";
    }

    @GetMapping("/admin/product/update/{id}")
    public String update(Model model,@PathVariable("id") Long id) throws Exception {


        Product product = productService.findById(id).orElseThrow(()-> new Exception("Don't exist id"));
        model.addAttribute("product", product);
        model.addAttribute("fileAnh", product.getImage());
        return "admin/product/update";
    }
    @PostMapping("/admin/product/updateproduct")
    public String updateproduct(Model model,
                                @ModelAttribute("product") @Valid Product product,
                                BindingResult productbindingResult,
                                @RequestParam("fileAnh") MultipartFile file) throws Exception {
        Product productCurrent = productService.findById(product.getId()).orElseThrow(()-> new Exception("Don't exist id"));

        List<FieldError> errors = productbindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println("<<<<< "+error.getField()+"-"+error.getDefaultMessage());
        }
        if (productbindingResult.hasErrors()) {
            model.addAttribute("fileAnh", productCurrent.getImage());
            return "admin/product/update";
        }
        if (!file.isEmpty()) {
            String images = this.uploadFile.uploadFileHandler(file,"product");
            productCurrent.setImage(images);
        }

        productCurrent.setName(product.getName());
        productCurrent.setPrice(product.getPrice());
        productCurrent.setDetailDesc(product.getDetailDesc());
        productCurrent.setQuantity(product.getQuantity());
        productCurrent.setFactory(product.getFactory());
        productCurrent.setShortDesc(product.getShortDesc());
        productCurrent.setTarget(product.getTarget());

        productService.updateProduct(productCurrent);
        return "redirect:/admin/products";
    }


    @GetMapping("/admin/product/detail/{id}")
    public String detail(Model model,@PathVariable("id") Long id) throws Exception {
        Product product = productService.findById(id).orElseThrow(()-> new Exception("Don't exist id"));
        model.addAttribute("product", product);
        model.addAttribute("fileAnh", product.getImage());
        return "admin/product/detail";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String delete(Model model,@PathVariable("id") Long id) throws Exception {
        Product product = productService.findById(id).orElseThrow(()-> new Exception("Don't exist id"));
        model.addAttribute("product", product);
        model.addAttribute("fileAnh", product.getImage());
        return "admin/product/confirmdelete";
    }
    @PostMapping("/admin/product/confirmdelete")
    public String confirmdelete(Model model,
                                @ModelAttribute("product") Product product){

       productService.deleteProduct(product.getId());
        return "redirect:/admin/products";
    }


}
