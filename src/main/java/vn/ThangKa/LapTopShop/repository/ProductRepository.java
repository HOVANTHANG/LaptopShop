package vn.ThangKa.LapTopShop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.ThangKa.LapTopShop.domain.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

}
