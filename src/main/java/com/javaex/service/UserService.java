package com.javaex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.UserDao;
import com.javaex.vo.UserVo;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;

	// 회원가입
	public int join(UserVo userVo) {
		System.out.println("UserService.join()");

		int count = userDao.userInsert(userVo);

		return count;
	}

	// 로그인
	public UserVo login(UserVo userVo) {
		System.out.println("UserService.login()");

		UserVo authUser = userDao.getUser(userVo);

		return authUser;
	}

	// 중복체크
	public String idCheck(String id) {

		String idCheck = userDao.idCheck(id);
		System.out.println(idCheck);

		String result;

		if (idCheck != null) {
			result = "fail";
			
		} else {
			result = "success";
		}

		System.out.println(result);

		return result;
	}

}
