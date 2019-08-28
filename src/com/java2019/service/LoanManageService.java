package com.java2019.service;

import java.util.List;

import com.java2019.pojo.Auditing;
import com.java2019.pojo.Contract;
import com.java2019.pojo.Loanapply;
import com.java2019.pojo.PageBean;

public interface LoanManageService {
	public List<Loanapply> findAllLoanApply(Auditing auditing);
	public int findLoanApplyCount();
	public void updateAstate(Loanapply loanapply);
	public Loanapply findPersonalAndConloanerById(String id);
	public void addContract(Contract contract);
	public List<Contract> findAllLoanRecord(PageBean pageBean);
	public int findContractCount();
	public void deleteContract(Integer[] id); 
}
