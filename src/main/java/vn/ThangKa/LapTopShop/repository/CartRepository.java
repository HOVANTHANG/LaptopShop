package vn.ThangKa.LapTopShop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import vn.ThangKa.LapTopShop.domain.Cart;
import vn.ThangKa.LapTopShop.domain.User;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long> {
    Cart findByUser(User user);

    @Modifying
    @Query("DELETE FROM Cart c WHERE c.id = :id")
    void deleteById(@Param("id") Long id);
}
