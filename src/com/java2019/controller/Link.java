package com.java2019.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Link {
	@RequestMapping("/apply.action")
	public String applyaction() {
		return "apply";
	}	
	@RequestMapping("/register.action")
	public String register() {
		return "register";
	}	
	@RequestMapping("/personal.action")
	public String personal() {
		return "personal";
	}		
	@RequestMapping("/applyhelp.action")
	public String applyhelp() {
		return "applyhelp";
	}
	@RequestMapping("/loanrecord.action")
	public String loanrecord() {
		return "loanrecord";
	}
	@RequestMapping("/repayment.action")
	public String repayment() {
		return "repayment";
	}
	
	@RequestMapping("/repaymentrecord.action")
	public String repaymentrecord() {
		return "repaymentrecord";
	}
	@RequestMapping("/conloaner.action")
	public String conloaner() {
		return "conloaner";
	}
	@RequestMapping("/loanapply.action")
	public String loadapply() {
		return "loanapply";
	}
	/*
	 * 管理员界面
	 */	
	@RequestMapping("/auditing.action")
	public String auditing() {
		return "auditing";
	}
	@RequestMapping("/gradeFile.action")
	public String gradeFile() {
		return "gradeFile";
	}
	
	@RequestMapping("/contract.action")
	public String contract() {
		return "contract";
	}
	@RequestMapping("/allloanrecord.action")
	public String allloanrecord() {
		return "allloanrecord";
	}
	
	@RequestMapping("/openContract.action")
	public String openContract(String id,String pidcard,String ayear,String aterm,Model model) {
		String a=pidcard.substring(0, 6)+ayear.substring(0, 4);
		String b=Integer.parseInt(id)+10000000+"";
		String c=a+b.substring(1, b.length());
		String coendyear=Integer.parseInt(ayear.substring(0, 4))+Integer.parseInt(aterm)+"";
		model.addAttribute("msg",id);
		model.addAttribute("msg2",c);
		model.addAttribute("coendyear",coendyear);
		return "contract";
	}
	
	@RequestMapping("/allStudent.action")
	public String allStudent() {			
		return "allstudent";
	}
	@RequestMapping("/authority.action")
	public String authority() {
		
		return "authority";
	}
	
	@RequestMapping("/systemset.action")
	public String systemset() {
		
		return "systemset";
	}
	/*
	 * 银行管理界面
	 */
	
	@RequestMapping("/loangrant.action")
	public String loangrant() {
		
		return "loangrant";
	}
	@RequestMapping("/authority2.action")
	public String authority2() {
		
		return "authority2";
	}
	
	@RequestMapping("/repayment2.action")
	public String repayment2() {
		
		return "repayment2";
	}
	
	@RequestMapping("/overduerecord.action")
	public String overduerecord() {
		
		return "overduerecord";
	}
}
