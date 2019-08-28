package com.java2019.service;

import com.java2019.dao.ConloanerDao;
import com.java2019.pojo.Conloaner;

public interface ConloanerService {
	public Conloaner findConloanerByuser_idcard(String user_idcard);
	public void insertConloaner(String user_idcard);
	public void updateConloaner(Conloaner conloaner);
}
