package com.example.diary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.diary.service.CommentService;
import com.example.diary.service.MemberService;
import com.example.diary.service.NoticeService;
import com.example.diary.service.ScheduleService;
import com.example.diary.vo.Member;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private ScheduleService scheduleService;
	
	@GetMapping("/login")
	public String login(HttpSession session) {
		// 로그인 전에만
		if (session.getAttribute("loginMember") != null) {
			return "redirect:/home";
		}
		return "member/login";
	}

	@PostMapping("/login")
	public String login(HttpSession session, Member paramMember) {
		// 로그인 전에만
		
		if(memberService.login(paramMember) != null) {
			Member loginMember = memberService.login(paramMember);
			session.setAttribute("loginMember", loginMember);
		}
			return "redirect:/home";			
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "member/login";
	}

	@GetMapping("/addMember")
	public String addMember() {
		return "member/addMember";
	}

	@PostMapping("/addMember")
	public String addMember(Member paramMember , Model model) {		
			
		memberService.addMember(paramMember);
		log.info("정상 가입");
		return "member/login";
		
	}
	
	@GetMapping("/removeMember")
	public String removeMember(Model model, Member member, HttpSession session) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		if (loginMember == null) {
			return "member/login";
		}
		
		model.addAttribute("member", member);
		return "member/removeMember";
	}
	
	@PostMapping("/removeMember")
	public String removeMember(Member member, HttpSession session) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		Member paramMember = new Member();
		paramMember.setMemberId(loginMember.getMemberId());
		paramMember.setMemberPw(member.getMemberPw());

		Member removeMember = memberService.login(paramMember);
		
		if (removeMember != null) {
			// todo: commentDelete, noticeDelete, scheduleDelete
			memberService.removeMember(loginMember);
			return "member/login";
		} else {
			return "redirect:/removeMember";
		}
	}
	
	@GetMapping("/modifyMember")
	public String modifyMember(Model model, Member member, HttpSession session) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		if (loginMember == null) {
			return "member/login";
		}
		model.addAttribute("loginMember", loginMember);
		return "member/modifyMember";
	}
	
	@PostMapping("/modifyMember")
	public String modifyMember(Member member, HttpSession session, String memberNewPw) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		
		// 현재PW 일치여부 확인위해 객체설정 및 대입 -> checkMember가 존재해야 정보수정 가능
		Member paramMember = new Member();
		paramMember.setMemberId(loginMember.getMemberId());
		paramMember.setMemberPw(member.getMemberPw());

		Member checkMember = memberService.login(paramMember);
		
		if (checkMember != null) {
			Member modifyMember = new Member();
			modifyMember.setMemberNo(loginMember.getMemberNo());
			modifyMember.setMemberPw(memberNewPw);
		
			memberService.modifyMember(modifyMember);
			return "member/login";
		} else {
			return "redirect:/modifyMember";
		}
	}
	
}
