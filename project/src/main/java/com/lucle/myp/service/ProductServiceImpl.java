package com.lucle.myp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lucle.myp.domain.Criteria;
import com.lucle.myp.domain.MarketVo;
import com.lucle.myp.domain.SearchStatVo;
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
		List<MarketVo> list = mapper.selectAllProducts(); // 데이터베이스에서 목록을 가져옴

	    for (MarketVo market : list) {
	        if (market.getGoaltarget() == 0) { // 0으로 나누는 것을 방지
	            market.setAchievementrate(0);
	        } else {
	            long achievementRate = (market.getPersonnum() * 100) / market.getGoaltarget();
	            market.setAchievementrate((int) achievementRate);
	        }
	    }

	    return list;
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
    public List<MarketVo> getRecommendedProductDetails(Criteria criteria) {
		int pageSize = criteria.getAmount();
	    int offset = (criteria.getPageNum() - 1) * pageSize;
		Map<String, Object> params = new HashMap<>();
		params.put("pageSize", pageSize);
		params.put("offset", offset);
        List<MarketVo> list = mapper.getProductDetails(params); // 데이터베이스에서 목록을 가져옴
	    for (MarketVo market : list) {
	        if (market.getGoaltarget() == 0) { // 0으로 나누는 것을 방지
	            market.setAchievementrate(0);
	        } else {
	            long achievementRate = (market.getPersonnum() * 100) / market.getGoaltarget();
	            market.setAchievementrate((int) achievementRate);
	        }
	    }

	    return list;
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
        List<MarketVo> list = mapper.findProductsByCategory(cateCode); // 데이터베이스에서 목록을 가져옴
	    for (MarketVo market : list) {
	        if (market.getGoaltarget() == 0) { // 0으로 나누는 것을 방지
	            market.setAchievementrate(0);
	        } else {
	            long achievementRate = (market.getPersonnum() * 100) / market.getGoaltarget();
	            market.setAchievementrate((int) achievementRate);
	        }
	    }

	    return list;
	}

	@Override
	public List<MarketVo> rankedViewByUser(String id, Criteria criteria) {
		
		int pageSize = criteria.getAmount();
	    int offset = (criteria.getPageNum() - 1) * pageSize;
		Map<String, Object> params = new HashMap<>();
		params.put("id", id);
		params.put("pageSize", pageSize);
		params.put("offset", offset);
		
		List<MarketVo> list = mapper.rankedViewByUser(params); // 데이터베이스에서 목록을 가져옴
	    for (MarketVo market : list) {
	        if (market.getGoaltarget() == 0) { // 0으로 나누는 것을 방지
	            market.setAchievementrate(0);
	        } else {
	            long achievementRate = (market.getPersonnum() * 100) / market.getGoaltarget();
	            market.setAchievementrate((int) achievementRate);
	        }
	    }

	    return list;
	}
	
	@Override
    public int getTotalCount(String id) {
        Map<String, Object> params = new HashMap<>();
        params.put("id", id);
        return mapper.getTotalCount(params);
    }
	
	@Override
    public int getTotalCount2() {
        Map<String, Object> params = new HashMap<>();
        return mapper.getTotalCount2(params);
    }
	
	@Override
	public List<SearchStatVo> getStatList(Criteria cri) {
	    List<SearchStatVo> list = mapper.getStatList(cri);
	    
	    for(SearchStatVo vo : list) {
	        Long category = vo.getCATEGORY(); // PCATEGORY 값 가져오기
	        
	        // PCATEGORY 값에 따라 PCATEGORYName 설정
	        if (Long.valueOf(1111).equals(pCategory)) {
	            vo.setPname("엘지냉장고");
	        } else if (Long.valueOf(1112).equals(pCategory)) {
	            vo.setPname("삼성냉장고");
	        } else if (Long.valueOf(1113).equals(pCategory)) {
	            vo.setPname("위니아냉장고");
	        } else if (Long.valueOf(1121).equals(pCategory)) {
	            vo.setPname("쿠쿠전기밥솥");
	        } else if (Long.valueOf(1122).equals(pCategory)) {
	            vo.setPname("쿠첸전기밥솥");
	        } else if (Long.valueOf(1131).equals(pCategory)) {
	            vo.setPname("엘지인덕션");
	        } else if (Long.valueOf(1132).equals(pCategory)) {
	            vo.setPname("삼성인덕션");
	        } else if (Long.valueOf(1133).equals(pCategory)) {
	            vo.setPname("쿠쿠인덕션");
	        } else if (Long.valueOf(1211).equals(pCategory)) {
	            vo.setPname("엘지TV");
	        } else if (Long.valueOf(1212).equals(pCategory)) {
	            vo.setPname("삼성TV");
	        } else if (Long.valueOf(1221).equals(pCategory)) {
	            vo.setPname("엘지프로젝터");
	        } else if (Long.valueOf(1222).equals(pCategory)) {
	            vo.setPname("삼성프로젝터");
	        } else if (Long.valueOf(1223).equals(pCategory)) {
	            vo.setPname("엡손프로젝터");
	        } else if (Long.valueOf(2111).equals(pCategory)) {
	            vo.setPname("엘지데스크탑");
	        } else if (Long.valueOf(2112).equals(pCategory)) {
	            vo.setPname("삼성데스크탑");
	        } else if (Long.valueOf(2113).equals(pCategory)) {
	            vo.setPname("한성데스크탑");
	        } else if (Long.valueOf(2121).equals(pCategory)) {
	            vo.setPname("엘지노트북");
	        } else if (Long.valueOf(2122).equals(pCategory)) {
	            vo.setPname("삼성노트북");
	        } else if (Long.valueOf(2123).equals(pCategory)) {
	            vo.setPname("레노버노트북");
	        } else if (Long.valueOf(2131).equals(pCategory)) {
	            vo.setPname("엘지모니터");
	        } else if (Long.valueOf(2132).equals(pCategory)) {
	            vo.setPname("삼성모니터");
	        } else if (Long.valueOf(2133).equals(pCategory)) {
	            vo.setPname("필립스모니터");
	        } else if (Long.valueOf(2211).equals(pCategory)) {
	            vo.setPname("AMD CPU");
	        } else if (Long.valueOf(2212).equals(pCategory)) {
	            vo.setPname("인텔 CPU");
	        } else if (Long.valueOf(2221).equals(pCategory)) {
	            vo.setPname("ASUS 메인보드");
	        } else if (Long.valueOf(2222).equals(pCategory)) {
	        	vo.setPname("MSI 메인보드");
	        } else if (Long.valueOf(2223).equals(pCategory)) {
	            vo.setPname("ASROCK 메인보드");
	        } else if (Long.valueOf(2231).equals(pCategory)) {
	            vo.setPname("삼성 램");
	        } else if (Long.valueOf(2232).equals(pCategory)) {
	            vo.setPname("SK하이닉스 램");
	        } else if (Long.valueOf(2233).equals(pCategory)) {
	            vo.setPname("마이크론 램");
	        } else if (Long.valueOf(2311).equals(pCategory)) {
	            vo.setPname("로지텍 마우스");
	        } else if (Long.valueOf(2312).equals(pCategory)) {
	            vo.setPname("레이저 마우스");
	        } else if (Long.valueOf(2321).equals(pCategory)) {
	            vo.setPname("로지텍 키보드");
	        } else if (Long.valueOf(2322).equals(pCategory)) {
	            vo.setPname("앱코 키보드");
	        } else {
	            vo.setPname("미등록상품");
	        }
	    }
	    
	    return list;
	}
}
