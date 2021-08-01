package com.fpoly.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.fpoly.entity.CategoriesEntity;

public interface CategoryRepository extends JpaRepository<CategoriesEntity, Long>{
	Page<CategoriesEntity>findAllByNameContaining (String name, Pageable pageable);
}
