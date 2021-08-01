package com.fpoly.controller.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.entity.AccountsEntity;
import com.fpoly.entity.OrderDetailsEntity;
import com.fpoly.entity.OrderEntity;
import com.fpoly.services.IAccountService;
import com.fpoly.services.ICategoriesService;
import com.fpoly.services.IOrderServices;

@Controller
public class invoiceController {
	@Autowired
	private IAccountService acc;
	@Autowired
	private IOrderServices order;
	@Autowired
	private ICategoriesService cate;
	
	@GetMapping("/trang-chu/history")
	public String getInvoice(Authentication authentication,Model model){
		List<OrderEntity> o = order.findBuyAllUsername(authentication.getName());
		String img=	o.get(0).getOderdetails().get(0).getProduct().getImage();
		
		model.addAttribute("img", img);
		model.addAttribute("order", o);
		 model.addAttribute("category", cate.getAll());
		return "web/orderHistory";
	}
	@GetMapping("/trang-chu/invoice")
	public String getDetail(Authentication authentication,Model model,
			@RequestParam (value="id", required = false) Long id){
		AccountsEntity ac = acc.findBuyUsername(authentication.getName());
		
		OrderEntity o = order.findOneByAccountId(ac.getId());
		List<OrderDetailsEntity> orderDetail = order.findBuyOrderId(o.getId());
		model.addAttribute("acc", ac);
		model.addAttribute("order", o);
		model.addAttribute("orderDetail", orderDetail);
		 model.addAttribute("category", cate.getAll());
		return "web/orderDetails";
	}
}
