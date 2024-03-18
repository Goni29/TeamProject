package com.lucle.myp.mapper;

import java.util.List;

import com.lucle.myp.domain.GroupBuyingVo;
import com.lucle.myp.domain.UserVo;

public interface GroupBuyingMapper {
    void insertGroupBuying(GroupBuyingVo groupBuying);
    GroupBuyingVo selectGroupBuying(Long gno);
    void updateGroupBuying(GroupBuyingVo groupBuying);
    void deleteGroupBuying(Long gno);
	List<GroupBuyingVo> listGroupBuying();
	boolean participateInGroupPurchase(GroupBuyingVo request, UserVo user);
}