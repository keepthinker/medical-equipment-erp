package com.keepthinker.meerp.web;

import java.util.List;

import javax.servlet.ServletContext;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keepthinker.meerp.entity.Equipment;
import com.keepthinker.meerp.entity.User;
import com.keepthinker.meerp.service.DataExportService;
import com.keepthinker.meerp.service.EquipmentInfoService;
import com.keepthinker.meerp.service.UserInfoService;
import com.keepthinker.meerp.utils.ShiroSessionUtils;

@Controller
@RequestMapping("/export")
public class ExportController {
	
	@Autowired
	private ServletContext context;

	@Autowired
	private UserInfoService userInfoService;

	@Autowired
	private DataExportService dataExportService;

	@Autowired
	private EquipmentInfoService equipmentInfoService;

	@RequestMapping(value="/page", method = RequestMethod.GET)
	public String exportPage(){
		return "export-page";
	}
	
	/**
	 * 根据设备类型，来决定导出设备数据
	 * @return
	 */
	@RequestMapping(value="/equipments", method=RequestMethod.GET)
	public @ResponseBody String exportEquipments(){
		List<Equipment> equipments=null;
		if(SecurityUtils.getSubject().hasRole("administrator")
				||SecurityUtils.getSubject().hasRole("president")
				||SecurityUtils.getSubject().hasRole("equ_dep_person")){
			equipments= equipmentInfoService.getAllEquipments();
		}else if(SecurityUtils.getSubject().hasRole("director")){

			User user = (User)ShiroSessionUtils.getSessionAttribute("currentUser");
			equipments = equipmentInfoService.getEquipmentInfosByDirectorId(user.getId());
		}else if(SecurityUtils.getSubject().hasRole("operator")){

			User user = (User)ShiroSessionUtils.getSessionAttribute("currentUser");
			equipments = equipmentInfoService.getEquipmentInfosByOperatorId(user.getId());
		}
		if(equipments == null||equipments.size()==0){
			return "0";
		}
		return context.getContextPath()+"/resources/export/"+ dataExportService.exportEquipmentsToExcel(equipments);
	}
	
	/**
	 * 根据用户类型，来决定导出用户数据
	 * @return
	 */
	@RequestMapping(value="/users", method=RequestMethod.GET)
	public @ResponseBody String exportUsers(){
		List<User> users=null;
		if(SecurityUtils.getSubject().hasRole("administrator")
				||SecurityUtils.getSubject().hasRole("president")){
			users = userInfoService.getAllUsersInfos();
		}else if(SecurityUtils.getSubject().hasRole("director")){
			User user = (User)ShiroSessionUtils.getSessionAttribute("currentUser");
			if(user == null){
				ShiroSessionUtils.getSessionAttribute("currentUser");
			}
			users = userInfoService.getUserInfosByDepartment(user.getDepartment());
		}
		if(users == null||users.size()==0){
			return "0";
		}
		return context.getContextPath()+"/resources/export/" + dataExportService.exportUsersToExcel(users);
	}	
}
