package com.lucle.myp.controller;

import java.util.ArrayList;
import java.util.List;

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
	public void pr(Model model, Criteria cri, HttpSession session) {
		List<MarketVo> list = service.sortProto(cri);
		model.addAttribute("products", list);
		
		List<MarketVo> list2 = service.groupBuying(cri);
//		List<MarketVo> recentViewedProducts = (List<MarketVo>) session.getAttribute("recentViewedProducts");
//	    if (recentViewedProducts == null) {
//	        recentViewedProducts = new ArrayList<>();
//	    }
//
//	    // 리스트의 각 상품을 최근 조회한 상품 목록에 추가
//	    for (MarketVo pr : list2) {
//	        if (!recentViewedProducts.contains(pr)) {
//	            recentViewedProducts.add(0, pr);
//	            if (recentViewedProducts.size() > 10) {
//	                recentViewedProducts.remove(recentViewedProducts.size() - 1); // 최대 크기 유지
//	            }
//	        }
//	    }
//
//	    // 세션에 최신 목록 저장
//	    session.setAttribute("recentViewedProducts", recentViewedProducts);
//	    System.out.println("=============" + recentViewedProducts + "============");
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
