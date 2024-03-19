//package com.lucle.myp.controller;
//
//import java.util.List;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.lucle.myp.domain.MarketVo;
//import com.lucle.myp.service.CategoryStatisticsService;
//import com.lucle.myp.service.ProductService;
//
//@Controller
//public class ProductRecommendationController {
//
//    @Autowired
//    private CategoryStatisticsService categoryStatisticsService;
//
//    @Autowired
//    private ProductService productService;
//
//    @RequestMapping(value = "/recommend-products", method = RequestMethod.GET)
//    public ModelAndView recommendProducts(HttpSession session) {
//        ModelAndView modelAndView = new ModelAndView("recommendations");
//
//        String mostViewedCategory = categoryStatisticsService.getMostViewedCategory(session);
//        if (mostViewedCategory != null) {
//            List<MarketVo> recommendedProducts = productService.findProductsByCategory(mostViewedCategory);
//            modelAndView.addObject("products", recommendedProducts);
//        } else {
//            modelAndView.addObject("message", "No recommendations available.");
//        }
//
//        return modelAndView;
//    }
//}