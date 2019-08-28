package com.java2019.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.java2019.dao.PersonalDao;
import com.java2019.pojo.Overdue;
import com.java2019.pojo.Personal;
import com.java2019.service.PersonalService;
@Service("personalService")
@Transactional
public class PersonalServiceImpl implements PersonalService {
	//注入personaldao
		@Autowired
		private PersonalDao personalDao;
	@Override
	public Personal findPersonalByPIdCard(String pidcard) {
		Personal personal=this.personalDao.findPersonalByPIdCard(pidcard);
		return personal;
	}
	@Override
	public int upDatePersonal(Personal personal) {
		
		return personalDao.upDatePersonal(personal);
	}
	@Override
	public void insertPersonal(String user_idcard) {
		personalDao.insertPersonal(user_idcard);		
	}
	@Override
	public List<Overdue> findPersonalOverdueInformation(String pidcard) {
		// TODO 自动生成的方法存根
		List<Overdue> list=personalDao.findPersonalOverdueInformation(pidcard);
		return list;
	}

}
