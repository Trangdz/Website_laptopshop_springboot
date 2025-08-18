package com.example.demo.service;
import org.springframework.stereotype.Service;
import com.example.demo.repository.ProductRepository;
import com.example.demo.domain.Product;
import java.util.List;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    public void handleSaveProduct(Product product) {
        // Save product to database
        productRepository.save(product);
    }

    public Product getProductById(long id) {
        // Retrieve product by ID
        return productRepository.findProductById(id);
    }
}
