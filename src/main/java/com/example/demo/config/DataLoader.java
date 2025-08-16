package com.example.demo.config;

import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import com.example.demo.service.UserService;
import com.example.demo.domain.User;

@Component
public class DataLoader implements CommandLineRunner {

    private final UserService userService;

    public DataLoader(UserService userService) {
        this.userService = userService;
    }

    @Override
    public void run(String... args) throws Exception {
        // Check if users already exist to avoid duplicates
        if (userService.getAllUsers().isEmpty()) {
            // Create sample users
            User user1 = new User();
            user1.setEmail("admin@example.com");
            user1.setPassword("123456");
            user1.setFullname("Admin User");
            user1.setAddress("123 Admin Street");
            user1.setPhone("0123456789");
            userService.handleSaveUser(user1);

            User user2 = new User();
            user2.setEmail("user@example.com");
            user2.setPassword("123456");
            user2.setFullname("Regular User");
            user2.setAddress("456 User Avenue");
            user2.setPhone("0987654321");
            userService.handleSaveUser(user2);

            User user3 = new User();
            user3.setEmail("test@example.com");
            user3.setPassword("123456");
            user3.setFullname("Test User");
            user3.setAddress("789 Test Road");
            user3.setPhone("0555555555");
            userService.handleSaveUser(user3);

            System.out.println("Sample users created successfully!");
        } else {
            System.out.println("Users already exist, skipping data loading.");
        }
    }
}
