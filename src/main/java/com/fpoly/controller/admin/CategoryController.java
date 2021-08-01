package com.fpoly.controller.admin;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.entity.CategoriesEntity;
import com.fpoly.services.ICategoriesService;

@Controller
@RequestMapping("/admin/category")
public class CategoryController {
	
	@Autowired
	private ICategoriesService cate;
	@GetMapping("/list")
	public String getList(Model model, @RequestParam("p") Optional<Integer> p,@RequestParam(required = false,name = "s") String Key) {
		Pageable pageable = PageRequest.of(p.orElse(0), 2);
		Page<CategoriesEntity> page = cate.findAll(pageable);
		if (Key != null) {
			 page = cate.searchByName(Key, pageable);
			 model.addAttribute("key", Key);
		}
		model.addAttribute("category", page);
		return "admin/category/list";
	}
	@GetMapping("/edit")
	public String edit(@RequestParam (value="id", required = false) Long id, Model model) {
		if (id != null) {
			model.addAttribute("model", cate.findOne(id));
		}else {
		model.addAttribute("model", new CategoriesEntity());	
		}
		return "admin/category/edit";
	}
	
	@PostMapping()
	public String insert(@ModelAttribute("model") CategoriesEntity categoriesEntity, 
			Model model)  {
		cate.save(categoriesEntity);
		model.addAttribute("model", categoriesEntity);
		System.out.println("Insert");
		return "redirect:/admin/category/list";
	}
	
	@PutMapping()
	public String update(@ModelAttribute("product") CategoriesEntity categoriesEntity, 
			Model model) {
		Long id= cate.save(categoriesEntity);
		model.addAttribute("model", categoriesEntity);
		System.out.println("update");
		return "redirect:/admin/category/edit?id="+id.toString();
	}
	@PostMapping("/delete")
	public String delete(@RequestBody Long[] ids, 
			Model model) {
		cate.delete(ids);
		return "redirect:/admin/category/list";
	}
	
}
