package com.java2019.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.java2019.pojo.Auditing;
import com.java2019.pojo.Conloaner;
import com.java2019.pojo.Contract;
import com.java2019.pojo.Loanapply;
import com.java2019.pojo.PageBean;
import com.java2019.pojo.Personal;
import com.java2019.service.ConloanerService;
import com.java2019.service.LoanManageService;
import com.java2019.service.PersonalService;
import com.java2019.utils.FileUploadAndDownloandUtils;

@Controller
public class LoanManageController {
	// 依赖注入
		@Autowired
		private LoanManageService loanManageService;
		@Autowired
		private PersonalService personalService;
		@Autowired
		private ConloanerService conloanService;
		//设计Map聚合存储需要给页面的对象数据
		private Map<String,Object> result = new HashMap<String,Object>();
		
		@RequestMapping("/findAllLoanApply.action")
		@ResponseBody  // 用于转换对象为json
		public Map<String, Object> findAllLoanApply(Integer page,Integer rows,Auditing auditing){
			
			//封装数据到auditingBean 
			auditing.setPage(page);
			auditing.setRows(rows);			
			//查询数据
			List<Loanapply> list =loanManageService.findAllLoanApply(auditing);
			int total=loanManageService.findLoanApplyCount();			
			result.put("total", total);
			result.put("rows", list);
			return result;
		}
		/*
		 * 下载诚信考试成绩单
		 */
		@RequestMapping("/findGradeFile.action")
	public ResponseEntity<byte[]> findGradeFile(String pname,String pidcard,String ayear,HttpServletRequest request) throws IOException {
			String filename=pname+"_"+pidcard+"_"+ayear+"诚信考试成绩单.png";
			ResponseEntity<byte[]> f;
			FileUploadAndDownloandUtils fileUploadAndDownloandUtils=new FileUploadAndDownloandUtils();
			try {
			 f=fileUploadAndDownloandUtils.dowbLoad(filename, request);
			} catch (IOException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
				 f=fileUploadAndDownloandUtils.dowbLoad("诚信考试成绩单.png", request);
			}
			return 	f;			
		}
	/*
	 * 更新审核信息或贷款发放确认信息
	 */
	@RequestMapping("/updateAstate.action")
public Map<String, Object> updateAstate(Loanapply loanapply) {
		
		try {
			loanManageService.updateAstate(loanapply);
			result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
			result.put("msg", e.getMessage());
		}
		return result;
	}
	
	/**
	 * 从数据库获取并回显内容到贷款合同
	 */
	
	@RequestMapping(value = "/findPersonalAndConloanerById.action")
	@ResponseBody
	public Loanapply findPersonalAndConloanerById(String id) {
		Loanapply loanapply = loanManageService.findPersonalAndConloanerById(id);
		/*String nowyear = new SimpleDateFormat("yyyy").format(Calendar.getInstance().getTime());
		int beginyear = Integer.parseInt(nowyear);
		int endyear = beginyear + 1;
		loanapply.setAyear(beginyear + "—" + endyear + "学年");*/
		
		return loanapply;

	}
	/**
	 * 新增合同
	 */
		@RequestMapping(value = "/addContract.action")
		@ResponseBody
		public Map<String, Object> addContract(Contract contract,int id) {
			String coendyear= contract.getCoendyear()+"-09-20";
			contract.setCoendyear(coendyear);
			Loanapply loanapply=new Loanapply();
			contract.setId(id);
			try {
				loanapply.setId(id);
			loanapply.setAstate("合同已签");			
			loanManageService.updateAstate(loanapply);
				loanManageService.addContract(contract);
				result.put("success",true);									
			} catch (Exception e) {
				e.printStackTrace();
				result.put("success", false);
				result.put("msg", e.getMessage());
			}							
			return result;
		}
		/*
		 * 查询所有贷款记录
		 */
		
		@RequestMapping("/findAllLoanRecord.action")
		@ResponseBody  // 用于转换对象为json
		public Map<String, Object> findAllLoanRecord(Integer page,Integer rows,PageBean pageBean){
			
			//封装数据到auditingBean 
			pageBean.setPage(page);
			pageBean.setRows(rows);			
			//查询数据
			List<Contract> list =loanManageService.findAllLoanRecord(pageBean);
			int total=loanManageService.findContractCount();			
			result.put("total", total);
			result.put("rows", list);
			return result;
		}
		
		/**
		 * 删除数据
		 */
		@RequestMapping("/deleteContract.action")
		@ResponseBody
		public Map<String,Object> deleteContract(Integer[] id){
			try {
				loanManageService.deleteContract(id);
				result.put("success", true);
			} catch (Exception e) {
				e.printStackTrace();
				result.put("success", false);
				result.put("msg", e.getMessage());
			}
			return result;
		}
		@RequestMapping(value="/loanmanage/findPersonalByPIdCard.action")
		@ResponseBody
		public Personal findPersonalByPIdCard(String user_idcard) {
			Personal personal=this.personalService.findPersonalByPIdCard(user_idcard);	
			return personal;			
		}
		
	@RequestMapping(value="/loanmanage/findConloanerByuser_idcard.action")
	@ResponseBody
	public Conloaner findConloanerByuser_idcard(String user_idcard) {		
		Conloaner conloaner=this.conloanService.findConloanerByuser_idcard(user_idcard);		
		return conloaner;
		
	}
}
