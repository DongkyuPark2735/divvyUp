package com.lec.divvyup.dao;
<<<<<<< HEAD
=======


>>>>>>> 49ab70f5ed70f4880e0940d619e7a6f61843319d
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.divvyup.vo.Member;

@Mapper
public interface MemberDao {
<<<<<<< HEAD
	 public Member loginMember(String mid); // 로그인
	   public int confirmMid(String mid); // 아이디 중복체크
	   public int confirmMemail(String memail); // 이메일 중복체크
	   public int joinMember(Member member); // 회원가입
	   public Member getMember(String mid); // 회원정보 가져오기(로그인 성공시 세션에 mid값 담기)
	   public int modifiyMember(Member member); // 회원정보 수정
	   public Member searchMid(Member member); // 아이디 찾기
	   public Member searchMpw(Member member); // 비밀번호 찾기  
	   public List<Member> searchMember(Member member); // 친구 찾기 
	   public List<Member> memberListForGroupBoard(); // 모든 회원 리스트

=======
<<<<<<< HEAD
	public Member loginMember(String mid); // 로그인
	public int confirmMid(String mid); // 아이디 중복체크
	public int confirmMemail(String memail); // 이메일 중복체크
	public int joinMember(Member member); // 회원가입
	public Member getMember(String mid); // 회원정보 가져오기(로그인 성공시 세션에 mid값 담기)
	public int modifiyMember(Member member); // 회원정보 수정
	public Member searchMid(Member member); // 아이디 찾기
	public Member searchMpw(Member member); // 비밀번호 찾기  
	public List<Member> searchMember(Member member); // 친구 찾기 
	public List<Member> memberListForGroupBoard(); // 모든 회원 리스트
>>>>>>> 49ab70f5ed70f4880e0940d619e7a6f61843319d
}
=======
   public Member loginMember(String mid); // 로그인
   public int confirmMid(String mid); // 아이디 중복체크
   public int confirmMemail(String memail); // 이메일 중복체크
   public int joinMember(Member member); // 회원가입
   public Member getMember(String mid); // 회원정보 가져오기(로그인 성공시 세션에 mid값 담기)
   public int modifiyMember(Member member); // 회원정보 수정
   public Member searchMid(Member member); // 아이디 찾기
   public Member searchMpw(Member member); // 비밀번호 찾기  
   public List<Member> searchMember(Member member); // 친구 찾기 
   public List<Member> memberListForGroupBoard(); // 모든 회원 리스트
}
>>>>>>> 6046d284dcb394365a7690681b38d38763173063
