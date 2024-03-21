package com.lucle.myp.mapper;

import java.util.List;

import com.lucle.myp.domain.MarketVo;

public interface ProductMapper {
	void insertProduct(MarketVo product);
    List<MarketVo> selectAllProducts();
    MarketVo selectProductById(int productId);
    void updateProduct(MarketVo product);
    void deleteProductById(int productId);
}
