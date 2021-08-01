package com.fpoly.dto;

import com.fpoly.entity.OrderEntity;
import com.fpoly.entity.ProductEntity;

import lombok.Data;

@Data
public class CartItem {
	private String name;
	private int quantity;
	private String image;
	private String address;
	private ProductEntity product;
	private OrderEntity order;
}
