package com.java2019.dao;

import com.java2019.pojo.Conloaner;

public interface ConloanerDao {
public Conloaner findConloanerByuser_idcard(String user_idcard);
public void insertConloaner(String user_idcard);
public void updateConloaner(Conloaner conloaner);

}
