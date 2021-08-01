package com.fpoly.services.Impl;

import java.math.BigDecimal;
import java.math.MathContext;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.fpoly.dto.CartItem;
import com.fpoly.services.ICartServies;
import com.fpoly.utils.sessionUtils;

@SessionScope
@Service
public class CartService  implements ICartServies{
	@Autowired
	private sessionUtils session;
	Map<Long, CartItem> maps = new HashMap<>();
	@Override
	public void add(CartItem item) {
		CartItem cartItem = maps.get(item.getProduct().getId());
		if (cartItem == null) {
			maps.put(item.getProduct().getId(), item);
		}else {
			cartItem.setQuantity(cartItem.getQuantity()+1);
		}
	}
	@Override
	public void remove(Long id) {
		maps.remove(id);
	}
	@Override
	public CartItem update(Long proId, int qty) {
		CartItem cartItem = maps.get(proId);
		cartItem.setQuantity(qty);
		return cartItem;
	}
	@Override
	public void clear() {
		session.removeAttribute("cart");
		maps.clear();
	}
	@Override
	public Collection<CartItem> getAllItems(){
		session.setAttribute("cart", maps);
		return maps.values();
	}
	@Override
	public BigDecimal getAmount() {
		double a = maps.values().parallelStream().mapToDouble(item -> item.getQuantity() * item.getProduct().getPrice().doubleValue()).sum();
		BigDecimal total = new BigDecimal(a,MathContext.DECIMAL64);
		return  total;
	}
}
