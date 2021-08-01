package com.fpoly.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.entity.AccountsEntity;
import com.fpoly.services.IAccountService;
import com.fpoly.utils.MessageUtils;

@Controller

public class RegisterController {
	@Autowired
	private IAccountService acc;
	@Autowired
	private MessageUtils message;
	@GetMapping("/register")
	   public String loginPage( Model model) {
		  model.addAttribute("model", new AccountsEntity());
			return "register";
	      
	   }
	  @PostMapping("/register")
	   public String registerPage(@Validated @ModelAttribute("model") AccountsEntity accountEntity, BindingResult result,
			   Model model, @RequestParam(value= "repass") String repass) {
		  AccountsEntity account = acc.findBuyEmail(accountEntity.getEmail());
		  AccountsEntity a = acc.findBuyUsername(accountEntity.getUserName());
		  if (result.hasErrors() || !accountEntity.getPassword().equalsIgnoreCase(repass) ||
				  account!=null || a!=null ||repass==null) {
				model.addAttribute("messImg","Không để trống ảnh");
				if (account!=null) {
					model.addAttribute("email","Email đã tồn tại");
				}
				if (a!=null) {
					model.addAttribute("haveUser","User Name đã tồn tại");
				}
				if (!accountEntity.getPassword().equalsIgnoreCase(repass)) {
					model.addAttribute("repass","Không khớp password");
				}
				if (repass==null) {
					model.addAttribute("repass","Hãy nhập lại password");
				}
				
				message.sendMessage("error_system", model);
				return "register";
			}

		  	acc.save(accountEntity);		
		  	model.addAttribute("model", accountEntity);
			return "redirect:/login";
	      
	   }
	
}
