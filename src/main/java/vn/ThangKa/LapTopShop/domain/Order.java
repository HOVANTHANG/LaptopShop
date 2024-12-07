package vn.ThangKa.LapTopShop.domain;

import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name = "orders")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private double totalPrice;

    @ManyToOne()
    @JoinColumn(name = "user_id")
    private User user;


    @OneToMany(mappedBy = "order_id")
    private List<Order_detail> order_details;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Order_detail> getOrder_details() {
        return order_details;
    }

    public void setOrder_details(List<Order_detail> order_details) {
        this.order_details = order_details;
    }
}
