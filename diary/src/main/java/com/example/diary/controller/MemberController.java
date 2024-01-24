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
	public String login() {
		
		return "member/login";
	}

	@PostMapping("/login")
	public String login(HttpSession session, Member paramMember) {
		// 로그인 전에만
		
		if(memberService.login(paramMember) != null) {
			Member loginMember = memberService.login(paramMember);
			session.setAttribute("loginMember", loginMember);
			return "redirect:/home";	
		} else {
			return "login";
		}
				
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
	public String removeMember(Model model, HttpSession session) {
		Member member = (Member)session.getAttribute("loginMember");
		model.addAttribute("member", member);
		return "member/removeMember";
	}
	
	@PostMapping("/removeMember")
	public String removeMember(Member member) {

		Member removeMember = memberService.login(member);
		
		if (removeMember != null) {
			// To do: commentDelete, noticeDelete, scheduleDelete
			memberService.removeMember(member);
			return "member/login";
		} else {
			return "redirect:removeMember";
		}
	}
	
	@GetMapping("/modifyMember")
	public String modifyMember(Model model, Member member, HttpSession session) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		model.addAttribute("loginMember", loginMember);
		return "member/modifyMember";
	}
	
	@PostMapping("/modifyMember")
	public String modifyMember(Member member, String memberNewPw) {
		
		// 현재PW 일치여부 확인위해 객체설정 및 대입 -> checkMember가 존재해야 정보수정 가능

		Member checkMember = memberService.login(member);
		
		if (checkMember != null) {
			checkMember.setMemberPw(memberNewPw);
		
			memberService.modifyMember(checkMember);
			return "member/login";
		} else {
			return "redirect:modifyMember";
		}
	}
	
}
