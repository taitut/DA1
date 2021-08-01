package com.fpoly.services.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fpoly.entity.CategoriesEntity;
import com.fpoly.repository.CategoryRepository;
import com.fpoly.services.ICategoriesService;

@Service
public class CategoryService implements ICategoriesService {
	
	@Autowired
	private CategoryRepository cate;
	@Override
	public Map<Long,String> findAll() {
		Map<Long,String> re = new HashMap<Long, String>();
		List<CategoriesEntity> entity = cate.findAll();
		for (CategoriesEntity item : entity) {
			re.put(item.getId(), item.getName());
		}
		return re;
	}
	
	@Override
	@Transactional
	public Long save(CategoriesEntity categories) {
		CategoriesEntity categoriesEntity = new CategoriesEntity();
		if (categories.getId() !=null) {
			Optional<CategoriesEntity> oldCate = cate.findById(categories.getId());
			categoriesEntity = categories;
			categoriesEntity.setCreateDate(oldCate.get().getCreateDate());
			categoriesEntity.setCreatedBy(oldCate.get().getCreatedBy());
			cate.save(categoriesEntity);
					return  categoriesEntity.getId();
		}else {
			cate.save(categories);
			return categoriesEntity.getId();
		}
	}
	@Override
	public CategoriesEntity findOne(Long id) {
		Optional<CategoriesEntity> opt = cate.findById(id);
		if (opt.isPresent()) {
			return opt.get();
		}
		return null;
	}
	@Override
	@Transactional
	public int delete(Long[] ids) {
			for (long id : ids) {
			cate.deleteById(id);	
		}
		return 1;

	}
	@Override
	public Page<CategoriesEntity> findAll(Pageable page) {
		return cate.findAll(page);
	}

	@Override
	public Page<CategoriesEntity> searchByName(String keyString, Pageable page) {
		// TODO Auto-generated method stub
		return cate.findAllByNameContaining(keyString, page);
	}

	@Override
	public List<CategoriesEntity> getAll() {
		// TODO Auto-generated method stub
		return cate.findAll();
	}
	
}
