package com.java2019.service;

import java.util.List;

import com.java2019.pojo.Loanapply;

public interface LoanapplyService {
	public Loanapply findPersonalAndConloaner(String user_idcard);
	public void insertLoanapply(Loanapply loanapply);
	public Loanapply findPersonalByPidcardAndAyear(String pidcard,String ayear);
	public List<Loanapply> findAll(String pidcard);
}
