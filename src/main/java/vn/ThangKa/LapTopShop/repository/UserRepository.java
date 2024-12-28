package vn.ThangKa.LapTopShop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.ThangKa.LapTopShop.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User,Long> {
    User findByEmail(String email);
    User findUserById(Long id);

    boolean existsByEmail(String email);
}
