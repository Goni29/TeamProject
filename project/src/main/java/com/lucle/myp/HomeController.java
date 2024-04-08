package com.lucle.myp;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.lucle.myp.domain.Criteria;
import com.lucle.myp.domain.MarketGroupBuyingVo;
import com.lucle.myp.domain.MarketVo;
import com.lucle.myp.domain.ReplyVo;
import com.lucle.myp.domain.SearchVo;
import com.lucle.myp.domain.UserVo;
import com.lucle.myp.service.MarketService;
import com.lucle.myp.service.ProductService;
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
	@Autowired
	ProductService productService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Model model, Criteria cri, @RequestParam(value = "page", defaultValue = "1") int page) throws Exception {
	    List<MarketVo> list = service.rankedView();
	    model.addAttribute("products", list);
	    
	    HttpSession session = request.getSession();
	    UserVo member = (UserVo) session.getAttribute("loginVo");
	    
	    // 로그인 상태를 체크합니다.
	    if (member != null) {
	        // 로그인한 사용자

	        String id = member.getId();
	        List<MarketVo> rankView = productService.rankedViewByUser(id, cri);
	        model.addAttribute("rankView", rankView);
	        System.out.println("Rank View for User ID: " + id);
	        for (MarketVo item : rankView) {
	            System.out.println(item.toString()); // MarketVo에 적절한 toString() 메소드가 정의되어 있어야 합니다.
	        }
	        List<MarketVo> recentlyViewed = recentlyViewedService.getRecentlyViewedProducts(session);
	        model.addAttribute("recentlyViewedProducts", recentlyViewed);
	        
	        // 로그인한 사용자를 위한 뷰 페이지 반환
	        return "logedhome";
	    } else {
	        // 로그인하지 않은 사용자

	        List<MarketVo> products = service.groupBuying(cri);
	        List category = productService.cateList();
	        ObjectMapper objm = new ObjectMapper();
	        String cateList = objm.writeValueAsString(category);
	        model.addAttribute("cateList", cateList);
	        
	        model.addAttribute("products2", products);

	        List<MarketVo> recentlyViewed = recentlyViewedService.getRecentlyViewedProducts(session);
	        model.addAttribute("recentlyViewedProducts", recentlyViewed);
	        
	        // 로그인하지 않은 사용자를 위한 뷰 페이지 반환
	        return "home";
	    }
	}

	@GetMapping("/pr")
	public String pr(Model model, Criteria cri, HttpSession session, @Param("num") Long num,
			@Param("large") Integer large, @Param("medium") Integer medium, @Param("small") Integer small,
			@Param("sub_category") Integer sub_category, @Param("id") String id) {
		List<MarketGroupBuyingVo> list = service.sortProto(num, large, medium, small, sub_category);
		 List<ReplyVo> replies = replyService.getListByProductNum(num);
		    model.addAttribute("replies", replies);
		model.addAttribute("products", list);
		
		// 최근 본 상품 기능 통합
        if (num != null) {
            MarketVo product = service.getProductById(num); // 상품 정보 조회
            if (product != null) {
                recentlyViewedService.addRecentlyViewedProduct(session, product); // 세션에 최근 본 상품 추가
                recentlyViewedService.addViewRecord(num, session, large, medium, small, sub_category);
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
	
	/*
	 * @ControllerAdvice public class GlobalExceptionHandler {
	 * 
	 * // NullPointerException 처리
	 * 
	 * @ExceptionHandler(NullPointerException.class) public String
	 * handleNullPointerException(NullPointerException e, HttpServletRequest
	 * request) { // 로그인 페이지나 메시지를 보여줄 커스텀 페이지로 리다이렉트 return "redirect:/"; } }
	 */

}