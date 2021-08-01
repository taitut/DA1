package com.fpoly.entity;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Entity
@Table(name="Orderdetails")
@Data
@EqualsAndHashCode(callSuper=false)
public class OrderDetailsEntity extends BaseEntity {
	
	
	@Column(name = "price")
	private BigDecimal price;
	
	@Column(name = "quantity")
	private int quantity;
	
	@ManyToOne 
	@JoinColumn(name = "orderid")
	private OrderEntity oder;
	
	@ManyToOne 
	@JoinColumn(name = "productid")
	private ProductEntity product;
	
	
}
