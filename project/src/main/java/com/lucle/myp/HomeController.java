package com.lucle.myp;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lucle.myp.domain.Criteria;
import com.lucle.myp.domain.MarketVo;
import com.lucle.myp.service.MarketService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	MarketService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String proto(HttpServletRequest request, Model model, Criteria cri) {
		List<MarketVo> list = service.proto(cri);
		List<MarketVo> list2 = service.groupBuying(cri);
		model.addAttribute("products", list);
		model.addAttribute("products2", list2);
		return "home";
	}
	
	@GetMapping("/pr")
	public void pr(Model model, Criteria cri, HttpSession session, @Param("num") Long num) {
		List<MarketVo> list = service.sortProto(num);
		model.addAttribute("products", list);
	}
	
}