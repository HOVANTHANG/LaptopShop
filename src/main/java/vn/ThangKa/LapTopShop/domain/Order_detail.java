package vn.ThangKa.LapTopShop.domain;


import jakarta.persistence.*;

@Entity
@Table(name = "order_details")
public class Order_detail {
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Long getQuantity() {
        return quantity;
    }

    public void setQuantity(Long quantity) {
        this.quantity = quantity;
    }

    public Order getOrder_id() {
        return order_id;
    }

    public void setOrder_id(Order order_id) {
        this.order_id = order_id;
    }

    public Product getProduct_id() {
        return product_id;
    }

    public void setProduct_id(Product product_id) {
        this.product_id = product_id;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private double price;
    private Long quantity;

    @ManyToOne()
    @JoinColumn(name = "order_id")
    private Order order_id;

    @ManyToOne()
    @JoinColumn(name = "product_id")
    private Product product_id;

}
