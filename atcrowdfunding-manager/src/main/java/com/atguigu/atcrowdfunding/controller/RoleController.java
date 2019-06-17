package com.atguigu.atcrowdfunding.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.atcrowdfunding.bean.AJAXResult;
import com.atguigu.atcrowdfunding.bean.Page;
import com.atguigu.atcrowdfunding.bean.Role;
import com.atguigu.atcrowdfunding.service.RoleService;

@Controller
@RequestMapping("/role")
public class RoleController {

	@Autowired
	private RoleService roleService;

	@ResponseBody
	@RequestMapping("/pageQuery")
	public Object pageQuery(String queryText,Integer pageno,Integer pagesize) {
		
		AJAXResult result = new AJAXResult();
		
		try {
			
			// 分页查询
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", (pageno-1)*pagesize);
			map.put("size", pagesize);
			map.put("queryText", queryText);
			
			List<Role> roles = roleService.pageQueryData( map );
			// 当前页码
			// 总的数据条数
			int totalsize = roleService.pageQueryCount( map );
			// 最大页码（总页码）
			int totalno = 0;
			if ( totalsize % pagesize == 0 ) {
				totalno = totalsize / pagesize;
			} else {
				totalno = totalsize / pagesize + 1;
			}
			
			//分页对象
			Page<Role> rolePage = new Page<Role>();
			rolePage.setDatas(roles);
			rolePage.setTotalno(totalno);
			rolePage.setTotalsize(totalsize);
			rolePage.setPageno(pageno);
			
			result.setData(rolePage);
			result.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		
		return result;
		
	}
	
	@ResponseBody
	@RequestMapping("/doAssign")
	public Object doAssign( Integer roleid, Integer[] permissionids ) {
		AJAXResult result = new AJAXResult();
		
		try {
			
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("roleid", roleid);
			paramMap.put("permissionids", permissionids);
			roleService.insertRolePermission(paramMap);
			
			result.setSuccess(true);
		} catch ( Exception e ) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		
		return result;
	}
	
	@RequestMapping("/role")
	public String role() {
		return "role/role";
	}
	
	
	@RequestMapping("/role2")
	public String role2( @RequestParam(required=false, defaultValue="1")Integer pageno, @RequestParam(required=false, defaultValue="2")Integer pagesize, Model model ) {
		
		// 分页查询
		// limit start, size
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", (pageno-1)*pagesize);
		map.put("size", pagesize);
		
		List<Role> roles = roleService.pageQueryData( map );
		model.addAttribute("roles", roles);
		// 当前页码
		model.addAttribute("pageno", pageno);
		
		// 总的数据条数
		int totalsize = roleService.pageQueryCount( map );
		// 最大页码（总页码）
		int totalno = 0;
		if ( totalsize % pagesize == 0 ) {
			totalno = totalsize / pagesize;
		} else {
			totalno = totalsize / pagesize + 1;
		}
		model.addAttribute("totalno", totalno);

		return "role/role";
		
	}
	@RequestMapping("/assign")
	public String assign() {
		return "role/assign";
	}
	


}
