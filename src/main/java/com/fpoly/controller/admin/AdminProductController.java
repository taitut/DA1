package com.fpoly.controller.admin;

import java.io.IOException;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fpoly.entity.ProductEntity;
import com.fpoly.services.ICategoriesService;
import com.fpoly.services.IProductServices;
import com.fpoly.utils.FileUload;
import com.fpoly.utils.MessageUtils;

@Controller
@RequestMapping("/admin/product")
public class AdminProductController {
	@Autowired
	private IProductServices productS;
	@Autowired
	private ICategoriesService cate;
	@Autowired
	private MessageUtils message;

	
	 
	@GetMapping("/edit")
	   public String editProduct(@RequestParam (value="id", required = false) Long id,
			   Model model,
			   @RequestParam(value= "message", required = false) String messages) {
		
		if (id != null) {
			model.addAttribute("model", productS.findOne(id));
		}else {
		model.addAttribute("model", new ProductEntity());	
		model.addAttribute("category",cate.findAll());
		}
		if (messages !=null) {
			message.sendMessage(messages, model);
		}
		model.addAttribute("category",cate.findAll());
	      return "admin/product/edit";
	   }
	@PostMapping()
	public String insert(@Validated @ModelAttribute("model") ProductEntity product, BindingResult result,
			Model model,@RequestParam("photo") MultipartFile multipart) throws IOException {
		
		if (result.hasErrors() || multipart.isEmpty() ) {
			model.addAttribute("category",cate.findAll());
			if (multipart.isEmpty()) {
				model.addAttribute("messImg","Không để trống ảnh");
			}
			
				message.sendMessage("error_system", model);
			return "admin/product/edit";
		}
		if (!multipart.isEmpty()) {
			String fileName = StringUtils.cleanPath(multipart.getOriginalFilename());
			String uploadDir = "upload/";
			FileUload.saveFile(uploadDir, fileName, multipart);
			product.setImage(fileName);
			productS.save(product);
		}
		
		model.addAttribute("model", product);
		
		return "redirect:/admin/product/list?message=insert_success";
	}
	@PutMapping()
	public String update(@Validated @ModelAttribute("model") ProductEntity product, BindingResult result, 
			Model model, @RequestParam("photo") MultipartFile multipart) throws IOException {
		if (result.hasErrors()&& multipart.isEmpty()) {
			model.addAttribute("category",cate.findAll());
			model.addAttribute("messImg","Không để trống ảnh");
			message.sendMessage("error_system", model);
			return "redirect:/admin/product/edit?id="+product.getId()+"&message=error_system";
		}
		
		if (!multipart.isEmpty()) {	
			String fileName = StringUtils.cleanPath(multipart.getOriginalFilename());
			String uploadDir = "upload/";
			FileUload.saveFile(uploadDir, fileName, multipart);
			product.setImage(fileName);
			
		}
		Long id= productS.save(product);
		model.addAttribute("model", product);
		return "redirect:/admin/product/edit?id="+id.toString()+"&message=update_success";
	}
	@PostMapping("/delete")
	public String delete(@RequestBody Long[] ids, 
			Model model) {
		 productS.delete(ids);
		return "redirect:/admin/product/list";
	}
	@GetMapping("/list")
	public String paginate(Model model, @RequestParam("p") Optional<Integer> p,
			@RequestParam(required = false,name = "s") String Key,
			@RequestParam(value= "message", required = false) String messages
			) {
		 
		Pageable pageable = PageRequest.of(p.orElse(0), 4);
		Page<ProductEntity> page = productS.findAll(pageable);
		if (Key != null) {
			 page = productS.searchByName(Key, pageable);
			 model.addAttribute("key", Key);
		}
		model.addAttribute("model", page);
		if (messages !=null) {
			message.sendMessage(messages, model);
		}
		return "admin/product/list";
	}

}
