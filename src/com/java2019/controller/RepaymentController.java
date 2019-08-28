package com.java2019.controller;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java2019.pojo.Auditing;
import com.java2019.pojo.Loanapply;
import com.java2019.pojo.Overdue;
import com.java2019.pojo.PageBean;
import com.java2019.pojo.Repayment;
import com.java2019.service.RepaymentService;
import com.java2019.utils.DateUtil;

@Controller
public class RepaymentController {
	@Autowired
	private RepaymentService repaymentService;
	@Autowired
	private DateUtil dateUtil;
	//设计Map聚合存储需要给页面的对象数据
	private Map<String,Object> result = new HashMap<String,Object>();
	/*
	 * 回显数据到个人还款申请
	 */
	@RequestMapping("/findRepaymentInformation.action")
	@ResponseBody  // 用于转换对象为json
	public List<Repayment> findRepaymentInformation(String pidcard) throws ParseException{
		//查询数据
		String ayear;
		String conumber;
		String total;
		double result;
		Repayment minRepayment;
		DecimalFormat df=new DecimalFormat("0.00");
		List<Repayment> list =repaymentService.findRepaymentInformation(pidcard);
		for (Repayment repayment : list) {
			ayear=repayment.getAyear();
			conumber=repayment.getConumber();			
			minRepayment=repaymentService.findMinNowarrearsByYearAndPidcard(ayear,conumber);
			int overdueMounth=dateUtil.compareMounth(repayment.getCoendyear());
			if(overdueMounth<=0) {
			if(minRepayment==null) {
				int mounth=dateUtil.compareMounth(repayment.getGaineddate());
				float cointerestrate=Float.parseFloat(repayment.getCointerestrate());
				float mount=Float.parseFloat(repayment.getAmount());
				result=Math.pow(1+cointerestrate, mounth/12)* mount;
				total=df.format(result);
			}else {
				int mounth=dateUtil.compareMounth(minRepayment.getRactualdate());				
				float cointerestrate=Float.parseFloat(repayment.getCointerestrate());
				float nowarrears=Float.parseFloat(minRepayment.getNowarrears());
				result=Math.pow(1+cointerestrate, mounth/12)* nowarrears;				
				total=df.format(result);;
			}								
		}else {
			if(minRepayment==null) {
				int mounth=dateUtil.compareMounth(repayment.getGaineddate());
				float cointerestrate=Float.parseFloat(repayment.getCointerestrate());
				float mount=Float.parseFloat(repayment.getAmount());
				result=Math.pow(1+cointerestrate, (mounth-overdueMounth)/12)* mount+
						Math.pow(1+cointerestrate*1.5, (overdueMounth)/12)* mount;
				total=df.format(result);
			}else {
				int mounth=dateUtil.compareMounth(minRepayment.getRactualdate());				
				float cointerestrate=Float.parseFloat(repayment.getCointerestrate());
				float nowarrears=Float.parseFloat(minRepayment.getNowarrears());
				int monuth1=mounth-overdueMounth;
				if(monuth1>0) {
				result=Math.pow(1+cointerestrate, monuth1/12)* nowarrears+
						Math.pow(1+cointerestrate*1.5, overdueMounth/12)* nowarrears;
				}else {
					result=Math.pow(1+cointerestrate*1.5, monuth1/12)* nowarrears;
				}				
				total=df.format(result);;
			}						
		}repayment.setTotal(total);
			}
		return list;
	}
	/*
	 * 添加还款申请
	 */
	@RequestMapping("/addRepayment.action")
	public Map<String, Object> addRepayment(Repayment repayment) {
		
			String rapplydate=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
			repayment.setRapplydate(rapplydate);
			try {
				repaymentService.addRepayment(repayment);
				result.put("success", true);
			} catch (Exception e) {
				e.printStackTrace();
				result.put("success", false);
				result.put("msg", e.getMessage());
			}
			return result;
		}
	/*
	 * 查询所有还款申请与还款记录
	 */
	@RequestMapping("/findAllRepaymentInformation.action")
	@ResponseBody  // 用于转换对象为json
	public Map<String, Object> findAllRepaymentInformation(Integer page,Integer rows,PageBean pageBean){
		
		//封装数据到auditingBean 
		pageBean.setPage(page);
		pageBean.setRows(rows);			
		//查询数据
		List<Repayment> list =repaymentService.findAllRepaymentInformation(pageBean);		
		int total=repaymentService.findRepaymentInformationCount();			
		result.put("total", total);
		result.put("rows", list);
		return result;
	}
	
