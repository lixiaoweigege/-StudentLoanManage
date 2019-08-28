package com.java2019.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.java2019.pojo.User;

/*
 * 用户dao层
 */
public interface UserDao {
/*
 * 通过账号和密码查询用户
 */
	public User findUser(@Param("username")String username,@Param("password")String password);
	/*
	 * 注册用户
	 */
	public  void registerUser(User user);
	public void updateUserState(String user_idcard, String user_state);
	public void updatePersonal(String user_name, String user_email, String user_password, String user_idcard);
	public User findUserName(@Param("user_name") String username);
	public List<User> findtUserIdCardList();
	public User findUserIdCard(@Param("user_idcard")String useridcard);
}
