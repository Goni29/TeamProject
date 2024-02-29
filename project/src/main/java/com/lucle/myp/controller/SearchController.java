package com.lucle.myp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lucle.myp.domain.Criteria;
import com.lucle.myp.domain.SearchStatVo;
import com.lucle.myp.domain.SearchVo;
import com.lucle.myp.domain.UserVo;
import com.lucle.myp.service.SearchService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/search/*")
@Log4j
public class SearchController {

	@Autowired
	private SearchService service;

	// 사용자의 검색 기록을 DB에 저장
	@PostMapping(value = "/insert", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> insert(@RequestBody SearchVo vo, HttpServletRequest req) {
		ResponseEntity<String> res = null;
		log.info(vo);

		int result = service.insert(vo, req);

		if (result == 1) {
			res = new ResponseEntity<String>("GOOD", HttpStatus.OK);
		} else {
			res = new ResponseEntity<String>("FAIL", HttpStatus.OK);
		}
		return res;
	}

	// 사용자 개인 페이지에서 검색 기록 확인
	@GetMapping("/userPage")
	public void userPage(String id, HttpServletRequest req, Model model) {
	    HttpSession session = req.getSession();
	    Criteria cri = new Criteria();

	    UserVo loginVo = (UserVo) session.getAttribute("loginVo");
	    String remoteAddr = req.getRemoteAddr();

	    if (loginVo == null) {
	        System.out.println(remoteAddr);
	        List<SearchVo> list = service.getHistoryOneIp(remoteAddr, 1, cri);
	        model.addAttribute("sList", list);
	        return;
	    }

	    if (!loginVo.getId().equals(id)) {
	        System.out.println("정상적인 경로가 아님");
	        return;
	    }
	    
	    List<SearchVo> list = service.getHistoryOne(id, 1, cri);
	    System.out.println(list);
	    model.addAttribute("sList", list);
	}
	
	// 관리자 페이지에서 전체 검색 기록 확인
	@GetMapping("/adminPage")
	public void adminPage(HttpServletRequest req, Model model, Criteria cri) {
		
		if(cri.getSort() == "bno") {
			cri.setSort("searchCount");
		}
		
	    HttpSession session = req.getSession();

	    UserVo loginVo = (UserVo) session.getAttribute("loginVo");

	    if (loginVo.getGrade() < 3) {
	        System.out.println("admin 계정이 아님");
	        return;
	    }

	    List<SearchStatVo> list = service.getStatList(cri);
	    System.out.println(list);
	    model.addAttribute("sList", list);
	}

	// 특정 기간 동안의 검색 횟수 리스트 가져오기
	@ResponseBody
	@GetMapping(value = "/getCountList/{sortTime}", produces = { MediaType.APPLICATION_JSON_VALUE })
	public List<SearchVo> getCountList(@PathVariable int sortTime) {
		Criteria cri = new Criteria();
		cri.setSortTime(sortTime);
		return service.getCountList(cri); // 페이징 처리가 안 됨.
	}
	
	@ResponseBody
	@GetMapping(value = "/getStatList/{sortTime}/{sort}", produces = { MediaType.APPLICATION_JSON_VALUE })
	public List<SearchStatVo> getStatList(@PathVariable int sortTime, @PathVariable String sort) {
		Criteria cri = new Criteria();
		cri.setSortTime(sortTime);
		cri.setSort(sort);
		
		return service.getStatList(cri); // 페이징 처리가 안 됨.
	}
}
