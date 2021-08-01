package com.fpoly.services;


import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.fpoly.dto.CartItem;
import com.fpoly.entity.OrderDetailsEntity;
import com.fpoly.entity.OrderEntity;

public interface IOrderServices {
	void save(Map<Long, CartItem> carts);
	Long save(OrderEntity oderDetails);
	Page<OrderEntity> findAll(Pageable page);
	 List<OrderDetailsEntity>  findBuyOrderId(Long id);
	 OrderDetailsEntity findDoanhthu (String date);
	 List<OrderDetailsEntity>findAllDetail();
	 List<OrderEntity> findAll();
	 OrderEntity findOneById(Long id);
	 OrderEntity findOneByAccountId(Long id);
	 List<Object[]> findAllBuyYear(int year);
	 List<Object[]> findBuyCategory(int year);
	 List<Object[]> findpriceYear(int year);
	 List<OrderEntity>  findBuyAllUsername(String userName);
}
