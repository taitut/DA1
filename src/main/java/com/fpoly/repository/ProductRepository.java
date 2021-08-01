package com.fpoly.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.fpoly.entity.ProductEntity;

public interface ProductRepository extends JpaRepository<ProductEntity, Long> {
	Page<ProductEntity>findAllByCategoriesNameContaining (String name, Pageable pageable);
	Page<ProductEntity>findAllByNameContaining (String name, Pageable pageable);
	Page<ProductEntity>findAllByCategoriesCode(String name, Pageable pageable);
	List<ProductEntity> findTop6ByOrderByCreateDateAsc();
	List<ProductEntity> findTop4ByOrderByCreateDateDesc();
	
}
