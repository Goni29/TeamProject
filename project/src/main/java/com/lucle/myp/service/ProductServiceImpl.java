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
    public List<MarketVo> getCategoriesByLarge(int large) {
        return mapper.selectByLargeCategory(large);
    }

    @Override
    public List<MarketVo> getCategoriesByMedium(int large, int medium) {
        return mapper.selectByMediumCategory(large, medium);
    }

    @Override
    public List<MarketVo> getCategoriesBySmall(int large, int medium, int small) {
        return mapper.selectBySmallCategory(large, medium, small);
    }

    @Override
    public List<MarketVo> getCategoriesBySub(int large, int medium, int small, int sub_category) {
        return mapper.selectBySubCategory(large, medium, small, sub_category);
    }

}
