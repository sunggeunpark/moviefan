package com.jhta.moviefan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.moviefan.annotation.LoginedCustomer;
import com.jhta.moviefan.vo.Customer;

@Controller
@RequestMapping("/myaccount")
public class MyAccountController {
	
//	// TODO 로그인 인터셉터 기능 켜고 끄기 
//	@GetMapping("/myticket/bookinglist")
//	public String bookingList(/*@LoginedCustomer*/ Customer customer, Model model) {
//		
//		
//		return "/myaccount/myticket/bookinglist";
//	}
//	
//	@GetMapping("/myticket/orderlist")
//	public String orderList() {
//		return "/myaccount/myticket/orderlist";
//	}
//	
//	@GetMapping("/myticket/canclelist")
//	public String cancleList() {
//		return "/myaccount/myticket/canclelist";
//	}
//	
//	@GetMapping("/movielog/wish")
//	public String wishList() {
//		return "/myaccount/movielog/wish";
//	}
//	
//	@GetMapping("/movielog/watched")
//	public String watchedList() {
//		return "/myaccount/movielog/watched";
//	}
//	
//	@GetMapping("/movietalk/myscrap")
//	public String myScrapList() {
//		return "/myaccount/movietalk/myscrap";
//	}
//	
//	@GetMapping("/movietalk/mydocuments")
//	public String myDocumentList() {
//		return "/myaccount/movietalk/mydocuments";
//	}
//	
//	@GetMapping("/movietalk/mycomments")
//	public String myCommentList() {
//		return "/myaccount/movietalk/mycomments";
//	}
//	
//	@GetMapping("/movietalk/myreplies")
//	public String myReplyList() {
//		return "/myaccount/movietalk/myreplies";
//	}
//	
//	@GetMapping("/mypoint/info")
//	public String myPointInfo() {
//		return "/myaccount/mypoint/info";
//	}
//	
//	@GetMapping("/mypoint/history")
//	public String myPointHistory() {
//		return "/myaccount/mypoint/history";
//	}
//	
//	@GetMapping("/myinfo/modify")
//	public String modifyMyInfo() {
//		return "/myaccount/myinfo/modify";
//	}
//	
//	@GetMapping("/myinfo/delete")
//	public String deleteMyInfo() {
//		return "/myaccount/myinfo/delete";
//	}
	
}
