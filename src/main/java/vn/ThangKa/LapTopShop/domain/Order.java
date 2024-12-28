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

    private String receiverName;
    private String receiverAddress;
    private String receiverPhone;
    private String status;
    @ManyToOne()
    @JoinColumn(name = "user_id")
    private User user;


    @OneToMany(mappedBy = "order")
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

    public String getReceiverName() {
        return receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    public String getReceiverAddress() {
        return receiverAddress;
    }

    public void setReceiverAddress(String receiverAddress) {
        this.receiverAddress = receiverAddress;
    }

    public String getReceiverPhone() {
        return receiverPhone;
    }

    public void setReceiverPhone(String receiverPhone) {
        this.receiverPhone = receiverPhone;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<Order_detail> getOrder_details() {
        return order_details;
    }

    public void setOrder_details(List<Order_detail> order_details) {
        this.order_details = order_details;
    }
}
