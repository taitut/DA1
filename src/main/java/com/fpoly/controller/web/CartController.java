package com.fpoly.controller.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.dto.CartItem;
import com.fpoly.entity.AccountsEntity;
import com.fpoly.entity.OrderEntity;
import com.fpoly.entity.ProductEntity;
import com.fpoly.services.IAccountService;
import com.fpoly.services.ICartServies;
import com.fpoly.services.IOrderServices;
import com.fpoly.services.IProductServices;
import com.fpoly.utils.sessionUtils;

@Controller
@RequestMapping("/trang-chu/san-pham")
public class CartController {
	@Autowired
	private sessionUtils session;
	@Autowired
	IProductServices pro;
	@Autowired
	private ICartServies cart;
	@Autowired
	private IOrderServices orderServices;
	@Autowired
	private IAccountService acc;
	 @GetMapping("/gio-hang")
	   public String cartPage(Model model,Authentication authentication) { 
		 if (authentication !=null) {
			 AccountsEntity ac = acc.findBuyUsername(authentication.getName());
			model.addAttribute("ac", ac);
		}
		 
		 model.addAttribute("cartitem", cart.getAllItems());
		 model.addAttribute("totalp", cart.getAmount());
		 model.addAttribute("numberItem", cart.getAllItems().size());
	      return "web/cart";
	   }
	 @GetMapping("/add/{id}")
	 public String addCart(@PathVariable("id")Long id ,@RequestParam(defaultValue ="1", value = "sl") int quantity) {
		  ProductEntity  product = pro.findOne(id);
		  if (product != null) {
			CartItem item = new CartItem();
			item.setProduct(product);
			item.setQuantity(quantity);
			item.setOrder(new OrderEntity());
			
			
			cart.add(item);
		}
		 return "redirect:/trang-chu/san-pham";
	 }
	 @GetMapping("/clear")
	 public String clearCart() {
			cart.clear();	
		 return "redirect:/trang-chu/san-pham/gio-hang";
	 }
	 
	 @GetMapping("/delete/{id}")
	 public String removeCart(@PathVariable("id")Long id) {
			cart.remove(id);
		 return "redirect:/trang-chu/san-pham/gio-hang";
	 }
	 @PostMapping("/update")
	 public String updateCart(@RequestParam("id")Long id, @RequestParam("qty")int qty) {
			cart.update(id, qty);
		 return "redirect:/trang-chu/san-pham/gio-hang";
	 }
	 
	 @PostMapping("/checkout")
	 public String checkout(@RequestParam("add")String address,
			 @RequestParam("name")String name,
			 @RequestParam("phone")String phone,
			 @RequestParam("note")String note,
			 Authentication authentication) {
		 OrderEntity order = new OrderEntity();
		 order.setAddress(address);
		 order.setName(name);
		 order.setPhone(phone);
		 order.setNote(note);
		 order.setTotalPrice(cart.getAmount());
		 if (authentication !=null) {
			AccountsEntity ac = acc.findBuyUsername(authentication.getName());
			order.setAccount(ac);
		}
		 long id =orderServices.save(order);
		 Map<Long, CartItem> maps = session.getAttribute("cart");
			 orderServices.save(maps);
		 cart.clear();
		 return "redirect:/trang-chu/invoice?id="+id+"";
	 }
}
