package com.lucle.myp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
