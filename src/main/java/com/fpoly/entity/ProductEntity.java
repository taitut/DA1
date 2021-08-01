package com.fpoly.entity;

import java.math.BigDecimal;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.PositiveOrZero;

import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Entity
@Table(name="Product")
@Data
@EqualsAndHashCode(callSuper=false)
@SQLDelete(sql = "UPDATE Product SET status = 1 WHERE id=?")
@Where(clause = "status=0")
public class ProductEntity extends BaseEntity {
	
	
	@Column(name = "name")
	@NotBlank(message = "Không để trống tên sản phẩm")
	private String name;
	
	@Column(name = "image")
	private String image;
	
	@Column(name = "price")
	@NotNull(message = "Hãy nhập giá")
	@PositiveOrZero(message = "Giá phải >= 0")
	private BigDecimal price;

	@Column(name = "quantity")
	@NotNull(message = "Hãy nhập số lượng")
	@PositiveOrZero(message = "Số lượng phải >= 0")
	private Integer quantity;
	
	@Column(name = "ram")
	@NotBlank(message = "Không để trống tên thương hiệu")
	private String ram;
	
	@Column(name = "content",columnDefinition = "TEXT")
	@NotBlank(message = "Không để trống tên thương hiệu")
	private String content;
	
	@Column(name = "cpu")
	@NotBlank(message = "Không để trống tên dung tích")
	private String cpu;
	
	@OneToMany(mappedBy = "product")
	 private List<OrderDetailsEntity> invoicedetail;
	
	@ManyToOne 
	@JoinColumn(name = "categories_id")
	private CategoriesEntity categories;

	
	
}
