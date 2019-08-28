package com.java2019.service;

import java.util.List;

import com.java2019.pojo.Overdue;
import com.java2019.pojo.PageBean;
import com.java2019.pojo.Repayment;

public interface RepaymentService {

	public List<Repayment> findRepaymentInformation(String pidcard);

	public void addRepayment(Repayment repayment);

	public List<Repayment> findAllRepaymentInformation(PageBean pageBean);

	public int findRepaymentInformationCount();

	public void updateRactualdate(Repayment repayment);

	public int findPersonalRepaymentRecordCount(PageBean pageBean);

	public List<Repayment> findRepaymentRecord(PageBean pageBean);

	public Repayment findMinNowarrearsByYearAndPidcard(String ayear, String conumber);

	public List<Overdue> findAllOverdueInformation(PageBean pageBean);

	

}
