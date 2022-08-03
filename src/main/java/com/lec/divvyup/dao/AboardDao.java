package com.lec.divvyup.dao;

import org.apache.ibatis.annotations.Mapper;

import com.lec.divvyup.vo.Aboard;
@Mapper
public interface AboardDao {
	public int writeAboard(Aboard aboard); // 답변글 작성
	public int modifyAboard(Aboard aboard); // 답변글 수정
	public Aboard viewAboard(int qbid); // 문의글 상세보기 했을 때 답변글 상세보기
	public int deleteAboard(int abid); // 답변글 삭제 
}
