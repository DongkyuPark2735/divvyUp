package com.lec.divvyup.dao;

import org.apache.ibatis.annotations.Mapper;

import com.lec.divvyup.vo.Admin;
@Mapper
public interface AdminDao {
	public Admin getAdmin(String aid); // 관리자정보 가져오기(로그인 성공시 세션에 aid값 담기)
}
