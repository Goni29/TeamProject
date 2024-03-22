package com.lucle.myp.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.lucle.myp.domain.MarketVo;

@Service
public interface ProductService {
	List<MarketVo> findProductsByCategory(String category);
	void insertProduct(MarketVo product);
    List<MarketVo> selectAllProducts();
    MarketVo selectProductById(int productId);
    void updateProduct(MarketVo product);
    void deleteProductById(int productId);
    List<MarketVo> getRecommendedProductDetails();
    List<MarketVo> getCategoriesByLarge(int large);
    List<MarketVo> getCategoriesByMedium(int large, int medium);
    List<MarketVo> getCategoriesBySmall(int large, int medium, int small);
    List<MarketVo> getCategoriesBySub(int large, int medium, int small, int sub_category);
}
