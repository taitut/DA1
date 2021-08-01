package com.fpoly.utils;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import com.fpoly.constant.SysConstant;
@Component
public class MessageUtils {

		public Map<String, String> getMessage(String message){
			 Map<String, String> result = new HashMap<>();
			 if (message.equals("insert_success")) {
				 result.put("message", SysConstant.INSERT_SUCCESS);
				 result.put("alert", SysConstant.Alert_SUCCESS);
			 }else if (message.equals("update_success")) {
				 result.put("message", SysConstant.UPDATE_SUCCESS);
				 result.put("alert", SysConstant.Alert_SUCCESS);
			 }else if (message.equals("delete_success")) {
				 result.put("message", SysConstant.DELETE_SUCCESS);
				 result.put("alert", SysConstant.Alert_SUCCESS);
			 }
			 else if (message.equals("error_system")) {
				 result.put("message", "Error  System");
				 result.put("alert", SysConstant.Alert_DANGER);
			 }
			return result;
		}
		
		public Model sendMessage(String message, Model model) {
			
			Map<String, String> me = getMessage(message);
			
			model.addAttribute("message",me.get("message"));
			model.addAttribute("alert",me.get("alert"));
			return model;
		}
}
