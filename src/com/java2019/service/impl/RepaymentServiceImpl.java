package com.java2019.service.impl;

import java.text.DecimalFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java2019.dao.LoanManageDao;
import com.java2019.dao.RepaymentDao;
import com.java2019.pojo.Contract;
import com.java2019.pojo.Loanapply;
import com.java2019.pojo.Overdue;
import com.java2019.pojo.PageBean;
import com.java2019.pojo.Repayment;
import com.java2019.service.RepaymentService;
@Service("repaymentService")
public class RepaymentServiceImpl implements RepaymentService {
      @Autowired
     private RepaymentDao repaymentDao;
     //注入LoanapplyDao
		@Autowired
		private LoanManageDao  loanManageDao;
	@Override
	public List<Repayment> findRepaymentInformation(String pidcard) {
		List<Repayment> list=repaymentDao.findRepaymentInformation(pidcard);
		return list;
	}
	@Override
	/*
	 * 添加还款申请
	 *
	 */
	public void addRepayment(Repayment repayment) {
		// TODO 自动生成的方法存根
		repaymentDao.addRepayment(repayment);
	}
	@Override
	public List<Repayment> findAllRepaymentInformation(PageBean pageBean) {
		List<Repayment> list=repaymentDao.findAllRepaymentInformation(pageBean);
		return list;
	}
	@Override
	public int findRepaymentInformationCount() {
		int total=repaymentDao.findRepaymentInformationCount();
		return total;
	}
	/*
	 * 添加扣款日期
	 */
	@Override
	public void updateRactualdate(Repayment repayment) {
		// TODO 自动生成的方法存根
		Loanapply loanapply=new Loanapply();//实例化loanapply，往里面存入贷款状态
		int loanapplyId=Integer.parseInt(repayment.getConumber().substring(repayment.getConumber().length()-6,repayment.getConumber().length()));	
		loanapply.setId(loanapplyId);
		DecimalFormat df=new DecimalFormat("0.00");
		float total=Float.parseFloat(repayment.getTotal());//本次应该还金额
		float ramount=Float.parseFloat(repayment.getRamount()) ;//本次还款金额			
		String nowarrears=df.format(total-ramount) +"";
		if((total-ramount)==0) {			
			loanapply.setAstate("已还款");
			loanManageDao.updateAstate(loanapply);			
		}else {
			loanapply.setAstate("部分还款");
			loanManageDao.updateAstate(loanapply);			
		}
		repayment.setNowarrears(nowarrears);		
		repaymentDao.updateRactualdate(repayment);
	}
	@Override
	public int findPersonalRepaymentRecordCount(PageBean pageBean) {
		int total=repaymentDao.findPersonalRepaymentRecordCount(pageBean);
		return total;
	}
	@Override
	public List<Repayment> findRepaymentRecord(PageBean pageBean) {	
		List<Repayment> list=repaymentDao.findRepaymentRecord(pageBean);
		return list;
	}
	/*
	 * 查询个人某一年的贷款还欠多少
	 */
	@Override
	public Repayment findMinNowarrearsByYearAndPidcard(String ayear, String conumber) {
		Repayment minRepayment=repaymentDao.findMinNowarrearsByYearAndPidcard(ayear,conumber);
		return minRepayment;
	}
	@Override
	public List<Overdue> findAllOverdueInformation(PageBean pageBean) {
		// TODO 自动生成的方法存根
		List<Overdue> list=repaymentDao.findAllOverdueInformation(pageBean);
		return list;
	}
	

}
