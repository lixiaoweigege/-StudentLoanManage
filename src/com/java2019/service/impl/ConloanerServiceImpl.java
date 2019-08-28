package com.java2019.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.java2019.dao.ConloanerDao;
import com.java2019.pojo.Conloaner;
import com.java2019.service.ConloanerService;
@Service("conloanerService")
@Transactional
public class ConloanerServiceImpl implements ConloanerService {
//×¢ÈëconloanerDao
	@Autowired	
	private ConloanerDao conloanerDao;
	@Override
	public Conloaner findConloanerByuser_idcard(String user_idcard) {
		Conloaner conloaner=this.conloanerDao.findConloanerByuser_idcard(user_idcard);
		return conloaner;
	}
	@Override
	public void updateConloaner(Conloaner conloaner) {
		conloanerDao.updateConloaner(conloaner);
		
	}
	@Override
	public void insertConloaner(String user_idcard) {
		conloanerDao.insertConloaner(user_idcard);
		
	}

}
