package com.java2019.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java2019.pojo.User;
import com.java2019.service.UserService;
import com.java2019.utils.VerifyCode;

/*
 * 用户控制器类
 */
@Controller
public class UserController {
//依赖注入
	@Autowired
	private UserService userService;
	//设计Map聚合存储需要给页面的对象数据
		private Map<String,String> result = new HashMap<String,String>();
	/*
	 * 用户注册验证
	 */	
	//用户名验证
	@RequestMapping(value="/checkUserName.action",method=RequestMethod.POST)
	public void checkUserName(String username,HttpServletResponse response) throws IOException {
		System.out.println(username);
		User user=userService.findUserName(username);
		response.setContentType("text/html);charset=utf-8");
		if(user!=null) {
			response.getWriter().println("1");
		}else {
			response.getWriter().println("0");
		}
		}
	//身份证号验证
		@RequestMapping(value="/checkUserIdCard.action",method=RequestMethod.POST)
		public void checkUserIdCard(String useridcard,HttpServletResponse response) throws IOException {
			System.out.println(useridcard);
			User user=userService.findUserIdCard(useridcard);
			response.setContentType("text/html);charset=utf-8");
			if(user!=null) {
				response.getWriter().println("1");
			}else {
				response.getWriter().println("0");
			}
			}
	
	/*
	 * 用户注册	
	 */
		@RequestMapping(value="/register.action",method=RequestMethod.POST)
		public String register(User user,Model model) {
			userService.registerUser(user);
			model.addAttribute("msg", "注册成功");
	         // 返回到登录页面
			return "login";
		}	
	/*
	 * 用户登录
	 */
	@RequestMapping(value="/login.action")
	public String login(String username,String password,String userCode ,Model model,HttpServletRequest request,HttpSession session) {
		//通过账号和密码查询用户
		User user=userService.findUser(username, password);
		String serverCode=(String) session.getAttribute("checkcode_session");
		if(user== null){
			model.addAttribute("msg", "账号或密码错误，请重新输入！");
	         // 返回到登录页面
			return "login";
		
		}if(!serverCode.equalsIgnoreCase(userCode)) {
			model.addAttribute("msg", "验证码错误");
			return "login";
		}else {					
			// 将用户对象添加到Session
			session.setAttribute("usersession", user);
			// 跳转到主页面
			if(user.getUser_state().equals("学生")) {
			return "main";
			}
			if (user.getUser_state().equals("管理员")){
				return "loanmanage";
			}
			if (user.getUser_state().equals("操作员")){
				return "bankmanage";
			}else {
				return "main";
			}
		}
	}
	
	/**
	 * 退出登录
	 */
	@RequestMapping(value = "/logout.action")
	public String logout(HttpSession session) {
	    // 清除Session
	    session.invalidate();
	    // 重定向到登录页面的跳转方法
	    return "redirect:login.action";
	}
	/*
	 * 响应ajax请求把用户，把身份证号回显
	 */
	@ResponseBody
	@RequestMapping("/findUserIdCardList.action")
	public List<User> findtUserIdCardList() {
		List<User> userList=userService.findtUserIdCardList();							
		int user_id=1;
		for (User user : userList) {			
			user.setUser_id(user_id);
			user_id+=1;
		}
		
		return  userList;	  
	}
	/*
	 * 设置权限
	 */
	@RequestMapping(value = "/authoritySet.action",method=RequestMethod.POST)
	public String authority(String user_idcard,String user_state) {		
		userService.updateUserState(user_idcard,user_state);
	    return "success";
	}
	/*
	 * 修改密码
	 */
	@RequestMapping(value = "/systemSet.action",method=RequestMethod.POST)
	public String systemSet(HttpSession session,String user_name,String user_email,String user_password,String user_idcard) {		
		userService.updatePersonal(user_name,user_email,user_password,user_idcard);
		// 清除Session
	   
	    return "success";
	}
	/**
	 * 验证码控制器
	 * @throws IOException 
	 */
	@RequestMapping("imageCode.action")
	public void imageCode(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException{
		response.setContentType("image/jpeg;utf-8");
		VerifyCode code = new VerifyCode();
		BufferedImage image = code.createImage();
		String str=code.getText();
		// 将验证码内容保存session
		session.setAttribute("checkcode_session", str);			
		ImageIO.write(image,"jpg",response.getOutputStream());
		
		}
		
}
