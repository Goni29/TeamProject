package com.lucle.myp.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lucle.myp.domain.GroupBuyingVo;
import com.lucle.myp.domain.UserVo;
import com.lucle.myp.mapper.GroupBuyingMapper;

@Service
public class GroupBuyingServiceImpl implements GroupBuyingService {

    private final GroupBuyingMapper mapper;

    public GroupBuyingServiceImpl(GroupBuyingMapper mapper) {
        this.mapper = mapper;
    }

    @Transactional
    @Override
    public void registerGroupBuying(GroupBuyingVo groupBuying) {
        mapper.insertGroupBuying(groupBuying);
    }

    @Override
    public GroupBuyingVo getGroupBuying(Long gno) {
        return mapper.selectGroupBuying(gno);
    }

    @Transactional
    @Override
    public void updateGroupBuying(GroupBuyingVo groupBuying) {
        mapper.updateGroupBuying(groupBuying);
    }

    @Transactional
    @Override
    public void removeGroupBuying(Long gno) {
        mapper.deleteGroupBuying(gno);
    }
    
    @Override
    public List<GroupBuyingVo> listGroupBuying() {
        return mapper.listGroupBuying();
    }
    
    @Transactional
    @Override
    public boolean participate(GroupBuyingVo groupBuyingVo) {
    	boolean result = false;
    	Long num = groupBuyingVo.getNum();
    	int imsi = mapper.updateParticipation(num);
    	if( imsi !=0) {
    		result = true;
    	}
    	return result;
    }

	@Override
	public void addBuyingRecord(GroupBuyingVo groupBuying) {
		System.out.println(groupBuying);
		mapper.addBuyingRecord(groupBuying);
	}

	@Override
	public List<GroupBuyingVo> BuyingRecord(GroupBuyingVo groupBuying) {
		return mapper.BuyingRecord(groupBuying);
	}
    

}