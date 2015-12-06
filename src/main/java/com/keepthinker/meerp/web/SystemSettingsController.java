package com.keepthinker.meerp.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keepthinker.meerp.config.SystemConfig;
import com.keepthinker.meerp.service.SystemSettingsService;

@Controller
@RequestMapping("/system-settings")
public class SystemSettingsController {
	
	@Autowired
	private SystemConfig config;
	
	@Autowired 
	SystemSettingsService systemSettingsService;
	
	@RequestMapping(value="/set", method=RequestMethod.POST)
	public @ResponseBody String setSystemProperties(@RequestParam int pageSize, int searchResultSize, boolean hasTrash){
		config.setPageSize(pageSize);
		config.setSearchResultSize(searchResultSize);
		config.setHasTrash(hasTrash);
		config.persist();
		return "2";
	}
	
	@RequestMapping(value="/display", method=RequestMethod.GET)
	public String systemSettingsPage(Model model){
		model.addAttribute("config", config);
		return "system-settings";
	}
	
}
