package com.lec.divvyup.service;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import com.lec.divvyup.dao.MemberDao;
import com.lec.divvyup.vo.Member;
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private JavaMailSender mailSender;
	
	@Override
	public Member loginMember(String mid) { // loginCheck로 가능하기 때문에 테스트 후에 지울것
		// TODO Auto-generated method stub
		return memberDao.loginMember(mid);
	}

	@Override
	public int confirmMid(String mid) {
		// TODO Auto-generated method stub
		return memberDao.confirmMid(mid);
	}

	@Override
	public int confirmMemail(String memail) {
		// TODO Auto-generated method stub
		return memberDao.confirmMemail(memail);
	}

	@Override
	public int joinMember(final Member member, HttpSession session) {
		// TODO Auto-generated method stub
		MimeMessagePreparator message = new MimeMessagePreparator() {
			String content = "";
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				// TODO Auto-generated method stub
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(member.getMemail()));
				mimeMessage.setFrom(new InternetAddress("시스템 메일"));
				mimeMessage.setSubject(member.getMid()+"님 회원가입 감사합니다");
				mimeMessage.setText(content, "utf-8", "html");
			}
		};
		mailSender.send(message);
		session.setAttribute("mid", member.getMid()); // 세션에 mid 속성 추가 -> 회원가입 후에 로그인 창에 가입한 아이디 남기기 위함
		return memberDao.joinMember(member); 
	}

	@Override
	public String loginCheck(String mid, String mpw, HttpSession session) {
		// TODO Auto-generated method stub
		String result="로그인 성공";
		Member member = memberDao.getMember(mid);
		if(member == null) {
			result="해당 아이디는 존재하지 않습니다";
		}else if(! mpw.equals(member.getMpw())) {
			result="해당 아이디와 비밀번호가 일치하지 않습니다";
		}else { // 로그인 성공
			session.setAttribute("member", member);
			session.setAttribute("mid", mid);
		}
		return result;
	}

	@Override
	public Member getMember(String mid) {
		// TODO Auto-generated method stub
		return memberDao.getMember(mid);
	}

	@Override
	public int modifyMember(Member member) {
		// TODO Auto-generated method stub
		return memberDao.modfiyMember(member);
	}

	@Override
	public String searchMid(String mname, String memail) {
		// TODO Auto-generated method stub
		return memberDao.searchMid(mname, memail);
	}

	@Override
	public String searchMpw(String mid, String mname, String memail) {
		// TODO Auto-generated method stub
		return memberDao.searachMpw(mid, mname, memail);
	}

}
