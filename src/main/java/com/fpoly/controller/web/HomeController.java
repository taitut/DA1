package com.fpoly.controller.web;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.entity.AccountsEntity;
import com.fpoly.entity.ProductEntity;
import com.fpoly.services.IAccountService;
import com.fpoly.services.ICartServies;
import com.fpoly.services.ICategoriesService;
import com.fpoly.services.IProductServices;

@Controller
public class HomeController {
	@Autowired
	private IAccountService acc;
	@Autowired
	private IProductServices productS;
	@Autowired
	private ICategoriesService cate;
	@Autowired
	private ICartServies cart;
	 @Autowired
	    public JavaMailSender emailSender;
	 
	
	  @GetMapping("/trang-chu")
	   public String homePage(Model model, @RequestParam("p") Optional<Integer> p) {
		  Pageable pageable = PageRequest.of(p.orElse(0), 8);
			Page<ProductEntity> page = productS.findAll(pageable);
			
			model.addAttribute("model", page);
		  model.addAttribute("category", cate.getAll());
		  model.addAttribute("dsc", productS.findTop4D());
		  model.addAttribute("asc", productS.findTop4A());
		  model.addAttribute("numberItem", cart.getAllItems().size());
	      return "web/home";
	   }
	  @GetMapping(value="/trang-chu/san-pham")
	   public String productPage(Model model, @RequestParam("p") Optional<Integer> p,
			   @RequestParam(required = false,name = "s") String Key, 
			   @RequestParam(required = false,name = "catename") String catename
			   ) { 
		  	Pageable pageable = PageRequest.of(p.orElse(0), 6);
			Page<ProductEntity> page = productS.findAll(pageable);
			if (catename !=null) {
				page = productS.searchByCategoryName(catename, pageable);
			}
			if (Key != null) {
				 page = productS.searchByName(Key, pageable);
				 model.addAttribute("key", Key);
			}
			model.addAttribute("category", cate.getAll());
			model.addAttribute("model", page);
			model.addAttribute("numberItem", cart.getAllItems().size());
	      return "web/product";
	   }
	  @GetMapping("/trang-chu/san-pham/{id}")
	   public String productDetailPage(@PathVariable Long id,Model model) { 
		  if (id == null) {
			  return "redirect:/trang-chu/san-pham/";
		}
		  model.addAttribute("category", cate.getAll());
		  model.addAttribute("numberItem", cart.getAllItems().size());
		  model.addAttribute("model", productS.findOne(id));
		  model.addAttribute("cate", cate.findOne(productS.findOne(id).getCategories().getId()));
	      return "web/productdetail";
	   }
	  
	  
	  @GetMapping("/login")
	   public String loginPage( ) {
			return "login";  
	   }
	  
	  @PostMapping("/sendCode")
	  public String sendCodeToEmail(@RequestParam("email") String email, Model model) {
		  AccountsEntity account = acc.findBuyEmail(email);
		  if (account == null) {
			model.addAttribute("visible", "visible");
			model.addAttribute("email", "Email không tồn tại");
			return "redirect:/login";
		}else {
			SimpleMailMessage message = new SimpleMailMessage();
			message.setTo(account.getEmail());
			message.setSubject("Forgot code from RedStore");
			 message.setText("Your code:"+account.getForgotCode());
			emailSender.send(message);
			return "forgot";
		}  	  
	  }
	  @PostMapping("/forgot")
	  public String checkCode(@Validated @ModelAttribute("model") AccountsEntity accountEntity,BindingResult result,
			  @RequestParam(value ="email") String email,
			  @RequestParam(value ="code") String code,
			  @RequestParam(value ="password") String pass,
			    Model model) {
		  AccountsEntity account = acc.findBuyEmail(email);
		  if (account == null) {
			model.addAttribute("email", "Sai địa chỉ email");
			return "forgot";
		}if (!account.getForgotCode().equalsIgnoreCase(code)) {
			model.addAttribute("code", "Code không đúng");
			return "forgot";
		}
		if (result.hasFieldErrors("password")) {
			model.addAttribute("pass", "Nhập tối thiểu 6 kÍ tự và có chứa ít nhất một kí tự là chữ cái và số");
			return "forgot";
		}
		account.setPassword(pass);
		acc.save(account);
		model.addAttribute("model", accountEntity);
			return "redirect:/forhptOk";
		  	  
	  }
	  
	  @GetMapping("/logout")
	   public String logout(HttpServletRequest request , HttpServletResponse response) {
		   Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			if (auth != null) {
				new SecurityContextLogoutHandler().logout(request, response, auth);
			}
			return "redirect:/trang-chu";}
	  
	  @GetMapping("/accessDenied")
	  public String accessDenied() {
			return "redirect:/login?accessDenied=true";}
	  
	  @GetMapping("/forhptOk")
	  public String fogotMess() {
		  
			return "redirect:/login?success=true";}
}
