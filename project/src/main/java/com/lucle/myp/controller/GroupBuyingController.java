package com.lucle.myp.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lucle.myp.domain.GroupBuyingVo;
import com.lucle.myp.domain.ReplyVo;
import com.lucle.myp.domain.UserVo;
import com.lucle.myp.service.GroupBuyingService;
import com.lucle.myp.service.ReplyService;

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
   
    @Autowired
    private ReplyService replyService;

    @RequestMapping(value = "/participate", method = RequestMethod.POST)
    @ResponseBody
    public  ResponseEntity<?> participateInGroupBuying(HttpServletRequest request, @RequestBody GroupBuyingVo groupBuyingVo) {
    	HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loginVo") == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("message", "로그인이 필요합니다."));
        }

        UserVo userVo = (UserVo) session.getAttribute("loginVo");
        boolean success = service.participate(groupBuyingVo);
        if (!success) {
            return ResponseEntity.badRequest().body(Map.of("message", "공동구매 참여에 실패했습니다."));
        }
        System.out.println("!!!!!!!!!!" + success);
        ReplyVo replyVo = new ReplyVo();
        replyVo.setNum(groupBuyingVo.getNum());
        replyVo.setReply("공동구매에 참여했습니다!");
        replyVo.setReplyer(userVo.getNickname());
        replyVo.setVisible(1);
//        replyService.addReply(replyVo); //여기서 오류가생김....
        return ResponseEntity.ok(Map.of("message", "공동구매에 성공적으로 참여하였으며, 댓글이 자동으로 작성되었습니다."));   
//        return null;
    }

}