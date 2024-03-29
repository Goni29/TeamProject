package com.lucle.myp.mapper;

import java.util.List;

import com.lucle.myp.domain.CategoryFilterVo;
import com.lucle.myp.domain.Criteria;
import com.lucle.myp.domain.MarketVo;

public interface ProductMapper {
	void insertProduct(MarketVo product);
    List<MarketVo> selectAllProducts();
    MarketVo selectProductById(int productId);
    void updateProduct(MarketVo product);
    void deleteProductById(int productId);
    List<MarketVo> getProductDetails();
    List<MarketVo> selectProductsByLargeCategory(int large);
    List<MarketVo> selectProductsByMediumCategory(int medium);
    List<MarketVo> selectProductsBySmallCategory(int small);
    List<MarketVo> selectProductsBySubCategory(int sub_category);
    public List<MarketVo> cateList();
    
    public String[] getCateList(Criteria cri);
    
    public CategoryFilterVo getCateInfo(Criteria cri);
    
    List<MarketVo> findProductsByCategory(String cateCode);
    
    public List<MarketVo> rankedViewByUser(String id);
}
