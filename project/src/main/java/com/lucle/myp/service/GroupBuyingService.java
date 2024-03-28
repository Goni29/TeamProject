package com.lucle.myp.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lucle.myp.domain.GroupBuyingVo;
import com.lucle.myp.domain.UserVo;

public interface GroupBuyingService {
    void registerGroupBuying(GroupBuyingVo groupBuying);
    GroupBuyingVo getGroupBuying(Long gno);
    void updateGroupBuying(GroupBuyingVo groupBuying);
    void removeGroupBuying(Long gno);
    List<GroupBuyingVo> listGroupBuying();
    boolean participate(GroupBuyingVo groupBuyingVo);
    void addBuyingRecord(GroupBuyingVo groupBuying);
    List<GroupBuyingVo> BuyingRecord(GroupBuyingVo groupBuying);
}