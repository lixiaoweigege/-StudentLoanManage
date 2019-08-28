package com.java2019.utils;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;
public class FileUploadAndDownloandUtils {
public String handlerFormUpload(String name,List<MultipartFile> uploadfile,
		String ayear,String idcard,HttpServletRequest request) {
		if(!uploadfile.isEmpty() && uploadfile.size()>0) {
		for (MultipartFile file : uploadfile) {
			//获取上传文件的原始名称
			String originalFilename=file.getOriginalFilename();
			//设置上传文件的保存地址目录	String dirpath=request.getServletContext().getRealPath("/gradeFile/");
			String dirpath="C:/Users/23132/Desktop/诚信考试成绩单/";	
			File filepath=new File(dirpath);
			if(!filepath.exists()) {
				filepath.mkdirs();
			}
			//重命名上传的文件名称
			String newFilename = name+"_"+idcard+"_"+ayear+"诚信考试成绩单.png";
			//使用multipartfile接口的方法完成文件上传到指定位置
			try {
				file.transferTo(new File(dirpath+newFilename));
				//打印路径
				//System.out.println(dirpath+newFilename);
			} catch (IOException e) {
				// TODO 自动生成的 catch 块
				return "error";
			}
		}
		return "success";
	}else {
		return "success";
	}
	
}
	/*
	 * 文件下载
	 */
	public ResponseEntity<byte[]> dowbLoad(String filename,HttpServletRequest request) throws IOException {
		//指定下载的文件所在路径request.getContextPath()
		String path="C:/Users/23132/Desktop/诚信考试成绩单/";		
		//创建文件对象
		File file=new File(path+File.separator+filename);
		//对文件名编码。防止中文乱码
		filename=this.getFilename(request,filename);
		//设置响应头
		HttpHeaders headers=new HttpHeaders();
	    // 通知浏览器以下载的方式打开文件
	    headers.setContentDispositionFormData("attachment", filename);
	    // 定义以流的形式下载返回文件数据
    headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	    // 使用Sring MVC框架的ResponseEntity对象封装返回下载数据
   return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
	                                                       headers,HttpStatus.OK);
	
	}
	/**
	 * 根据浏览器的不同进行编码设置，返回编码后的文件名
	 * @throws UnsupportedEncodingException 
	 */
	private String getFilename(HttpServletRequest request, String filename) throws UnsupportedEncodingException {
		  // IE不同版本User-Agent中出现的关键词
	    String[] IEBrowserKeyWords = {"MSIE", "Trident", "Edge"};  
	    // 获取请求头代理信息
	    String userAgent = request.getHeader("User-Agent");  
	    for (String keyWord : IEBrowserKeyWords) { 
	         if (userAgent.contains(keyWord)) { 
	              //IE内核浏览器，统一为UTF-8编码显示
	              return URLEncoder.encode(filename, "UTF-8");
	         }
	    }  
	    //火狐等其它浏览器统一为ISO-8859-1编码显示
	    return new String(filename.getBytes("UTF-8"), "ISO-8859-1");  
	}  
	
}
