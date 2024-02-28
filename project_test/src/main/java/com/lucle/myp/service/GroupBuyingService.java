package com.lucle.myp.service;

import java.util.List;

import com.lucle.myp.domain.GroupBuyingVo;

public interface GroupBuyingService {
    void registerGroupBuying(GroupBuyingVo groupBuying);
    GroupBuyingVo getGroupBuying(Long gno);
    void updateGroupBuying(GroupBuyingVo groupBuying);
    void removeGroupBuying(Long gno);
    List<GroupBuyingVo> listGroupBuying();
}