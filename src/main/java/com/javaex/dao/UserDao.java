package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.UserVo;

@Repository
public class UserDao {

	@Autowired
	private SqlSession sqlSession;

	// 회원 정보 가져오기(로그인용)
	public UserVo getUser(UserVo userVo) {
		System.out.println("UserDao.getUser()");

		UserVo authUser = sqlSession.selectOne("users.getUser", userVo);

		return authUser;
	}

	// 회원정보 저장(회원가입)
	public int userInsert(UserVo userVo) {
		System.out.println("UserDao.userInsert()");

		int count = sqlSession.insert("users.insert", userVo);

		return count;
	}

}
