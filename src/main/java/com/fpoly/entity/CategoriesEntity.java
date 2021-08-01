package com.fpoly.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Entity
@Table(name="Categories")
@Data
@EqualsAndHashCode(callSuper=false)

@SQLDelete(sql = "UPDATE Categories SET status = 1 WHERE id=?")
@Where(clause = "status=0")
public class CategoriesEntity extends BaseEntity {
	
	@Column(name = "code")
	private String code;
	@Column(name = "name")
	private String name;
	
	@OneToMany(mappedBy = "categories")
	 private List<ProductEntity> product;

	
	
}
