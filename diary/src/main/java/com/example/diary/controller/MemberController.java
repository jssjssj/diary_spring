package com.example.diary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.diary.service.MemberService;
import com.example.diary.vo.Member;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	

	
	@GetMapping("/login")
	public String login(HttpSession session , Model model) {
			// 로그인 전에만
			if(session.getAttribute("loginMember")!=null) {
				return "redirect:/home";
			}			
		return "member/login";
	}

	@PostMapping("/login")
	public String login(HttpSession session , Member paramMember) {
		// 로그인 전에만
		Member loginMember = memberService.login(paramMember);
		if(loginMember ==null) {
			return "redirect:/login";		
		}
		System.out.println(loginMember + "<--loginMember");		
		session.setAttribute("loginMember" , loginMember);
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
	public String addMember(Member member) {
		System.out.println(member + "<--member");
		memberService.addMember(member);
		return "member/login";
		
	}
	
	@GetMapping("/removeMember")
	public String removeMember(Model model,Member member , HttpSession session) {		
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember==null) {
			return "member/login";
		}
		System.out.println(member);
		model.addAttribute("member" ,member);
		return "member/removeMember";		
	}	
	@PostMapping("/removeMember")
	public String removeMember(Member member , HttpSession session) {
		Member loginMember = (Member)session.getAttribute("loginMember");
		Member paramMember = new Member();
		paramMember.setMemberId(loginMember.getMemberId());
		paramMember.setMemberPw(member.getMemberPw());
		
		Member removeMember = memberService.login(paramMember);
		System.out.println(removeMember + "<--removeMember!!");
		if(removeMember!=null) {
			memberService.removeMember(loginMember);
			return "member/login";
		} else {
			return "redirect:/removeMember";
		}	
	}
	
	@GetMapping("/modifyMember")
	public String modifyMember(Model model , Member member , HttpSession session) {		
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember==null) {
			return "member/login";
		}
		model.addAttribute("loginMember" ,loginMember);
		return "member/modifyMember";
	}	
	@PostMapping("/modifyMember")
	public String modifyMember(Member member , HttpSession session , String memberNewPw) {
		Member loginMember = (Member)session.getAttribute("loginMember");
		System.out.println(member);
		// 현재PW 일치여부 확인위해 객체설정 및 대입 -> checkMember가 존재해야 정보수정 가능
		Member paramMember = new Member();
		paramMember.setMemberId(loginMember.getMemberId());
		paramMember.setMemberPw(member.getMemberPw());
		
		Member checkMember = memberService.login(paramMember);
		System.out.println(checkMember + "<-- checkMember"); // 디버킹 -> null값 아닐 시 정보수정 가능
		if(checkMember != null) {
			Member modifyMember = new Member();
			modifyMember.setMemberNo(loginMember.getMemberNo());
			modifyMember.setMemberPw(memberNewPw);
			System.out.println(modifyMember + "<--modifyMember");
			memberService.modifyMember(modifyMember);
			return "member/login";
		} else {
			return "redirect:/modifyMember";
		}
		
	}
	
}
