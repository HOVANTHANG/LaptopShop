package vn.ThangKa.LapTopShop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.ThangKa.LapTopShop.domain.Cart;
import vn.ThangKa.LapTopShop.domain.CartDetails;
import vn.ThangKa.LapTopShop.domain.Product;

import java.util.Optional;

@Repository
public interface CartDetailsRepository extends JpaRepository<CartDetails, Long> {
    CartDetails findByCartAndProduct(Cart cart, Product product);
    Optional<CartDetails> findById(Long id);

}
