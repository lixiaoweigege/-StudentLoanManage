package com.java2019.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java2019.dao.LoanapplyDao;
import com.java2019.pojo.Loanapply;
import com.java2019.service.LoanapplyService;
@Service("loanapplyService")
public class LoanapplyServiceImpl implements LoanapplyService {
	//注入LoanapplyDao
	@Autowired
	private LoanapplyDao loanapplyDao;
	
/*
 * 查询并回显个人和共同借款人到申请页面
 */
	@Override
	public Loanapply findPersonalAndConloaner(String user_idcard) {
		Loanapply loanapply=loanapplyDao.findPersonalAndConloaner(user_idcard);
		return loanapply;
	}
	@Override
	public void insertLoanapply(Loanapply loanapply) {
		
		loanapplyDao.insertLoanapply(loanapply);
		
	}
	@Override
	public Loanapply findPersonalByPidcardAndAyear(String pidcard, String ayear) {
		Loanapply loanapply=loanapplyDao.findPersonalByPidcardAndAyear(pidcard, ayear);
		return loanapply;
	}
	/*获得贷款记录
	 */
	@Override
	public List<Loanapply> findAll(String pidcard) {
		List<Loanapply> list=loanapplyDao.findAll(pidcard);
		return list;
	}

}
