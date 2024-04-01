package com.lucle.myp.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.lucle.myp.domain.Criteria;
import com.lucle.myp.domain.MarketVo;

@Service
public interface ProductService {
	List<MarketVo> findProductsByCategory(String category);
	void insertProduct(MarketVo product);
    List<MarketVo> selectAllProducts();
    MarketVo selectProductById(int productId);
    void updateProduct(MarketVo product);
    void deleteProductById(int productId);
    List<MarketVo> getRecommendedProductDetails(Criteria criteria);
    List<MarketVo> getProductsByLargeCategory(int large);
    List<MarketVo> getProductsByMediumCategory(int medium);
    List<MarketVo> getProductsBySmallCategory(int small);
    List<MarketVo> getProductsBySubCategory(int sub_category);
    public List<MarketVo> cateList();
    List<MarketVo> getProductsByCategory(String cateCode);
    public List<MarketVo> rankedViewByUser(String id, Criteria criteria);
    int getTotalCount(String id);
    int getTotalCount2();
}
