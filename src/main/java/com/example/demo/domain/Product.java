package com.example.demo.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Column;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import jakarta.validation.constraints.Positive;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Min;

@Entity
@Table(name = "products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotBlank(message = "Product name is required")
    @Size(min = 3, max = 100, message = "Product name must be between 3 and 100 characters")
    private String name;

    @DecimalMin(value = "0.0", inclusive = false, message = "Price must be greater than 0")
    private double price;

    private String image;

    // Detailed/long description
    @Column(name = "detail_desc", columnDefinition = "MEDIUMTEXT")
    private String detailDesc;

    // Short blurb - DIFFERENT column name
    @Column(name = "short_desc", columnDefinition = "TEXT")
    private String shortDesc;

    @Min(value = 1, message = "Sold count must be at least 1")
    @Column(name = "sold")
    private long sold;

    @NotBlank(message = "Factory or brand name is required")
    private String factory;

    private String target;

    // @OneToMany(mappedBy = "product")
    // private List<OrderDetail> orderDetails; // List of order details associated
    // with this product
    public long getId() {
        return id;
    }

    @Override
    public String toString() {
        return "Product [id=" + id + ", name=" + name + ", price=" + price + ", image=" + image + ", detailDesc="
                + detailDesc + ", shortDesc=" + shortDesc + ", sold=" + sold + ", factory=" + factory + ", target="
                + target + "]";
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDetailDesc() {
        return detailDesc;
    }

    public void setDetailDesc(String detailDesc) {
        this.detailDesc = detailDesc;
    }

    public String getShortDesc() {
        return shortDesc;
    }

    public void setShortDesc(String shortDesc) {
        this.shortDesc = shortDesc;
    }

    public long getSold() {
        return sold;
    }

    public void setSold(long sold) {
        this.sold = sold;
    }

    public String getFactory() {
        return factory;
    }

    public void setFactory(String factory) {
        this.factory = factory;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

}
