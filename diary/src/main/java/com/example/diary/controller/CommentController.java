package com.example.diary.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.diary.service.CommentService;
import com.example.diary.vo.Comment;
import com.example.diary.vo.Member;

import jakarta.servlet.http.HttpSession;

@Controller
public class CommentController {
	@Autowired
	private CommentService commentService;
	
	@GetMapping("/commentList")
	public String selectCommentList(Model model,
									@RequestParam(defaultValue = "1") int currentPage) {
		
		  return "notice/noticeOne";
		 
	}
	
	@PostMapping("/addComment")
	public String addCommentList(Comment comment , String secret  , HttpSession session) {
		
		comment.setSecret(false);
		if(secret=="Y") {
			comment.setSecret(true);
		}
	
		
		System.out.println(secret + "<-- isSecret");
		int row = commentService.insertComment(comment);
		if(row>0) {
			return "redirect:notice/noticeOne";
		} else {
			return "notice/noticeOne";
		}
		
		 				
	}
}
