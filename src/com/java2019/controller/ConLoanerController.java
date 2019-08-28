package com.java2019.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java2019.pojo.Conloaner;
import com.java2019.service.ConloanerService;
/*
 * 用户控制器类
 */
@Controller
public class ConLoanerController {
	
	//设计Map聚合存储需要给页面的对象数据
		private Map<String,Object> result = new HashMap<String,Object>();
	//依赖注入
		@Autowired
		private ConloanerService conloanService;
	@RequestMapping(value="/findConloanerByuser_idcard.action")
	@ResponseBody
	public Conloaner findConloanerByuser_idcard(String user_idcard) {		
		Conloaner conloaner=this.conloanService.findConloanerByuser_idcard(user_idcard);		
		if(conloaner==null) {
			conloanService.insertConloaner(user_idcard);
		}
		return conloaner;
		
	}
	
	@RequestMapping("/updateConloaner.action")
	@ResponseBody
	public Map<String, Object> updateConloaner(Conloaner conloaner) {		
		try {
			conloanService.updateConloaner(conloaner);
			result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
			result.put("msg", e.getMessage());
		}
		return result;
	}
	
	
	
	
	
}
