package org.sfg.wbsp.service;

import org.sfg.wbsp.dao.UserMapper;
import org.sfg.wbsp.domain.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author huyang8
 * // TODO: 2018/5/10  用户service服务类
 */
@Service
public class UserService {

    @Resource
    private UserMapper userMapper;

    public User checkUser(String account) {
        return userMapper.checkUser(account);
    }

    public List<User> selectAll() {
        return userMapper.selectAll();
    }

    public User selectById(Integer id) {
        return userMapper.selectById(id);
    }

    public void insert(User record) {
        userMapper.insert(record);
    }

    public void update(User record) {
        userMapper.update(record);
    }

    public void deleteById(Integer id) {
        userMapper.deleteById(id);
    }
}
