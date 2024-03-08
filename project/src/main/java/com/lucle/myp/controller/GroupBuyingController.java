package com.lucle.myp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.lucle.myp.service.GroupBuyingService;
import com.lucle.myp.domain.GroupBuyingVo;

@Controller
@RequestMapping("/groupbuying")
public class GroupBuyingController {

    private final GroupBuyingService service;

    public GroupBuyingController(GroupBuyingService service) {
        this.service = service;
    }

    // 공동 구매 게시글 등록
    @PostMapping("/register")
    public String registerGroupBuying(GroupBuyingVo groupBuying, Model model) {
        service.registerGroupBuying(groupBuying);
        return "redirect:/groupbuying/list";
    }

    // 공동 구매 게시글 상세 조회
    @GetMapping("/{gno}")
    public String getGroupBuying(@PathVariable Long gno, Model model) {
        model.addAttribute("groupBuying", service.getGroupBuying(gno));
        return "groupbuying/view";
    }

    // 공동 구매 게시글 목록 조회
    @GetMapping("/list")
    public String listGroupBuying(Model model) {
        model.addAttribute("groupBuyingList", service.listGroupBuying());
        return "groupbuying/list";
    }

    // 공동 구매 게시글 수정
    @PostMapping("/update")
    public String updateGroupBuying(GroupBuyingVo groupBuying) {
        service.updateGroupBuying(groupBuying);
        return "redirect:/groupbuying/list";
    }

    // 공동 구매 게시글 삭제
    @PostMapping("/delete/{gno}")
    public String deleteGroupBuying(@PathVariable Long gno) {
        service.removeGroupBuying(gno);
        return "redirect:/groupbuying/list";
    }
}