package com.java2019.service;

import java.util.List;

import com.java2019.pojo.User;

/*
 * 
 * 用户service层
 */
public interface UserService {
	//用户登录
	public User findUser(String username,String password);
	//用户注册
	public  void registerUser(User user);
	public void updateUserState(String user_idcard, String user_state);
	public void updatePersonal(String user_name, String user_email, String user_password, String user_idcard);
	public User findUserName(String username);
	public List<User> findtUserIdCardList();
	public User findUserIdCard(String useridcard);
}
