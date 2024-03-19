package com.lucle.myp.service;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class CategoryStatisticsServiceImpl implements CategoryStatisticsService {

    // 세션에서 카테고리별 조회 수를 관리하기 위한 키
    private static final String CATEGORY_VIEW_COUNT_KEY = "categoryViewCount";

    public void incrementCategoryViewCount(int large, int medium, int small, int subCategory, HttpSession session) {
        // 세션에서 카테고리별 조회 수를 가져옴
        Map<String, Integer> categoryViewCount = (Map<String, Integer>) session.getAttribute(CATEGORY_VIEW_COUNT_KEY);
        if (categoryViewCount == null) {
            categoryViewCount = new HashMap<>();
        }

        // 카테고리별 조회 수 증가
        String categoryKey = getCategoryKey(large, medium, small, subCategory);
        categoryViewCount.put(categoryKey, categoryViewCount.getOrDefault(categoryKey, 0) + 1);
        
        // 업데이트된 조회 수 정보를 세션에 저장
        session.setAttribute(CATEGORY_VIEW_COUNT_KEY, categoryViewCount);
    }

    public String getMostViewedCategory(HttpSession session) {
        Map<String, Integer> categoryViewCount = (Map<String, Integer>) session.getAttribute(CATEGORY_VIEW_COUNT_KEY);
        if (categoryViewCount == null || categoryViewCount.isEmpty()) {
            return null;
        }

        // 가장 많이 조회된 카테고리 식별
        return categoryViewCount.entrySet().stream()
                .max(Map.Entry.comparingByValue())
                .get()
                .getKey();
    }

    private String getCategoryKey(int large, int medium, int small, int subCategory) {
        // 카테고리별 키 생성 로직
        return "LARGE:" + large + "|MEDIUM:" + medium + "|SMALL:" + small + "|SUB_CATEGORY:" + subCategory;
    }
}
