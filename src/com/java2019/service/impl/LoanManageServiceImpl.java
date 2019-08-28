package com.java2019.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java2019.dao.LoanManageDao;
import com.java2019.pojo.Auditing;
import com.java2019.pojo.Contract;
import com.java2019.pojo.Loanapply;
import com.java2019.pojo.PageBean;
import com.java2019.service.LoanManageService;
@Service("loanManageService")
public class LoanManageServiceImpl implements LoanManageService {
	//注入LoanapplyDao
		@Autowired
		private LoanManageDao  loanManageDao;
	@Override
	public List<Loanapply> findAllLoanApply(Auditing auditing) {
		List<Loanapply> list=loanManageDao.findAllLoanApply(auditing);
		return list;
	}
	@Override
	public int findLoanApplyCount() {
		int total=loanManageDao.findLoanApplyCount();
		return total;
	}
	@Override
	public void updateAstate(Loanapply loanapply) {
		// TODO 自动生成的方法存根
		loanManageDao.updateAstate(loanapply);
	}
	@Override
	public Loanapply findPersonalAndConloanerById(String id) {
		// TODO 自动生成的方法存根
		Loanapply loanapply=loanManageDao.findPersonalAndConloanerById(id);
		return loanapply;
	}
	/*	 
	 * 保存贷款合同数据	 
	 */
	@Override
	public void addContract(Contract contract) {
		loanManageDao.addContract(contract);
		
	}
	/*
	 * 查询所有贷款合同记录
	 */
	@Override
	public List<Contract> findAllLoanRecord(PageBean pageBean) {
		// TODO 自动生成的方法存根
		List<Contract> list=loanManageDao.findAllLoanRecord(pageBean);
		return list;
	}
	@Override
	public int findContractCount() {
		// TODO 自动生成的方法存根
		int total=loanManageDao.findContractCount();
		return total;
	}
	@Override
	public void deleteContract(Integer[] id) {
		// TODO 自动生成的方法存根
		loanManageDao.deleteContract(id);
	}

}
