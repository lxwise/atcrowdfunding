package com.atguigu.atcrowdfunding.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.atcrowdfunding.bean.User;
import com.atguigu.atcrowdfunding.service.UserService;

@Controller
@RequestMapping("/test")
public class TestController {
	@Autowired
	private UserService userService;
	//查询所有显示页面
	@ResponseBody
	@RequestMapping("/queryAll")
	public Object queryAll() {
		List<User> users = userService.queryAll();
		System.out.println(users.size());
		return users;
	}
	
	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	@ResponseBody//对象转换
	@RequestMapping("/json")
	public Object json() {
		Map map = new HashMap();//转字符串
		map.put("username", "zhangsan");
		return map;
	}	
}
