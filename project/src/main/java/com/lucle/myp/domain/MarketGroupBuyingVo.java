package com.lucle.myp.domain;

import lombok.Data;

@Data
public class MarketGroupBuyingVo {
	MarketVo marketVo;
	GroupBuyingVo groupBuyingVo;
	
	public MarketGroupBuyingVo(MarketVo marketVo, GroupBuyingVo groupBuyingVo) {
        this.marketVo = marketVo;
        this.groupBuyingVo = groupBuyingVo;
    }
	
	public Long getPersonNum() {
		return marketVo.getPersonnum();
	}
	
	public Long getGoalTarget() {
		return marketVo.getGoaltarget();
	}
	
	private int achievementRate;
	
}
