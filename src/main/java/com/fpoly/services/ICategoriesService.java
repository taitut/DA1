package com.fpoly.services;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.fpoly.entity.CategoriesEntity;

public interface ICategoriesService {
	Map<Long,String> findAll();
	List<CategoriesEntity>getAll();
	Long save(CategoriesEntity categoriesEntity);
	CategoriesEntity findOne(Long id);
	int delete(Long [] ids);
	Page<CategoriesEntity> findAll(Pageable page);
	Page<CategoriesEntity> searchByName(String keyString,Pageable page);
}
