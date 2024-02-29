package com.lucle.myp.controller;

import java.util.List;

//github.com/Goni29/TeamProject.git
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lucle.myp.domain.Criteria;
import com.lucle.myp.domain.MarketVo;
import com.lucle.myp.domain.UserVo;
import com.lucle.myp.service.MarketService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/market/*")
@Log4j
public class MarketController {
	
	@Autowired
	MarketService service;
	
	// 상품 검색 페이지
	@GetMapping("/search")
	public void search(Model model, Criteria cri) {
		List<MarketVo> list = service.getList(cri);
		model.addAttribute("products", list);
		model.addAttribute("searchWord", cri.getKeyword());
	}
	
	@GetMapping("/pr")
	public void pr(Model model, Criteria cri) {
		List<MarketVo> list = service.sortProto(cri);
		model.addAttribute("products", list);
	}
	
	// 상품 상세 페이지
	@GetMapping("/detail")
	public void detail(String id, Long num, Model model) {
		service.marketViewPlus(id, num);
	}
	
	@GetMapping("/proto")
	public void proto(Model model, Criteria cri) {
		List<MarketVo> list = service.proto(cri);
		List<MarketVo> list2 = service.groupBuying(cri);
		model.addAttribute("products", list);
		model.addAttribute("products2", list2);
	}

	// 사용자 페이지
	@GetMapping("/userPage")
	public void userPage(String id, HttpSession session, Model model) {
		UserVo loginVo = (UserVo) session.getAttribute("loginVo");
		
	    if (loginVo == null) {
	    	log.warn("Market-userPage, 로그인되어 있지 않음");
	        return;
	    }

	    if (!loginVo.getId().equals(id)) {
	        log.warn("Market-userPage, 로그인된 아이디의 정보만 열람 가능");
	        return;
	    }
	    
//	    if (loginVo.getGrade() < 3) {
//	        log.warn("Market-userPage, admin 계정이 아님");
//	        return;
//	    }
	    
	    Criteria cri = new Criteria(); // 페이징을 위한 기준. 당장은 쿼리문에서 사용하지 않음.
	    List<MarketVo> list = service.getHistoryOne(id, cri);
	    log.info(list);
	    model.addAttribute("mList", list);  
	}
}
