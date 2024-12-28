package vn.ThangKa.LapTopShop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.ThangKa.LapTopShop.domain.Order;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
}
