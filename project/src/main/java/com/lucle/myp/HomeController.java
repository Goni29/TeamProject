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
import org.springframework.web.bind.annotation.RequestParam;

import com.lucle.myp.domain.Criteria;
import com.lucle.myp.domain.MarketVo;
import com.lucle.myp.domain.ReplyVo;
import com.lucle.myp.domain.SearchVo;
import com.lucle.myp.domain.UserVo;
import com.lucle.myp.service.MarketService;
import com.lucle.myp.service.RecentlyViewedService;
import com.lucle.myp.service.ReplyService;
import com.lucle.myp.service.SearchService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	MarketService service;
	@Autowired
	private SearchService searchService;
	@Autowired
	private ReplyService replyService;
	@Autowired
	private RecentlyViewedService recentlyViewedService; // 최근 본 상품 서비스 추가


	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String proto(HttpServletRequest request, Model model, Criteria cri) {
		List<MarketVo> list = service.proto(cri);
		List<MarketVo> list2 = service.groupBuying(cri);
		model.addAttribute("products", list);
		model.addAttribute("products2", list2);
		
		HttpSession session = request.getSession();
	    List<MarketVo> recentlyViewed = recentlyViewedService.getRecentlyViewedProducts(session);
	    model.addAttribute("recentlyViewedProducts", recentlyViewed);
		return "home";
	}

	@GetMapping("/pr")
	public String pr(Model model, Criteria cri, HttpSession session, @Param("num") Long num,
			@Param("large") Integer large, @Param("medium") Integer medium, @Param("small") Integer small,
			@Param("sub_category") Integer sub_category) {
		List<MarketVo> list = service.sortProto(num, large, medium, small, sub_category);
		 List<ReplyVo> replies = replyService.getListByProductNum(num);
		    model.addAttribute("replies", replies);
		model.addAttribute("products", list);
		
		// 최근 본 상품 기능 통합
        if (num != null) {
            MarketVo product = service.getProductById(num); // 상품 정보 조회
            if (product != null) {
                recentlyViewedService.addRecentlyViewedProduct(session, product); // 세션에 최근 본 상품 추가
            }
        }
		return "/pr";
	}

	// 상품 검색 페이지
	@GetMapping("/search")
	public void search(Model model, Criteria cri, @Param("productName") String productName, MarketVo vo,
			SearchVo searchVo, HttpServletRequest req) {
		HttpSession session = req.getSession();
		UserVo loginUser = (UserVo) session.getAttribute("loginVo");
		String userId = null;

		if (loginUser != null) {
			// loginUser 객체에서 ID를 가져옵니다.
			userId = loginUser.getId();
			// 필요한 경우, 여기에서 userId를 사용할 수 있습니다.
		}
		List<MarketVo> list = service.getList(productName);
		model.addAttribute("products", list);
		model.addAttribute("searchWord", vo.getProductName());
		searchVo.setSearchWord(productName);
		searchVo.setId(userId);
		searchService.insert(searchVo, req);
	}

}