package com.keepthinker.meerp.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.keepthinker.meerp.config.SystemConfig;
import com.keepthinker.meerp.entity.User;
import com.keepthinker.meerp.service.UserInfoService;
import com.keepthinker.meerp.utils.ShiroSessionUtils;

@Controller
public class GeneralController {

	@Autowired
	private UserInfoService userInfoService;

	@Autowired
	private SystemConfig config;
	
	@RequestMapping(value="/homepage", method = RequestMethod.GET)
	public String homepage(Model model){
		model.addAttribute("config", config);
		ShiroSessionUtils.getSession().setTimeout(86400000);//24小时
		setShiroSessionAttrbute();
		return "homepage";
	}

	private void setShiroSessionAttrbute(){
		if(ShiroSessionUtils.getSessionAttribute("currentUserId")==null){
			int userId=userInfoService.getUserIdByUserName(ShiroSessionUtils.getCurrentUserName());
			ShiroSessionUtils.setSessionAttribute("currentUserId", userId);
		}
		if(ShiroSessionUtils.getSessionAttribute("currentUser")==null){
			int userId = (int) ShiroSessionUtils.getSessionAttribute("currentUserId");
			User user = userInfoService.getUserInfoById(userId);
			ShiroSessionUtils.setSessionAttribute("currentUser", user);
		}
	}

}
