package com.lucle.myp.service;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import java.util.LinkedList;
import com.lucle.myp.domain.MarketVo;

@Service
public class RecentlyViewedService {

    // 세션에서 최근 본 상품 목록을 관리하기 위한 키
    private static final String RECENTLY_VIEWED_KEY = "recentlyViewed";

    public void addRecentlyViewedProduct(HttpSession session, MarketVo product) {
        LinkedList<MarketVo> recentlyViewed = (LinkedList<MarketVo>) session.getAttribute(RECENTLY_VIEWED_KEY);
        
        if (recentlyViewed == null) {
            recentlyViewed = new LinkedList<>();
        } else {
            // 동일한 상품이 이미 목록에 있다면 제거 (최신 상품으로 다시 추가하기 위함)
            recentlyViewed.removeIf(p -> p.getNum().equals(product.getNum()));
        }

        // 상품을 목록의 앞부분에 추가
        recentlyViewed.addFirst(product);

        // 목록이 10개 이상이면 가장 오래된 상품 제거
        if (recentlyViewed.size() > 10) {
            recentlyViewed.removeLast();
        }

        // 세션에 최근 본 상품 목록 업데이트
        session.setAttribute(RECENTLY_VIEWED_KEY, recentlyViewed);
    }

    // 세션에서 최근 본 상품 목록을 가져오는 메소드
    public LinkedList<MarketVo> getRecentlyViewedProducts(HttpSession session) {
        LinkedList<MarketVo> recentlyViewed = (LinkedList<MarketVo>) session.getAttribute(RECENTLY_VIEWED_KEY);
        if (recentlyViewed == null) {
            return new LinkedList<>();
        }
        return recentlyViewed;
    }
}