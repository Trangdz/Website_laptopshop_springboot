package com.example.demo.service;

import org.springframework.stereotype.Service;
import com.example.demo.repository.UserRepository;
import com.example.demo.domain.User;
import java.util.List;

@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }


    public List<User> getAllUsers(){
        return userRepository.findAll();
    }

    public List<User> getAllUsersByEmail(String email) {
        return this.userRepository.findAllByEmail(email);
    }
    public User handleSaveUser(User user) {
        // Save user to database
        User eric = userRepository.save(user);
        return eric;
    }

    public User getUserById(long id) {
        // Retrieve user by ID
        return userRepository.findById(id).orElse(null);
    }
    // public String handleHello() {
    // return "Hello from UserService!";
    // }

    // public User saveUser(User user) {
    // return userRepository.save(user);
    // }

    // public List<User> getAllUsers() {
    // return userRepository.findAll();
    // }
    public void deleteUserById(long id) {
        // Delete user by ID
        userRepository.deleteById(id);
    }

}