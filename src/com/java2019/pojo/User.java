package com.java2019.pojo;

import java.io.Serializable;
/*
 * 用户持久化类
 */
public class User implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer user_id;
	private String user_name;
	private String user_password;
	private String user_idcard;
	private String user_email;
	private String user_state;
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_idcard() {
		return user_idcard;
	}
	public void setUser_idcard(String user_idcard) {
		this.user_idcard = user_idcard;
	}
	public String getUser_state() {
		return user_state;
	}
	public void setUser_state(String user_state) {
		this.user_state = user_state;
	}
	@Override
	public String toString() {
		return "UserBean [user_id=" + user_id + ", user_name=" + user_name + ", user_password=" + user_password
				+ ", user_idcard=" + user_idcard + ", user_state=" + user_state + "]";
	}
	
}
