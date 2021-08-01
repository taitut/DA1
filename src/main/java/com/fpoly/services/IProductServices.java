package com.fpoly.services;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.fpoly.entity.ProductEntity;

public interface IProductServices {
	List<ProductEntity> findAll();
	Long save(ProductEntity productEntity);
	ProductEntity findOne(Long id);
	int delete(Long [] ids);
	Page<ProductEntity> findAll(Pageable page);
	Page<ProductEntity> searchByCategory(String keyString,Pageable page);
	Page<ProductEntity> searchByName(String keyString,Pageable page);
	List<ProductEntity> findTop4D();
	List<ProductEntity> findTop4A();
	Page<ProductEntity> searchByCategoryName(String keyString,Pageable page);
	
}
