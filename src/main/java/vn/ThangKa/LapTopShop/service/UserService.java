package vn.ThangKa.LapTopShop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.ThangKa.LapTopShop.domain.User;
import vn.ThangKa.LapTopShop.repository.UserRepository;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;



    public User createUser(User user) {
        return userRepository.save(user);
    }
}
