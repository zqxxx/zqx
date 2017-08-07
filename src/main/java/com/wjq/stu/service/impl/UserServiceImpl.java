package com.wjq.stu.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wjq.stu.bean.User;
import com.wjq.stu.dao.UserDao;
import com.wjq.stu.service.UserService;

/**
 * 
 * @author HarvestWu
 *
 */

@Service("userService")
public class UserServiceImpl implements UserService{

    @Autowired
    UserDao userDao;

    public boolean login(String username, String password) {
        User user = userDao.selectByName(username);
        if (user != null) {
            if (user.getUserName().equals(username) && user.getPassword().equals(password))
                return true;
        }
        return false;
    }
}
