package com.fpoly.controller.admin;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.services.IOrderServices;

@Controller
@RequestMapping("/admin/Statistical")
public class StatisticalController {
	@Autowired
	private IOrderServices or;
	@GetMapping
	public String topProduc(
			@RequestParam(value ="year", defaultValue = "2021") int year,
			Model model) {
		
		List<Object[]> list3 = or.findpriceYear(year);
		ArrayList<String> month = new ArrayList<>();
		ArrayList<BigDecimal> totalprice = new ArrayList<>();
		ArrayList<BigDecimal> piePrice = new ArrayList<>();
		ArrayList<String> name = new ArrayList<>();
	  List<Object[]> list = or.findAllBuyYear(year);
	  List<Object[]> list2 = or.findBuyCategory(year);
	 
	  for (Object[] orderEntity : list) {	  
		  month.add("'"+"Tháng "+orderEntity[0]+"'");
		  totalprice.add((BigDecimal)orderEntity[1]);
	}
	 for (Object[] objects : list2) {
		name.add("'"+(String) objects[0]+"'");
		piePrice.add( (BigDecimal)objects[1]);
	}
	 for (Object[] objects : list3) {
		 model.addAttribute("doanhthu", objects[0]);
		 model.addAttribute("khach", objects[1]);
		 model.addAttribute("sanpham", objects[2]);
	}
	  model.addAttribute("pieName", name);
	  model.addAttribute("pievalue", piePrice);
	  model.addAttribute("month", month);
	  model.addAttribute("price", totalprice);
	  model.addAttribute("year", year);
		return "admin/statis/statis";
	}
}
