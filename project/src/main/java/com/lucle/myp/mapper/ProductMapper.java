package com.lucle.myp.mapper;

import java.util.List;
import java.util.Map;

import com.lucle.myp.domain.CategoryFilterVo;
import com.lucle.myp.domain.Criteria;
import com.lucle.myp.domain.MarketVo;
import com.lucle.myp.domain.SearchStatVo;

public interface ProductMapper {
	void insertProduct(MarketVo product);
    List<MarketVo> selectAllProducts();
    MarketVo selectProductById(int productId);
    void updateProduct(MarketVo product);
    void deleteProductById(int productId);
    List<MarketVo> getProductDetails(Map<String, Object> params);
    List<MarketVo> selectProductsByLargeCategory(int large);
    List<MarketVo> selectProductsByMediumCategory(int medium);
    List<MarketVo> selectProductsBySmallCategory(int small);
    List<MarketVo> selectProductsBySubCategory(int sub_category);
    public List<MarketVo> cateList();
    
    public String[] getCateList(Criteria cri);
    
    public CategoryFilterVo getCateInfo(Criteria cri);
    
    List<MarketVo> findProductsByCategory(String cateCode);
    
    public List<MarketVo> rankedViewByUser(Map<String, Object> params);
    
    int getTotalCount(Map<String, Object> params);
    
    int getTotalCount2(Map<String, Object> params);
    
    List<SearchStatVo> getStatList(Criteria cri);
    
    void updateCategory(MarketVo product);
    
}
