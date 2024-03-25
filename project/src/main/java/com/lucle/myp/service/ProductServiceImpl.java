package com.lucle.myp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lucle.myp.domain.MarketVo;
import com.lucle.myp.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductMapper mapper;
	
	@Override
	public List<MarketVo> findProductsByCategory(String category) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertProduct(MarketVo product) {
		mapper.insertProduct(product);

	}

	@Override
	public List<MarketVo> selectAllProducts() {
		return mapper.selectAllProducts();
	}

	@Override
	public MarketVo selectProductById(int productId) {
		return mapper.selectProductById(productId);
	}

	@Override
	public void updateProduct(MarketVo product) {
		mapper.updateProduct(product);
	}

	@Override
	public void deleteProductById(int productId) {
		mapper.deleteProductById(productId);
	}
	
	@Override
    public List<MarketVo> getRecommendedProductDetails() {
        return mapper.getProductDetails();
    }
	
	@Override
    public List<MarketVo> getProductsByLargeCategory(int large) {
        return mapper.selectProductsByLargeCategory(large);
    }

    @Override
    public List<MarketVo> getProductsByMediumCategory(int medium) {
        return mapper.selectProductsByMediumCategory(medium);
    }

    @Override
    public List<MarketVo> getProductsBySmallCategory(int small) {
        return mapper.selectProductsBySmallCategory(small);
    }

    @Override
    public List<MarketVo> getProductsBySubCategory(int sub_category) {
        return mapper.selectProductsBySubCategory(sub_category);
    }
    
    /* 카테고리 리스트 */
	@Override
	public List<MarketVo> cateList() {
		return mapper.cateList();
	}

	@Override
    public List<MarketVo> getProductsByCategory(String cateCode) {
        return mapper.findProductsByCategory(cateCode);
    }
}
