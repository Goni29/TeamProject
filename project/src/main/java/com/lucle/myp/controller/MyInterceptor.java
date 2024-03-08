package com.lucle.myp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class MyInterceptor  implements HandlerInterceptor {

	@Override
	public boolean preHandle(
			HttpServletRequest request, HttpServletResponse response,
			Object obj) throws Exception {
		
		System.out.println("MyInterCeptor - preHandle");
		System.out.println("obj : " + obj.getClass());
		
		HttpSession session =	request.getSession();
		
		if(session != null) {
			
			String username = (String)session.getAttribute("userSession");
			
			if(username != null) {
				
				String role = (String)session.getAttribute("role");
				
				System.out.println("role : " + role);
				
				if(role.equals("admin")) {
					return true;
				}
				
			}else {
				System.out.println("username이 존재하지 않습니다.");
			}
			
		}else {
			System.out.println("세션이 존재하지 않습니다.");
			
		}
 
		//home으로 리턴 (특정페이지로 리턴 가능)
		response.sendRedirect(request.getContextPath() + "/");
		
		//false 가 리턴되면 요청 이후로 안넘어간다.
		return false;
	}
 
	// controller의 handler가 끝나면 처리됨
	@Override
	public void postHandle(
			HttpServletRequest request, HttpServletResponse response,
			Object obj, ModelAndView mav)
			throws Exception {
	}
 
	// view까지 처리가 끝난 후에 처리됨
	@Override
	public void afterCompletion(
			HttpServletRequest request, HttpServletResponse response,
			Object obj, Exception e)
			throws Exception {
	}
}
