package com.wjq.stu.dao;

import com.wjq.stu.bean.User;


/**
 * 
 * @author HarvestWu
 *
 */
 
public interface UserDao {
	
	public User selectById(int id);
	public User selectByName(String userName);

}
