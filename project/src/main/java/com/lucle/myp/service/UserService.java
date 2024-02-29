package com.lucle.myp.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.lucle.myp.domain.UserVo;

public interface UserService {
	
	int add(UserVo vo, HttpSession req, Model model);

	UserVo getOne(UserVo vo);

	void lastConUpdate(String id);

	int login(UserVo vo, HttpSession session, Model model);

	int delete(String id, String password, HttpSession session);

	int modify(UserVo vo);
	
}
