package com.example.demo.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.ui.Model;
import com.example.demo.domain.Product;
import com.example.demo.service.ProductService;
import java.util.List;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import jakarta.validation.Valid;
import org.springframework.validation.BindingResult;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.validation.FieldError;
import com.example.demo.service.UploadService;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class ProductController {

    private final ProductService productService;
    private final UploadService UploadService;

    public ProductController(ProductService productService, UploadService UploadService) {
        this.UploadService = UploadService;
        this.productService = productService;
    }

    @GetMapping("/admin/product")
    public String getMethodName(Model model) {
        List<Product> products = this.productService.getAllProducts();
        model.addAttribute("products", products);
        return "/admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String createProduct(Model model) {
        model.addAttribute("newProduct", new Product());
        return "/admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String createProduct(Model model, @ModelAttribute("newProduct") @Valid Product newProduct,
            BindingResult newProductbindingResult,
            @RequestParam("hoidanitFile") MultipartFile file) {

        // Validate the product
        List<FieldError> errors = newProductbindingResult.getFieldErrors();
        if (newProductbindingResult.hasErrors()) {
            model.addAttribute("errors", errors);
            return "/admin/product/create";
        }
        String image = this.UploadService.handleSaveUploadFile(file, "product");
        newProduct.setImage(image);

        // Save product
        // TODO: process POST request
        this.productService.handleSaveProduct(newProduct);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/update/{id}")
    public String getUpdateProduct(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id);
        if (product == null) {
            return "redirect:/admin/product";
        }
        model.addAttribute("newProduct", product);
        return "/admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String updateProduct(Model model,
            @ModelAttribute("newProduct") @Valid Product product,
            BindingResult newProductbindingResult,
            @RequestParam("hoidanitFile") MultipartFile file) {
        // Validate the product
        List<FieldError> errors = newProductbindingResult.getFieldErrors();
        if (newProductbindingResult.hasErrors()) {
            model.addAttribute("errors", errors);
            return "/admin/product/update";
        }
        // Save product
        Product existingProduct = this.productService.getProductById(product.getId());
        if (existingProduct == null) {
            return "redirect:/admin/product";
        }

        existingProduct.setName(product.getName());
        existingProduct.setPrice(product.getPrice());
        existingProduct.setDetailDesc(product.getDetailDesc());
        existingProduct.setShortDesc(product.getShortDesc());
        existingProduct.setSold(product.getSold());
        existingProduct.setFactory(product.getFactory());
        existingProduct.setTarget(product.getTarget());
        if (!file.isEmpty()) {
            String image = this.UploadService.handleSaveUploadFile(file, "product");
            existingProduct.setImage(image);
        }
        this.productService.handleSaveProduct(existingProduct);
        return "redirect:/admin/product";
    }

}
