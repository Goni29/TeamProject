package com.lucle.myp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lucle.myp.domain.Criteria;
import com.lucle.myp.domain.SearchStatVo;
import com.lucle.myp.domain.SearchVo;
import com.lucle.myp.domain.UserVo;
import com.lucle.myp.mapper.SearchMapper;

@Service
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	SearchMapper mapper;

	@Override
	public int insert(SearchVo vo, HttpServletRequest req) {
		
		vo.setIp(req.getRemoteAddr());
		
		return mapper.insert(vo);
	}

	@Override
	public int delete(long sno) {
		return mapper.delete(sno);
	}

	@Override
	public List<SearchVo> getCountList(Criteria cri) {
		return mapper.getCountList(cri);
	}

	@Override
	public List<SearchVo> getHistoryOne(String id, int visible, Criteria cri) {
		return mapper.getHistoryOne(id, visible, cri);
	}

	@Override
	public List<SearchVo> getHistoryList(Criteria cri) {
		return mapper.getHistoryList(cri);
	}

	@Override
	public List<SearchVo> getHistoryOneIp(String ip, int visible, Criteria cri) {
		return mapper.getHistoryOneIp(ip, visible, cri);
	}

	@Override
	public List<SearchStatVo> getStatList(Criteria cri) {
	    List<SearchStatVo> list = mapper.getStatList(cri);
	    
	    for(SearchStatVo vo : list) {
	        Long pCategory = vo.getPCATEGORY(); // PCATEGORY 값 가져오기
	        
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

	 @Override
	    public Map<String, List<UserVo>> getUsersByRegions(List<String> regions) {
	        Map<String, List<UserVo>> regionData = new HashMap<>();
	        for (String region : regions) {
	            List<UserVo> users = mapper.selectUsersByRegion(region);
	            regionData.put(region, users);
	        }
	        return regionData;
	    }
}
