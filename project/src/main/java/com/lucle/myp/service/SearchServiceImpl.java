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
