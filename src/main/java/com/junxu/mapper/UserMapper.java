package com.junxu.mapper;

import com.junxu.po.User;

import java.util.Map;

public interface UserMapper {
    User checkUserIsExist(Map<String,Object> map);
}
