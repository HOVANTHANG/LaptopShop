package vn.ThangKa.LapTopShop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.ThangKa.LapTopShop.domain.Order_detail;

@Repository
public interface OrderDetailsRepository extends JpaRepository<Order_detail,Long> {
}
