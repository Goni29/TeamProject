package com.lucle.myp.service;

import java.util.List;

import com.lucle.myp.domain.MarketVo;

public interface ProductService {
	List<MarketVo> findProductsByCategory(String category);
}
