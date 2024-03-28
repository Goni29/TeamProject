package com.lucle.myp.domain;

import lombok.Data;

@Data
public class MarketGroupBuyingVo {
<<<<<<< HEAD
	MarketVo marketVo;
	GroupBuyingVo groupBuyingVo;
	
	public MarketGroupBuyingVo(MarketVo marketVo, GroupBuyingVo groupBuyingVo) {
=======
    private MarketVo marketVo;
    private GroupBuyingVo groupBuyingVo;

    public MarketGroupBuyingVo(MarketVo marketVo, GroupBuyingVo groupBuyingVo) {
>>>>>>> branch 'master' of https://github.com/Goni29/TeamProject.git
        this.marketVo = marketVo;
        this.groupBuyingVo = groupBuyingVo;
    }
<<<<<<< HEAD
	
	public Long getPersonNum() {
		return marketVo.getPersonnum();
	}
	
	public Long getGoalTarget() {
		return marketVo.getGoaltarget();
	}
	
	private int achievementRate;
	
=======
>>>>>>> branch 'master' of https://github.com/Goni29/TeamProject.git
}
