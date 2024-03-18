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
    public boolean participate(GroupBuyingVo groupBuyingVo, UserVo userVo) {
        try {
            // 참여자 수 증가, 공동구매 참여자 목록에 사용자 추가 등의 로직 구현
            // 예시로, GroupBuyingVo 객체에 참여자 수를 업데이트하는 로직을 추가
            groupBuyingVo.setPersonnum(groupBuyingVo.getPersonnum() + 1);
            updateGroupBuying(groupBuyingVo); // 참여자 수 업데이트

            // 성공적으로 처리됐다고 가정
            return true;
        } catch (Exception e) {
            // 예외 처리, 로그 기록 등
            return false;
        }
    }

}