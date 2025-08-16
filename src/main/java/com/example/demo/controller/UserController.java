package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.example.demo.service.UserService;
import com.example.demo.service.RoleService;
import com.example.demo.service.UploadService;
import com.example.demo.domain.User;
import com.example.demo.domain.Role;

import java.util.List;

@Controller
public class UserController {

    private final UserService userService;
    private final RoleService roleService;
    // private final UserRepository userRepository;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, RoleService roleService,
                          UploadService uploadService,
                          PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
        this.roleService = roleService;
        this.uploadService = uploadService;
        this.userService = userService;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        List<User> arrUsers = this.userService.getAllUsersByEmail("tranghoohoo@ass.com");
        System.out.println(arrUsers);
        model.addAttribute("eric", "test");
        return "hello";
    }

    @RequestMapping("/admin/user")
    public String getUserPage(Model model) {
        // String test = this.userService.handleHello();
        // model.addAttribute("eric", test);
        // model.addAttribute("newUser", new User());
        List<User> users = this.userService.getAllUsers();
        model.addAttribute("users", users);
        return "admin/user/show";
    }

    @RequestMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String createUser(Model model, @ModelAttribute("newUser") User user,
            @RequestParam("hoidanitFile") MultipartFile file) {
        // Save user to database
        String avatar = this.uploadService.handleSaveUploadFile(file,"avatar");
        user.setAvatar(avatar);
        
        // Hash password
        String hashedPassword = this.passwordEncoder.encode(user.getPassword());
        user.setPassword(hashedPassword);
        
        // Handle Role from form
        if (user.getRole() != null && user.getRole().getName() != null) {
            Role existingRole = this.roleService.findByName(user.getRole().getName());
            if (existingRole != null) {
                user.setRole(existingRole);
            } else {
                // Create new role if not exists
                Role newRole = new Role();
                newRole.setName(user.getRole().getName());
                newRole.setDescription("Auto-created role");
                Role savedRole = this.roleService.save(newRole);
                user.setRole(savedRole);
            }
        }
        
        this.userService.handleSaveUser(user);
        return "redirect:/admin/user";
    }

    @RequestMapping("/admin/user/detail/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        return "admin/user/detail";
    }

    @RequestMapping("/admin/user/show/")
    public String abc(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/detail";
    }

    @RequestMapping("/admin/user/update/{id}")
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("newUser", user);
        return "admin/user/update";
    }

    @RequestMapping(value = "/admin/user/update", method = RequestMethod.POST)
    public String updateUser(Model model, @ModelAttribute("newUser") User user,
                           @RequestParam("hoidanitFile") MultipartFile file) {
        // Get existing user from database to preserve password
        User existingUser = this.userService.getUserById(user.getId());

        // Update only non-password fields
        existingUser.setEmail(user.getEmail());
        existingUser.setFullname(user.getFullname());
        existingUser.setAddress(user.getAddress());
        existingUser.setPhone(user.getPhone());
        
        // Handle file upload
        if (!file.isEmpty()) {
            String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
            existingUser.setAvatar(avatar);
        }
        
        // Handle role update
        if (user.getRole() != null && user.getRole().getName() != null) {
            Role existingRole = this.roleService.findByName(user.getRole().getName());
            if (existingRole != null) {
                existingUser.setRole(existingRole);
            }
        }
        
        // Keep existing password unchanged

        // Save updated user
        this.userService.handleSaveUser(existingUser);
        return "redirect:/admin/user";
    }

    @RequestMapping(value = "/admin/user/delete/{id}", method = RequestMethod.POST)
    public String deleteUser(@PathVariable long id) {
        this.userService.delleteUserById(id);
        return "redirect:/admin/user";
    }

}
