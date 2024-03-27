package com.lucle.myp.service;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.lucle.myp.domain.UserVo;
import com.lucle.myp.mapper.UserMapper;


@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper mapper;

	String[] gradeName = "일반 회원/우수 회원/으뜸ㅋㅋㅋ 회원/관리자".split("/");

	@Override
	public int add(UserVo vo, HttpSession session, Model model) {
		int result = mapper.insert(vo);
		if (result != 1) {
			model.addAttribute("message", "회원가입 중 오류가 발생 했습니다.<br/> 잠시후 다시 시도해주세요.");
			return 0;
		}

		UserVo getVo = mapper.getOne((vo.getId()));
		session.setAttribute("loginVo", getVo);
		session.setAttribute("gradeName", gradeName[getVo.getGrade()]);
		System.out.println(session.getAttribute("loginVo") + "service===================");
		model.addAttribute("message", "회원가입에 성공했습니다. <br/>" + vo.getName() + "님 환영합니다.");
		return result;
	}

	@Override
	public UserVo getOne(UserVo vo) {
		return mapper.getOne(vo.getId());

	}

	@Override
	public void lastConUpdate(String id) {
		mapper.lastConDateUpdate(id);
	}
	
	
	@Override
	public int login(UserVo vo, HttpSession session, Model model) {
		UserVo getVo = this.getOne(vo);
		if (getVo == null || !vo.getPassword().equals(getVo.getPassword())) {
			model.addAttribute("message", vo.getId() + "아이디가 없거나, 비밀번호가 일치하지 않습니다.");
			return 0;
		}
		mapper.lastConDateUpdate(vo.getId());

		session.setAttribute("loginVo", getOne(vo));
		session.setAttribute("gradeName", gradeName[getVo.getGrade()]);
		return 1;
	}

	@Override
	public int delete(String id, String password, HttpSession session) {
		int result;
		String sessionPwd = ((UserVo) session.getAttribute("loginVo")).getPassword();
		
		if (!sessionPwd.equals(password)) return 0;
		
		UserVo getVo = mapper.getOne(id);
		// 가져온 데이터를 삭제 관리 테이블
		result = mapper.backUp(getVo);
		if (result == 1) {

		} else {
		result = mapper.delete(getVo);
		session.invalidate();
		
		}
		return result;
	}

	@Override
	public int modify(UserVo vo) {
		return mapper.update(vo);
	}
}
