package com.jhta.moviefan.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.moviefan.annotation.LoginedCustomer;
import com.jhta.moviefan.controller.HomeController;
import com.jhta.moviefan.dao.CustomerDao;
import com.jhta.moviefan.dao.MovieDao;
import com.jhta.moviefan.vo.Customer;
import com.jhta.moviefan.vo.CustomerMovieWishList;
import com.jhta.moviefan.vo.Movie;

@Service
public class CustomerService {
	
	static final Logger LOGGER = LogManager.getLogger(CustomerService.class);

	@Autowired
	private CustomerDao customerDao;
	@Autowired
	private MovieDao movieDao;
	
	public Customer registerCustomer(Customer customer) {
		Customer savedCustomer = customerDao.getCustomerById(customer.getId());
		if (savedCustomer != null) {
			throw new RuntimeException("사용할 수 없는 아이디입니다.");
		}
		
		savedCustomer = customerDao.getCustomerByEmail(customer.getEmail());
		if (savedCustomer != null) {
			throw new RuntimeException("사용할 수 없는 이메일입니다.");
		}
		
		savedCustomer = customerDao.getCustomerByNickName(customer.getNickName());
		if (savedCustomer != null) {
			throw new RuntimeException("사용할 수 없는 닉네임입니다.");
		}
		
		savedCustomer = customerDao.getCustomerByPhoneNumber(customer.getPhoneNumber());
		if (savedCustomer != null) {
			throw new RuntimeException("사용할 수 없는 전화번호입니다.");
		}
		
		customerDao.insertCustomer(customer);
		
		return customer;
	}
	
	// 일반 로그인
	public Customer login(String id, String password) {
		Customer savedCustomer = customerDao.getCustomerById(id);
		
		if (savedCustomer == null) {
			throw new RuntimeException("사용자가 존재하지 않습니다..");
		}
		if (!"NORMAL".equals(savedCustomer.getLoginType())) {
			throw new RuntimeException("사이트에 가입된 사용자가 아닙니다.");
		}
		if ("Y".equals(savedCustomer.getIsWithdrawal())) {
			throw new RuntimeException("탈퇴처리된 사용자입니다.");
		}
		if (!password.equals(savedCustomer.getPassword())) {
			throw new RuntimeException("비밀번호가 일치하지 않습니다.");
		}
		
		return savedCustomer;
	}
	
	/**
	 * 카카오 로그인시 사용되는 로직
	 * @param customer 카카오 로그인 폼으로 전달된 객체
	 * @return 처음 로그인한 사용자는 DB에 사용자정보를 저장한 후에, 저장한 사용자 정보를 반환한다. 
	 * 		   다음에 로그인할 때에는 DB에 저장된 사용자 정보를 조회해서 바로 사용자 정보를 반환한다.
	 */
	public Customer loginWithKakao(Customer customer) {
		Customer savedCustomer = customerDao.getCustomerById(customer.getId());
		if (savedCustomer == null) {
			customer.setLoginType("KAKAO");
			customerDao.insertCustomer(customer);
			Customer newKakaoCustomer = customerDao.getCustomerById(customer.getId());
			LOGGER.info("처음 로그인한 사용자: " + newKakaoCustomer);
			return newKakaoCustomer;
		}
		return savedCustomer;
	}

	public List<Movie> getCustomerMovieWishList(int customerNo) {
		List<CustomerMovieWishList> customerMovieWishList = customerDao.getCustomerMovieWishListByCustomerNo(customerNo);
		
		List<Movie> movies = new ArrayList<Movie>();

		for (CustomerMovieWishList item : customerMovieWishList) {
			Movie movie = movieDao.getMovieByMovieNo(item.getMovieNo());
			movies.add(movie);
		}
		
		return movies;
	}
	
	public void updateCustomerInfo(Customer customer) {
		customerDao.updateCustomer(customer);
	}
	
	public void deleteCustomerInfo(int customerNo) {
		customerDao.deleteCustomerByNo(customerNo);
	}
	
	
}
