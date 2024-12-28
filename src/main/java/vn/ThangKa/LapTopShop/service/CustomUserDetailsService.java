package vn.ThangKa.LapTopShop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;


@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UserService userService;


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        vn.ThangKa.LapTopShop.domain.User user = this.userService.getUserByemail(username);
        if (user == null) {
            throw new UsernameNotFoundException(username);
        }

        return new User(user.getEmail()
                ,user.getPassword()
                ,Collections.singletonList(new SimpleGrantedAuthority("ROLE_"+ user.getRole().getName())));
    }
}
