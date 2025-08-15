package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.example.demo.domain.User;
import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    // JpaRepository provides basic CRUD operations
    // You can add custom query methods here if needed
    User save(User user); // Optional, as JpaRepository already has a save method

    List<User> findAllByEmail(String email); // Example of a custom query method
    List<User> findAll();
    User findById(long id); // Example of a custom query method
}

