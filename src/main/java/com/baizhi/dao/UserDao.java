package com.baizhi.dao;

import com.baizhi.entity.User;
import tk.mybatis.mapper.additional.idlist.DeleteByIdListMapper;
import tk.mybatis.mapper.additional.insert.InsertListMapper;
import tk.mybatis.mapper.common.Mapper;

public interface UserDao extends Mapper<User>, InsertListMapper<User> , DeleteByIdListMapper<User,String> {
}
