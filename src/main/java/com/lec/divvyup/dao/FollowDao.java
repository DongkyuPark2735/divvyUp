package com.lec.divvyup.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.divvyup.vo.Follow;

@Mapper
public interface FollowDao {
	public int followMember(Follow follow); // 팔로우 하기
	public int unfollowMember(Follow follow); // 언팔로우 하기
	public List<Follow> myFollowingList(String from_mid); // 내가 팔로잉하는 사람들 목록
	public List<Follow> myFollowerList(String to_mid); // 나를 팔로우하는 사람들 목록
}
