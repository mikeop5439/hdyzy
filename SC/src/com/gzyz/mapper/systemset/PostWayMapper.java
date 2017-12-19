package com.gzyz.mapper.systemset;

import java.util.List;

import com.gzyz.bean.systemset.PostWay;

public interface PostWayMapper {
	public List<PostWay> findPostWayList(PostWay postWay);
	public PostWay findPostWay(PostWay postWay);
	public void deletePostWay(PostWay postWay);
	public void updataPostWay(PostWay postWay);
	public void addPostWay(PostWay postWay);
}
