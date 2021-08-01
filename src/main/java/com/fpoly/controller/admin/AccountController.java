package com.fpoly.controller.admin;

import java.io.IOException;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

import com.fpoly.entity.AccountsEntity;
import com.fpoly.entity.Role;
import com.fpoly.services.IAccountService;
import com.fpoly.services.Impl.FileServices;
import com.fpoly.utils.MessageUtils;

@Controller
@RequestMapping("/admin/account")
public class AccountController {
	@Autowired
	private IAccountService acc;
	@Autowired
	private FileServices file;
	@Autowired
	private MessageUtils message;
	@GetMapping("/list")
	public String paginate(Model model, @RequestParam("p") Optional<Integer> p,
			@RequestParam(required = false, name = "s") String Key,
			@RequestParam(value= "message", required = false) String messages) {
		
		Pageable pageable = PageRequest.of(p.orElse(0), 2);
		Page<AccountsEntity> page = acc.findAll(pageable);
		if (Key != null) {
			page = acc.searchByUserName(Key, pageable);
			model.addAttribute("key", Key);
		}
		if (messages !=null) {
			message.sendMessage(messages, model);
		}
		
		model.addAttribute("model", page);
		
		return "admin/account/list";
	}

	@GetMapping("/edit")
	public String editAccount(@RequestParam(value = "id", required = false) Long id, Model model,
			@RequestParam(value= "message", required = false) String messages) {
		if (id != null) {
			model.addAttribute("model", acc.findOne(id));
		}else {
			model.addAttribute("model", new AccountsEntity());
		}
		if (messages !=null) {
			message.sendMessage(messages, model);
		}
		model.addAttribute("role", Role.values());
		return "admin/account/edit";
	}

	@PostMapping()
	public String insert(@Validated @ModelAttribute("model") AccountsEntity accountEntity, BindingResult result,
			Model model,
			@RequestParam("photoo") MultipartFile multipart) throws IOException {
		
		AccountsEntity acount  = acc.findBuyUsername(accountEntity.getUserName());
		AccountsEntity acount1 = acc.findBuyEmail(accountEntity.getEmail());
		if (result.hasErrors() || multipart.isEmpty() || acount != null || acount1!=null) {
			if ( multipart.isEmpty()) {
				model.addAttribute("messImg","Không để trống ảnh");
			}
			if (acount != null) {
				model.addAttribute("haveUser","User Name đã tồn tại");
			}
			if (acount1!=null) {
				model.addAttribute("haveEmail","Email đã tồn tại");
			}
			
			
			message.sendMessage("error_system", model);
			model.addAttribute("role", Role.values());
			return "admin/account/edit";
		}
		if (!multipart.isEmpty()) {
			String fileName = file.upload(multipart);
			accountEntity.setPhoto(fileName);
			acc.save(accountEntity);
		}
		
		model.addAttribute("model", accountEntity);
		model.addAttribute("role", Role.values());
		return "redirect:/admin/account/list?message=insert_success";
	}

	@PutMapping()
	public String update(@Validated @ModelAttribute("model") AccountsEntity accountEntity,BindingResult result,
			Model model,
			@RequestParam("photoo") MultipartFile multipart) throws IOException {
		AccountsEntity account = acc.findOne(accountEntity.getId());
		
		if (result.hasErrors() || multipart.isEmpty()&& account.getPhoto() == null ) {
			
			model.addAttribute("messImg","Không để trống ảnh");
			message.sendMessage("error_system", model);
			model.addAttribute("role", Role.values());
			return "redirect:/admin/account/edit?id="+accountEntity.getId()+"&message=error_system";
		}
		if (!multipart.isEmpty()) {
			String fileName = file.upload(multipart);
			accountEntity.setPhoto(fileName);
		}
		Long id = acc.save(accountEntity);
		model.addAttribute("model", accountEntity);
		model.addAttribute("role", Role.values());
		return "redirect:/admin/account/edit?id=" + id.toString()+"&message=update_success";
	}
	
	@PostMapping("/delete")
	public String delete(@RequestBody Long[] ids, 
			Model model) {
		 acc.delete(ids);
		  return "redirect:/admin/account/list";
		
	}
}
