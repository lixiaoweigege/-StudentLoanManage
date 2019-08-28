package com.java2019.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java2019.pojo.Overdue;
import com.java2019.pojo.Personal;
import com.java2019.service.PersonalService;
import com.java2019.utils.DateUtil;

/*
 * 个人控制器类
 */
@Controller
public class PersonalController {
	//依赖注入
	@Autowired
	private PersonalService personalService;
	@Autowired
	private DateUtil dateUtil;
	//设计Map聚合存储需要给页面的对象数据
		private Map<String,Object> result = new HashMap<String,Object>();
		@RequestMapping(value="/findPersonalByPIdCard.action")
		@ResponseBody
		public Personal findPersonalByPIdCard(String user_idcard) {
			Personal personal=this.personalService.findPersonalByPIdCard(user_idcard);	
			if(personal==null) {
				personalService.insertPersonal(user_idcard);
			}
			return personal;			
		}
		
		@RequestMapping(value="/upDatePersonal.action")
		@ResponseBody
		public String upDatePersonal(Personal personal) {									
				int rows=personalService.upDatePersonal(personal);
			
				if(rows > 0){					
					return "success";
			        
			    }else{
			        return "false";
			    }
				
		}
		/*
		 * 查看逾期情况
		 */
		
		@RequestMapping("findPersonalOverdueInformation.action")
		@ResponseBody
		public int findPersonalOverdueInformation(String pidcard) throws ParseException {
			List<Overdue> list=personalService.findPersonalOverdueInformation(pidcard);
			int sum=0;
			int nosum=0;
			//比较贷款到期时间和当前时间相差几个月，若值为0，则比较具体的天数21-nowday
			//int mounth=dateUtil.compareMounth(repayment.getGaineddate());
			for (Overdue overdue : list) {
				int mounth=dateUtil.compareMounth(overdue.getCoendyear());	
				String astate=overdue.getAstate();			
				if(mounth>0&&!astate.equals("已还款")) {
					sum++;
				}else if(mounth==0){
					String nowDay = new SimpleDateFormat("dd").format(Calendar.getInstance().getTime());
					int compareDay=Integer.parseInt(nowDay)-21;
					if(compareDay>0&&!astate.equals("已还款")) {
						sum++;
					}else {
						nosum++;
					}
				}else {
					nosum++;
				}
			}			
			return sum;						
	}
		
		
}
