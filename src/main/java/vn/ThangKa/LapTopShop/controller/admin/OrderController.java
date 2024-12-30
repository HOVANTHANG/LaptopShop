package vn.ThangKa.LapTopShop.controller.admin;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import vn.ThangKa.LapTopShop.domain.Order;
import vn.ThangKa.LapTopShop.domain.Order_detail;
import vn.ThangKa.LapTopShop.service.OrderService;

import java.util.List;
import java.util.Optional;

@Controller
public class OrderController {

    private OrderService  orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }


    @GetMapping("/admin/orders")
    public String getorders(Model model,
                            @RequestParam("page") Optional<String> pageOptional) {
        int page =1;
        try{
            if(pageOptional.isPresent()){
                page = Integer.parseInt(pageOptional.get());
            }else{

            }
        }catch (Exception e){

        }
        Pageable pageable = PageRequest.of(page-1,2);
        Page<Order> orders = this.orderService.findAll(pageable);
        List<Order> orderList = orders.getContent();

        model.addAttribute("listorders",orderList);
        model.addAttribute("currentPage",page-1);
        model.addAttribute("totalPage",orders.getTotalPages());

        return "admin/order/index";
    }
    @GetMapping("/admin/order/detail/{id}")
    public String getdetail(@PathVariable long id, Model model) {
        Optional<Order> order = this.orderService.findByID(id);
        if(order.isPresent()) {
            model.addAttribute("order_details", order.get().getOrder_details());
        }
        return "admin/order/detail";
    }
    @GetMapping("/admin/order/update/{id}")
    public String updateorder(@PathVariable long id, Model model) {
        Optional<Order> order = this.orderService.findByID(id);
        if(order.isPresent()) {
            model.addAttribute("order", order.get());
        }
    return "admin/order/update";
    }
    @PostMapping("/admin/order/update")
    public String updateorder(@ModelAttribute("order") Order order) {
        Order oldOrder = this.orderService.findByID(order.getId()).get();
        if(oldOrder != null) {
            oldOrder.setStatus(order.getStatus());
            this.orderService.saveorder(oldOrder);
        }
    return "redirect:/admin/orders";
    }


    @GetMapping("/admin/order/delete/{id}")
    public String delete(@PathVariable long id, Model model) {
        Order order = this.orderService.findByID(id).get();
        if(order != null) {
            model.addAttribute("order", order);
        }
        return "admin/order/confirm-delete";
    }
    @PostMapping("/admin/order/confirmdelete")
    public String confirmdelete(@ModelAttribute("order") Order order) {
        Order oldorder = this.orderService.findByID(order.getId()).get();
        this.orderService.handlerDeleteOrder(oldorder);

        return "redirect:/admin/orders";
    }



}
