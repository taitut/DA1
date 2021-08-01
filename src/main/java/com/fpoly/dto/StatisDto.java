package com.fpoly.dto;

import java.math.BigDecimal;

import lombok.Data;
@Data
public class StatisDto {
	
	
	private BigDecimal price;
	
	private int quantity;

	private long  orderid;
	
	private Long  productid;
	private BigDecimal doanhthu;
}
