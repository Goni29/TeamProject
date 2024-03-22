package com.lucle.myp.mapper;

import java.util.List;

import com.lucle.myp.domain.MarketVo;

public interface ProductMapper {
	void insertProduct(MarketVo product);
    List<MarketVo> selectAllProducts();
    MarketVo selectProductById(int productId);
    void updateProduct(MarketVo product);
    void deleteProductById(int productId);
    List<MarketVo> getProductDetails();
    List<MarketVo> selectByLargeCategory(int large);
    List<MarketVo> selectByMediumCategory(int large, int medium);
    List<MarketVo> selectBySmallCategory(int large, int medium, int small);
    List<MarketVo> selectBySubCategory(int large, int medium, int small, int sub_category);
}
