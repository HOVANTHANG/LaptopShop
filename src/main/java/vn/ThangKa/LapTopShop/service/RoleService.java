package vn.ThangKa.LapTopShop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.ThangKa.LapTopShop.domain.Role;
import vn.ThangKa.LapTopShop.repository.RoleRepository;

@Service
public class RoleService {
    @Autowired
    private RoleRepository roleRepository;


    public Role getrolebyname(String name){
        return  roleRepository.findByName(name);
    }


}
