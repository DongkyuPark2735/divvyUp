package com.lec.divvyup.dao;

import org.apache.ibatis.annotations.Mapper;

import com.lec.divvyup.vo.Member;

@Mapper
public interface MemberDao {
	public Member loginMember(String mid); // 로그인
	public int confirmMid(String mid); // 아이디 중복체크
	public int confirmMemail(String memail); // 이메일 중복체크
	public int joinMember(Member member); // 회원가입
	public Member getMember(String mid); // 회원정보 가져오기(로그인 성공시 세션에 mid값 담기)
	public int modfiyMember(Member member); // 회원정보 수정
	public String searchMid(String mname, String memail); // 아이디 찾기
	public String searachMpw(String mid, String mname, String memail); // 비밀번호 찾기 
}
