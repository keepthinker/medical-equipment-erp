package com.keepthinker.meerp.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keepthinker.meerp.entity.Equipment;
import com.keepthinker.meerp.entity.User;
import com.keepthinker.meerp.service.EquipmentInfoService;
import com.keepthinker.meerp.utils.EquipmentUtils;
import com.keepthinker.meerp.utils.ShiroSessionUtils;
import com.keepthinker.meerp.web.bean.InputCheckResult;
import com.keepthinker.meerp.web.bean.InputStatus;
import com.keepthinker.meerp.web.bean.ResponseResult;
import com.keepthinker.meerp.web.bean.ResponseStatus;

@Controller
@RequestMapping("/equipments")
public class EquipmentController {

	@Autowired
	private EquipmentInfoService equipmentInfoService;

	/**
	 * 添加一个equipment实体到数据库中
	 * @param Equipment类型的equipment参数，Spring MVC框架自动把来自系统外的Json格式的字符数据转化成Equipment类型的对象
	 * @return 返回提示提示信息
	 */
	@RequestMapping(value="/equipment/add", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE + ";charset=utf-8")
	public @ResponseBody ResponseResult addEquipment(@RequestBody Equipment equipment){
		InputCheckResult inpResult = EquipmentUtils.checkIsValid(equipment);
		ResponseResult resResult = new ResponseResult();
		if(inpResult.getStatus()==InputStatus.VALID){
			int num = equipmentInfoService.addEquipmentInfo(equipment);
			if(num==1){
				resResult.setStatus(ResponseStatus.SUCCESS);
			}else{
				resResult.setStatus(ResponseStatus.FAILURE);
			}
			resResult.setOther(Integer.toString(num));
		}else{
			resResult.setStatus(ResponseStatus.FAILURE);
		}
		resResult.setInputCheckResult(inpResult);
		return resResult;
	}

	/**
	 * 删除数据库中一个equipment实体
	 * @param equipmentId
	 * @return 返回删除设备信息的个数，这个函数只删除一个设备信息，所以修改成功则返回1，失败为0
	 */
	@RequestMapping(value="/equipment/delete/{equipmentId}", method=RequestMethod.DELETE)
	public @ResponseBody String deleteEquipment(@PathVariable int equipmentId){
		int num = equipmentInfoService.deleteEquipmentInfo(equipmentId);
		return Integer.toString(num);
	}

	/**
	 * 显示单个设备详细信息
	 * @param id
	 * @return 跳转到展示该设备的详细信息的页面
	 */
	@RequestMapping(value="/equipment/display/{id}", method=RequestMethod.GET)
	public String displayEquipment(@PathVariable int id, Model model){
		Equipment equ = equipmentInfoService.getEquipmentInfoById(id);
		if(equ == null){
			return "redirect:" + "/static/unauthorized.html";
		}
		model.addAttribute("equipment", equ);
		return "equipment/equipment";
	}

	/**
	 * 根据登录人员角色，来显示相应信息<br/>
	 * 默认一页显示20条设备信息<br/>
	 * @return json 数组，数组元素为各个设备信息对象,[{...},{...},{...}...]
	 */
	@RequestMapping(value="/get/{pageNumber}",method=RequestMethod.GET, produces="application/json;charset=utf-8")
	public @ResponseBody List<Equipment> getEquipments(@PathVariable int pageNumber){

		if(SecurityUtils.getSubject().hasRole("administrator")
				||SecurityUtils.getSubject().hasRole("president")
				||SecurityUtils.getSubject().hasRole("equ_dep_person")){

			return equipmentInfoService.getEquipmentInfosByPageNumber(pageNumber);
		}else if(SecurityUtils.getSubject().hasRole("director")){

			User user = (User)ShiroSessionUtils.getSessionAttribute("currentUser");
			List<Equipment> equs = equipmentInfoService.getEquipmentInfosByDirectorId(user.getId(), pageNumber);
			return EquipmentUtils.jsonArrayPerceived(equs);
		}else if(SecurityUtils.getSubject().hasRole("operator")){

			User user = (User)ShiroSessionUtils.getSessionAttribute("currentUser");
			List<Equipment> equs = equipmentInfoService.getEquipmentInfosByOperatorId(user.getId(), pageNumber);
			return EquipmentUtils.jsonArrayPerceived(equs);
		}
		return new ArrayList<Equipment>(0);
	}


	/**
	 * 
	 * @param body 是一个Json对象，格式为{"equipmentId":"${value}","key":"${value}"}
	 * @return 返回修改属性的个数，这个函数只修改一个属性值，所以修改成功则返回1，失败为0
	 */
	@RequestMapping(value="/equipment/modify-page/{equipmentId}", method=RequestMethod.GET)
	public String modifyEquipmentPage(@PathVariable int equipmentId, Model model){
		Equipment equipment = equipmentInfoService.getEquipmentInfoById(equipmentId);
		model.addAttribute("equipment", equipment);
		return "equipment/modify-equipment";
	}

	/**
	 * 修改数据库中equipment实体的一个属性<br/>
	 * 先判断key为equipment的某一个属性，然后修改对应属性值
	 * @param body 是一个Json对象，格式为{"equipmentId":"${value}","key":"${value}"}
	 * @return 返回修改属性的个数，这个函数只修改一个属性值，所以修改成功则返回1，失败为0
	 */
	@RequestMapping(value="/equipment/modify-properties/{equipmentId}", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String modifyEquipmentProperties(@PathVariable int equipmentId, @RequestBody String propertiesJson){
		if(propertiesJson.trim().length()<3){//无修改
			return "0";
		}
		Map<String, Object> map;
		try {
			map = EquipmentUtils.convertJsonToMap(propertiesJson);
		} catch (IOException e) {
			return "0";
		}
		if(map != null){
			int num = equipmentInfoService.modifyEquipmentInfos(equipmentId, map);
			return Integer.toString(num);
		}else{
			return "0";
		}
	}
	@RequestMapping(value="/search/{property}/{value}", method=RequestMethod.GET, produces=MediaType.APPLICATION_JSON_VALUE + ";charset=utf-8")
	public @ResponseBody List<Equipment> search(@PathVariable String property, @PathVariable String value){
		Object valueTyped = value;
		try {
			valueTyped = EquipmentUtils.parseToTypedValue(property, value);
		} catch (Exception e) {
			e.printStackTrace();
			return new ArrayList<Equipment>(0);
		}
		List<Equipment> equipments = equipmentInfoService.search(property, valueTyped);
		return EquipmentUtils.jsonArrayPerceived(equipments);
	}
}

