package com.example.demo.service;

import org.springframework.stereotype.Service;
import com.example.demo.repository.RoleRepository;
import com.example.demo.domain.Role;

@Service
public class RoleService {

    private final RoleRepository roleRepository;

    public RoleService(RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
    }

    public Role findByName(String name) {
        return roleRepository.findByName(name);
    }

    public Role save(Role role) {
        return roleRepository.save(role);
    }

    public boolean existsByName(String name) {
        return roleRepository.findByName(name) != null;
    }

    public Role getRoleByName(String name) {
        return roleRepository.findByName(name);
    }
}

