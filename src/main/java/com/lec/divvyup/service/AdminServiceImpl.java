package com.lec.divvyup.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.divvyup.dao.AdminDao;
import com.lec.divvyup.vo.Admin;
@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDao adminDao;
	
	@Override
	public String aloginCheck(String aid, String apw, HttpSession session) {
		// TODO Auto-generated method stub
		String result="관리자 로그인 성공";
		Admin admin = adminDao.getAdmin(aid);
		if(admin == null) {
			result="해당 아이디는 존재하지 않습니다";
		}else if(! apw.equals(admin.getApw())) {
			result="해당 아이디와 비밀번호가 일치하지 않습니다";
		}else { // 관리자 로그인 성공
			session.setAttribute("admin", admin);
			session.setAttribute("aid", aid);
		}
		return result;
	}

	@Override
	public Admin getAdmin(String aid) {
		return adminDao.getAdmin(aid);
	}

}
