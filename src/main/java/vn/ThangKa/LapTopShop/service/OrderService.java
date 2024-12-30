package vn.ThangKa.LapTopShop.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import vn.ThangKa.LapTopShop.domain.Order;
import vn.ThangKa.LapTopShop.domain.Order_detail;
import vn.ThangKa.LapTopShop.repository.OrderDetailsRepository;
import vn.ThangKa.LapTopShop.repository.OrderRepository;

import java.util.List;
import java.util.Optional;

@Service
public class OrderService {

    private OrderDetailsRepository orderDetailsRepository;
    private OrderRepository orderRepository;

    public OrderService(OrderRepository orderRepository,OrderDetailsRepository orderDetailsRepository) {
        this.orderRepository = orderRepository;
        this.orderDetailsRepository = orderDetailsRepository;
    }

    public Page<Order> findAll(Pageable pageable) {

        return orderRepository.findAll(pageable);
    }

    public Optional<Order> findByID(long id) {
        return this.orderRepository.findById(id);
    }

    public void saveorder(Order oldOrder) {
        this.orderRepository.save(oldOrder);
    }

    public void handlerDeleteOrder(Order order) {
        List<Order_detail> order_details = order.getOrder_details();
        if (order_details!=null) {
            for (Order_detail order_detail : order_details) {
                this.orderDetailsRepository.deleteById(order_detail.getId());
            }
            this.orderRepository.deleteById(order.getId());
        }
    }
}
