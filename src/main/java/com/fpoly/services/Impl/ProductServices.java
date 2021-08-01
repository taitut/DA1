package com.fpoly.services.Impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fpoly.entity.CategoriesEntity;
import com.fpoly.entity.ProductEntity;
import com.fpoly.repository.CategoryRepository;
import com.fpoly.repository.ProductRepository;
import com.fpoly.services.IProductServices;

@Service
public class ProductServices implements IProductServices {
	
	@Autowired
	private ProductRepository pro;
	@Autowired
	private CategoryRepository caterp;
	
	@Override
	public List<ProductEntity> findAll() {
		return pro.findAll();
	}
	@Override
	@Transactional
	public Long save(ProductEntity productEnti) {
		Optional<CategoriesEntity> cate = caterp.findById(productEnti.getCategories().getId());
		ProductEntity productEntity = new ProductEntity();
		if (productEnti.getId() !=null) {
			Optional<ProductEntity> oldProduct = pro.findById(productEnti.getId());
			oldProduct.get().setCategories(cate.get());
			 if (productEnti.getImage()==null) {
				 productEnti.setImage(oldProduct.get().getImage()); }
			productEntity = productEnti;
			productEntity.setCreateDate(oldProduct.get().getCreateDate());
			productEntity.setCreatedBy(oldProduct.get().getCreatedBy());
					pro.save(productEntity);
					return  productEntity.getId();
		}else {
			productEntity.setCategories(cate.get());
			pro.save(productEnti);
			return productEntity.getId();
		}
		
		
	}
	@Override
	public ProductEntity findOne(Long id) {
		Optional<ProductEntity> opt = pro.findById(id);
		if (opt.isPresent()) {
			return pro.getById(id);
		}
		return null;
	}
	
	@Override
	@Transactional
	public int delete(Long[] ids) {
		
			for (long id : ids) {
			pro.deleteById(id);
			
			}
			return 1;

	}
	@Override
	public Page<ProductEntity> findAll(Pageable page) {
		return pro.findAll(page);
	}
	@Override
	public Page<ProductEntity> searchByCategory(String keyString, Pageable page) {
		
		return pro.findAllByCategoriesNameContaining(keyString, page);
	}
	@Override
	public Page<ProductEntity> searchByName(String keyString, Pageable page) {
		return pro.findAllByNameContaining(keyString, page);
	}
	@Override
	public List<ProductEntity> findTop4D() {
		return pro.findTop4ByOrderByCreateDateDesc();
	}
	@Override
	public List<ProductEntity> findTop4A() {
		return pro.findTop6ByOrderByCreateDateAsc();
	}
	@Override
	public Page<ProductEntity> searchByCategoryName(String keyString, Pageable page) {
		return pro.findAllByCategoriesCode(keyString, page);
	}

}





