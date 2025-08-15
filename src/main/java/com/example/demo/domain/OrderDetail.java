package com.example.demo.domain;

import jakarta.persistence.Id;
import jakarta.persistence.GenerationType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "order_details")
public class OrderDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private long quantity; // Quantity of the product in the order detail
    private double price; // Price of the product in the order detail
    @ManyToOne
    @JoinColumn(name = "order_id")
    private Order order; // Reference to the order this detail belongs to

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product; // Reference to the product in this order detail
}
