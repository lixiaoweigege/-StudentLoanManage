package com.java2019.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.java2019.pojo.Loanapply;

public interface LoanapplyDao {
public Loanapply findPersonalAndConloaner(String user_idcard);
public void insertLoanapply(Loanapply loanapply);
public Loanapply findPersonalByPidcardAndAyear(@Param("pidcard")String pidcard,@Param("ayear")String ayear);
public List<Loanapply> findAll(String pidcard);
}
