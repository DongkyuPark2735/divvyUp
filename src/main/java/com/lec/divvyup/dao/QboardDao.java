package com.lec.divvyup.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.divvyup.vo.Qboard;

@Mapper
public interface QboardDao {
	public int writeQboard(Qboard qboard); // 문의글 작성
	public int modifyQboard(Qboard qboard); // 문의글 수정하기
	public Qboard viewQboard(int qbid); // 문의글 상세보기
	public List<Qboard> listQboardForMember(Qboard qboard); // 멤버를 위한 문의글 목록
	public int getQboardTotCntForMember(); // 멤버를 위한 문의글 갯수 얻기
	public List<Qboard> listQboardForMe(Qboard qboard); // 자신이 작성한 문의글 목록
	public int getQboardTotCntForMe(); // 자신이 작성한 문의글 갯수 얻기
	public List<Qboard> listUncheckedQboardForAdmin(Qboard qboard); // 관리자를 위한 답글처리가 안 된 문의글 목록
	public int getUncheckedQboardTotCntForAdmin();
	public List<Qboard> listCheckedQboardForAdmin(Qboard qboard); // 관리자를 위한 답글처리가 된 문의글 목록
	public int getCheckedQboardTotCntForAdmin(); // 관리자를 위한 답글처리가 된 문의글 갯수 얻기
	public int updateQboardReplyCheck(int qbid); // 답글처리가 된 문의글의 처리상태 바꾸기(AboardServiceImpl에서 호출)
	public int deleteQboard(int qbid);
}
