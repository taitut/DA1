package com.fpoly.dto;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Value;

@Data

@AllArgsConstructor
@Value
public class cateSaticDto {
	String catename;
	BigDecimal cateprice;
}
