package com.lucle.myp.service;

import java.util.List;

import com.lucle.myp.domain.MarketVo;

public interface ProductService {
	List<MarketVo> findProductsByCategory(String category);
	void insertProduct(MarketVo product);
    List<MarketVo> selectAllProducts();
    MarketVo selectProductById(int productId);
    void updateProduct(MarketVo product);
    void deleteProductById(int productId);
}
