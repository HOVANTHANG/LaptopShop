package vn.ThangKa.LapTopShop.controller.client;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import vn.ThangKa.LapTopShop.domain.Product;
import vn.ThangKa.LapTopShop.service.ProductService;

@Controller
public class ProductClientController {

    @Autowired
    private ProductService productService;


    @GetMapping("/product/detail/{id}")
    public String getProductById(Model model,
                                 @PathVariable Long id) throws Exception {

        Product product = this.productService.findById(id).orElseThrow(()-> new Exception("Don't exist ProductID"));
        model.addAttribute("product", product);
        return "client/product/product-detail";
    }
}
