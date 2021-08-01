package com.fpoly.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.entity.OrderDetailsEntity;
import com.fpoly.entity.OrderEntity;
import com.fpoly.services.IOrderServices;

@Controller
@RequestMapping("/admin/order")
public class OderController {
	
	@Autowired
	IOrderServices order;
	
	@GetMapping
	public String oder(Model model, @RequestParam("p") Optional<Integer> p) {
		Pageable pageable = PageRequest.of(p.orElse(0), 100);
		Page<OrderEntity> page = order.findAll(pageable);
		model.addAttribute("model", page);
		return "admin/order/order";
	}
	
	@GetMapping("/detail/{id}")
	public String orderDetail (Model model,@PathVariable("id")Long id) {
			List<OrderDetailsEntity> detail = order.findBuyOrderId(id);
			OrderEntity oder = order.findOneById(id);
		model.addAttribute("total",oder.getTotalPrice());			
		model.addAttribute("detail", detail);
		return "admin/order/detail";
	}
		
}
