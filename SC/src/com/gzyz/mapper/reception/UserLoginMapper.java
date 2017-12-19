package com.gzyz.mapper.reception;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gzyz.bean.comment.extend.CommentVo;
import com.gzyz.bean.reception.InsertInfo;

public interface UserLoginMapper {
	public int countUsername(@Param("user_name") String user_name);
	public void insertUsername(InsertInfo insertInfo);
}
