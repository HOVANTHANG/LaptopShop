package vn.ThangKa.LapTopShop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.ThangKa.LapTopShop.domain.User;
import vn.ThangKa.LapTopShop.domain.dto.registerDTO;
import vn.ThangKa.LapTopShop.repository.UserRepository;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;



    public User createUser(User user) {
        return userRepository.save(user);
    }


    public List<User> getAllUsers() {
        return userRepository.findAll();
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


}
