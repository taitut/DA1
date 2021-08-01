package com.fpoly.services;

import java.math.BigDecimal;
import java.util.Collection;

import com.fpoly.dto.CartItem;

public interface ICartServies {

	BigDecimal getAmount();

	Collection<CartItem> getAllItems();

	void clear();

	CartItem update(Long proId, int qty);

	void remove(Long id);

	void add(CartItem item);

	
	
}
