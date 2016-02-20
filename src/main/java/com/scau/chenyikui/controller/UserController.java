package com.scau.chenyikui.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.scau.chenyikui.model.User;
import com.scau.chenyikui.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/user")
	public String userInfo(String userId, Model model) {
		 User user = userService.get(userId);
		 model.addAttribute("user", user);
		return "user";
	}
}
