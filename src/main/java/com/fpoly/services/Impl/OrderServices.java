package com.fpoly.services.Impl;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.fpoly.dto.CartItem;
import com.fpoly.entity.OrderDetailsEntity;
import com.fpoly.entity.OrderEntity;
import com.fpoly.entity.ProductEntity;
import com.fpoly.repository.OderRepository;
import com.fpoly.repository.OrderDetaisRepository;
import com.fpoly.services.IOrderServices;
import com.fpoly.services.IProductServices;
@Service
public class OrderServices implements IOrderServices {
	@Autowired
	private OderRepository oder;
	@Autowired
	private OrderDetaisRepository oderDet;

	@Autowired
	private IProductServices pro;

	
Long id ;
	@Override
	public Long save(OrderEntity oderDetails) {
		oder.save(oderDetails);
		id = oderDetails.getId();
		return oderDetails.getId();
	}

	@Override
	@Transactional
	public void save(Map<Long, CartItem> carts) {
		OrderEntity or = oder.getById(id);
		 for (Map.Entry<Long, CartItem> itemcart : carts.entrySet()) {
			OrderDetailsEntity orderD = new OrderDetailsEntity();
			ProductEntity product = pro.findOne(itemcart.getValue().getProduct().getId());
			orderD.setOder(or);
			orderD.setProduct(itemcart.getValue().getProduct());
			
			orderD.setQuantity(itemcart.getValue().getQuantity());
			orderD.setPrice(itemcart.getValue().getProduct().getPrice());
			if ((product.getQuantity()-itemcart.getValue().getQuantity()) >= 0) {
				product.setQuantity(product.getQuantity()-itemcart.getValue().getQuantity());
			}else if ((product.getQuantity()-itemcart.getValue().getQuantity()) == 0) {
				product.setQuantity(product.getQuantity()-itemcart.getValue().getQuantity());
				product.setStatus(false);
			} {
				
			}
			pro.save(product);
				oderDet.save(orderD);
		}
	
		
	}

	@Override
	public Page<OrderEntity> findAll(Pageable page) {
		// TODO Auto-generated method stub
		return oder.findAll(page);
	}

	@Override
	public  List<OrderDetailsEntity>  findBuyOrderId(Long id) {
		// TODO Auto-generated method stub
		return oderDet.findAllBuyOrderId(id);
	}

	@Override
	public OrderDetailsEntity findDoanhthu(String date) {
		// TODO Auto-generated method stub
		return oderDet.fidoanhthu(date);
	}

	@Override
	public List<OrderDetailsEntity> findAllDetail() {
		return oderDet.findAll();
	}

	@Override
	public List<OrderEntity> findAll() {
		return oder.findAll();
	}

	@Override
	public OrderEntity findOneById(Long id) {
		// TODO Auto-generated method stub
		return oder.getById(id);
	}

	@Override
	public OrderEntity findOneByAccountId(Long id) {
		// TODO Auto-generated method stub
		return oder.findOneByAccountId(id);
	}

	@Override
	public List<Object[]> findAllBuyYear(int year) {
		return oder.findAllByYear(year);
	}

	@Override
	public List<Object[]> findBuyCategory(int year) {
		
		return oderDet.findByCategory(year);
	}

	@Override
	public List<Object[]> findpriceYear(int year) {
		return oder.findpriceYear(year);
	}

	@Override
	public List<OrderEntity> findBuyAllUsername(String userName) {
		return oder.findAllBuyUsername(userName);
	}

}
