package com.java2019.dao;

import java.util.List;

import com.java2019.pojo.Overdue;
import com.java2019.pojo.Personal;

public interface PersonalDao {
public Personal findPersonalByPIdCard(String pidcard);
public void insertPersonal(String user_idcard);
public int upDatePersonal(Personal personal);
public List<Overdue> findPersonalOverdueInformation(String pidcard);
}
