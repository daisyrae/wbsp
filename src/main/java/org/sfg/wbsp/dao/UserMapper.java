package org.sfg.wbsp.dao;

import org.sfg.wbsp.domain.User;

import java.util.List;

public interface UserMapper {
    User checkUser(String account);

    List<User> selectAll();

    User selectById(Integer id);

    int insert(User record);

    int update(User record);

    int deleteById(Integer id);
}