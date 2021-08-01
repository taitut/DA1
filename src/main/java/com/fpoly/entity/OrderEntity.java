package com.fpoly.entity;

import java.math.BigDecimal;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Entity
@Table(name="oder")
@Data
@EqualsAndHashCode(callSuper=false)
public class OrderEntity extends BaseEntity {
	
	@Column(name = "address")
	private String address;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "phone")
	private String phone;
	
	@Column(name = "note",columnDefinition = "TEXT")
	private String note;
	
	@Column(name = "totalprice")
	private BigDecimal totalPrice;
	
	@ManyToOne 
	@JoinColumn(name = "accountid")
	private AccountsEntity account;
	
	@OneToMany(mappedBy = "oder")
	 private List<OrderDetailsEntity> oderdetails;
}
