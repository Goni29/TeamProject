package com.lucle.myp.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lucle.myp.domain.UserVo;
import com.lucle.myp.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	@Autowired
	UserService service;
	
	// JSON 형태로 특정 사용자 정보 가져오기
	@ResponseBody
	@GetMapping(value = "/json/getOne/{id}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public UserVo jsonGetOne (@PathVariable String id) {
		UserVo vo = new UserVo();
		vo.setId(id);
	    return service.getOne(vo);
	}
	
	@GetMapping("/add")
	public void add() {}
	
	// 사용자 추가 처리
	@PostMapping("/add")
	public String addPost(UserVo vo, HttpSession session, Model model) {
		service.add(vo, session, model);
		return "/user/result";
	}
	
	@GetMapping("/login")
	public void login() {}
	
	// 로그인 처리
	@PostMapping("/login")
	public String login(String link, UserVo vo, HttpSession session, Model model) {
		int result = service.login(vo, session, model);
		if(result == 0) {
			return "/user/result";
		}
		return "redirect:"+link;
	}
	
	// 로그아웃 처리
	@GetMapping("/logout")
	public String logout(String link, HttpSession session) {
		session.invalidate();
		return "redirect:"+link;
	}
	
	// 사용자 정보 페이지로 이동
	@GetMapping("/info")
	public String info() {
		return "/user/passwordCheck";
	}
	
	// 사용자 정보 확인 처리
	@PostMapping(value="/info")
	public String infoPost(String password, HttpSession session) {

		String sessionPwd = ((UserVo)session.getAttribute("loginVo")).getPassword();
		
		if(! sessionPwd.equals(password)) {
			//비밀번호가 일치하지 않을 때
			return "redirect:/user/info";
		}
		return "/user/info";
	}
	
	// 사용자 삭제 처리
	@PostMapping("/delete")
	public String deletePost(String id, String password, HttpSession session) {
		int result = service.delete(id, password, session);
		
		if (result !=1) {
			System.out.println("삭제 실패 : 아이디나 비밀번호를 확인");
			return "/user/info";
		}
		
		return "redirect:/";
	}
	
	// 사용자 정보 수정 처리
	@PostMapping("/modify")
	public String modifyPost(UserVo vo, String modPwd, String modPwdTwo, HttpSession session) {
		
		if(vo.getPassword() == "" || vo.getPassword() == null) {
			//입력한 비밀번호가 공백일 때
			return "/user/info";
		}
		
		UserVo getVo = (UserVo) session.getAttribute("loginVo");
		
		getVo.setPassword(modPwd);
		
		if(modPwd == "" || modPwd == null) {
			//변경할 비밀번호가 공백일 경우 원래 비밀번호로 롤백.
			getVo.setPassword(vo.getPassword());
		}
		
		getVo.setAddress(vo.getAddress());
		getVo.setEmail(vo.getEmail());
		
		int result = service.modify(getVo);
		
		if (result !=1) {
			return "/user/info";
		}
		
		session.setAttribute("loginVo", getVo);
		
		return "redirect:/";
	}
	
	// 로그인 상태 확인
	@ResponseBody
	@GetMapping("/check-login-status")
	public Map<String, Boolean> checkLoginStatus(HttpSession session) {
	    Map<String, Boolean> response = new HashMap<>();
	    boolean isLoggedIn = session.getAttribute("loginVo") != null; // 'loginVo'는 로그인 세션 속성 이름입니다.
	    response.put("loggedIn", isLoggedIn);
	    return response;
	}
	
	@GetMapping("/custommerservice")
	public String custommerservice() {
		return "user/custommerservice";
	}

}
