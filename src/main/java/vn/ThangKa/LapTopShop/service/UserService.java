package vn.ThangKa.LapTopShop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import vn.ThangKa.LapTopShop.domain.User;
import vn.ThangKa.LapTopShop.domain.dto.registerDTO;
import vn.ThangKa.LapTopShop.repository.OrderRepository;
import vn.ThangKa.LapTopShop.repository.ProductRepository;
import vn.ThangKa.LapTopShop.repository.UserRepository;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private OrderRepository orderRepository;



    public User createUser(User user) {
        return userRepository.save(user);
    }


    public Page<User> getAllUsers(Pageable  pageable) {
        return userRepository.findAll(pageable);
    }
    public User getUserByemail(String email) {
        return userRepository.findByEmail(email);
    }

    public User findUserById(Long id){
        return userRepository.findUserById(id);
    }

    public void UpdateUser(User user) {


        userRepository.saveAndFlush(user);
    }
    public void DeleteUser(Long id) {
        userRepository.deleteById(id);
    }


    public User registerDTOtoUser(registerDTO register){
        User user = new User();

        user.setFullName(register.getLastName()+register.getFirstName());
        user.setEmail(register.getEmail());
        user.setPassword(register.getPassword());

        return user;
    }
    public boolean existsByEmail(String email) {
        return userRepository.existsByEmail(email);
    }

    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }


    public long countUser() {
        return userRepository.count();
    }
    public long countProduct() {
        return productRepository.count();
    }
    public long countOrder() {
        return orderRepository.count();
    }
}
