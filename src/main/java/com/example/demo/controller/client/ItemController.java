package com.example.demo.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class ItemController {
    @GetMapping("/products/{id}")
    public String getMethodName(Model model, @PathVariable("id") String id) {
        return "client/product/detail";
    }
    
}
