package com.scau.chenyikui.aop;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.ui.Model;

import com.scau.chenyikui.model.User;
import com.scau.chenyikui.service.UserService;

@Aspect
public class ControllerAdvice {

//	 @Autowired
	 private UserService userService;

//	@Pointcut("execution(* *(..))")
//	public void test() {
//	}
	 
//	 @Before("test()")
//	 public void fuck(){
//		 System.out.println("fuck123213ksldfs;gjis;aildjfa;ijfio;");
//	 }
	 
	@Pointcut("execution(* com.scau.chenyikui.controller.*.*(..))")
	private void controller() {
	}

	// @Before("controller() && args(model)")
	@Before("controller()")
	public void addUserDetail(Model model) {
		System.out.println("fuck-------------------------------------------------------");
		 User user = userService.get(getPrincipal());
		 model.addAttribute("user", user);
	}

	public static String getPrincipal() {
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails) principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}
}
