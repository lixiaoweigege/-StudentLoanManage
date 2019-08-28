package com.java2019.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.java2019.pojo.Loanapply;
import com.java2019.service.LoanapplyService;
import com.java2019.utils.FileUploadAndDownloandUtils;


@Controller
public class LoanapplyController {
	// 依赖注入
	@Autowired
	private LoanapplyService loanapplyService;
	
	/**
	 * 从数据库获取并回显内容到申请表
	 */
	//设计Map聚合存储需要给页面的对象数据
	private Map<String,Object> result = new HashMap<String,Object>();
	@RequestMapping(value = "/findPersonalAndConloaner.action")
	@ResponseBody
	public Loanapply findPersonalAndConloaner(String user_idcard) {
		System.out.println(user_idcard);
		Loanapply loanapply = loanapplyService.findPersonalAndConloaner(user_idcard);
		String nowyear = new SimpleDateFormat("yyyy").format(Calendar.getInstance().getTime());
		int beginyear = Integer.parseInt(nowyear);
		int endyear = beginyear + 1;
		loanapply.setAyear(beginyear + "—" + endyear + "学年");
		return loanapply;

	}
/**
 * 新增贷款申请
 */
	@RequestMapping(value = "/insertLoanapply.action")
	@ResponseBody
	public Map<String, Object> insertLoanapply(Loanapply loanapply,List<MultipartFile> agrade,
			HttpServletRequest request) {
		
		String pname=loanapply.getPname();
		String pidcard=loanapply.getPidcard();		
		String ayear=loanapply.getAyear();
		FileUploadAndDownloandUtils fileUploadAndDownloandUtils=new FileUploadAndDownloandUtils();		
		Loanapply loanapply1=loanapplyService.findPersonalByPidcardAndAyear(pidcard, ayear);		
		try {
			if(loanapply1==null) {
			fileUploadAndDownloandUtils.handlerFormUpload(pname, agrade, ayear,pidcard, request);
			loanapplyService.insertLoanapply(loanapply);
			result.put("success",true);
			}else {
				result.put("success",false);
				result.put("msg", "您已申请该年的助学贷款，不能重复申请");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
			result.put("msg", e.getMessage());
		}
		return result;
	}
	/**
	 * 查询所有数据，给页面返回json格式数据
	 * easyui的datagrid组件，需要展示数提供json数据： [ {id:1,name:xxx},{id:1,name:xxx} ]
	 */
	@RequestMapping("/loanrecordfindAll.action")
	@ResponseBody  // 用于转换对象为json
	public List<Loanapply> loanrecordfindAll(String pidcard){
		//查询数据
		List<Loanapply> list =loanapplyService.findAll(pidcard);		
		return list;
	}
}