	/*
	 * 更新扣款日期和欠款金额
	 */
	@RequestMapping("/updateRactualdate.action")
public Map<String, Object> updateRactualdate(Repayment repayment) {			
		try {
			repaymentService.updateRactualdate(repayment);
			result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
			result.put("msg", "保存失败");
		}
		return result;
	}
	/*
	 * 查询显示个人还款记录
	 */
	
	@RequestMapping("/findRepaymentRecord.action")
	@ResponseBody  // 用于转换对象为json
	public Map<String, Object> findRepaymentRecord(Integer page,Integer rows,PageBean pageBean){
		
		//封装数据到auditingBean 
		pageBean.setPage(page);
		pageBean.setRows(rows);			
		//查询数据
		List<Repayment> list =repaymentService.findRepaymentRecord(pageBean);
		
		int total=repaymentService.findPersonalRepaymentRecordCount(pageBean);			
		result.put("total", total);
		result.put("rows", list);
		return result;
	}
	/*
	 * 查询贷款逾期记录
	 */
	@SuppressWarnings("null")
	@RequestMapping("/findAllOverdueInformation.action")
	@ResponseBody  // 用于转换对象为json
	public Map<String, Object> findAllOverdueInformation(Integer page,Integer rows,PageBean pageBean) throws ParseException{		
		//封装数据到auditingBean 
		pageBean.setPage(page);
		pageBean.setRows(rows);			
		//查询数据
		List<Overdue> list =repaymentService.findAllOverdueInformation(pageBean);
		List<Overdue> list2=new ArrayList<>();
		List<Overdue> list3=new ArrayList<>();		
		for (Overdue overdue : list) {
			int mounth=dateUtil.compareMounth(overdue.getCoendyear());	
			String astate=overdue.getAstate();
			String ayear=overdue.getAyear();
			String conumber=overdue.getConumber();
			String nowarrears=null;
			if(mounth>0&&!astate.equals("已还款")) {
				if(astate.equals("部分还款")) {
					Repayment minRepayment=repaymentService.findMinNowarrearsByYearAndPidcard(ayear, conumber);
					nowarrears=minRepayment.getNowarrears();					
				}else {
					nowarrears=overdue.getAmount();					
				}
			}else if(mounth==0){
				String nowDay = new SimpleDateFormat("dd").format(Calendar.getInstance().getTime());
				int compareDay=Integer.parseInt(nowDay)-21;
				if(compareDay>0&&!astate.equals("已还款")) {
					if(astate.equals("部分还款")) {
						Repayment minRepayment=repaymentService.findMinNowarrearsByYearAndPidcard(ayear, conumber);
						nowarrears=minRepayment.getNowarrears();						
					}else {
						nowarrears=overdue.getAmount();						
					}
				}
			}
			overdue.setNowarrears(nowarrears);	
		}
		for (Overdue overdue : list) {
		     if(overdue.getNowarrears()!=null) {
		    	 list2.add(overdue);
		     }
		}		
		int total=list2.size();
		for(int i=pageBean.getStart();i<pageBean.getStart()+pageBean.getRows()&&i<total;i++) {			
			list3.add(list2.get(i));			
		}							
		result.put("total", total);
		result.put("rows", list3);
		return result;
		
	}
	
	
	
	
	
}
