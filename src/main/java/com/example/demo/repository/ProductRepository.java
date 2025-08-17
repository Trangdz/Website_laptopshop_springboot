package com.example.demo.repository;

import com.example.demo.domain.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository // có thể bỏ, không bắt buộc
public interface ProductRepository extends JpaRepository<Product, Long> {

    // Tìm chính xác theo name
    List<Product> findAllByName(String name);

    List<Product> findAll(); // Tương đương với findAllByName
    // Gợi ý thêm: tìm gần đúng, không phân biệt hoa thường

    List<Product> findByNameContainingIgnoreCase(String keyword);

    // KHÔNG cần khai báo findById - đã có sẵn trong JpaRepository:
    // Optional<Product> findById(Long id);
}
