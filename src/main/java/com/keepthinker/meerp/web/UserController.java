package com.keepthinker.meerp.web;

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

import com.keepthinker.meerp.entity.Role;
import com.keepthinker.meerp.entity.User;
import com.keepthinker.meerp.service.UserInfoService;
import com.keepthinker.meerp.utils.ShiroSessionUtils;
import com.keepthinker.meerp.utils.UserUtils;
import com.keepthinker.meerp.web.bean.InputCheckResult;
import com.keepthinker.meerp.web.bean.InputStatus;
import com.keepthinker.meerp.web.bean.KeyValue;
import com.keepthinker.meerp.web.bean.ResponseResult;
import com.keepthinker.meerp.web.bean.ResponseStatus;

@Controller
@RequestMapping("/users")
public class UserController {

	@Autowired 
	UserInfoService userInfoService;

	@RequestMapping(value = "/user/account-settings/", method = RequestMethod.GET)
	public String accountSettings(Model model){
		User user =  (User)ShiroSessionUtils.getSessionAttribute("currentUser");
		model.addAttribute("user", user);
		return "user/account-settings";
	}

	/**
	 * 添加一个user对象到数据库中
	 * @param body 是一个Json对象, 格式的{"userName":"${value}","password":"${value}" ...}
	 * @return 返回添加user的个数，这个函数只添加一个user，所以添加成功则返回1，失败为0
	 */
	@RequestMapping(value="/user/add", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseResult addAUser(@RequestBody User user){
		InputCheckResult inpResult = UserUtils.checkIsValid(user);
		ResponseResult resResult = new ResponseResult();
		if(inpResult.getStatus()==InputStatus.VALID){
			int num = userInfoService.addUserInfo(user);
			if(num > 0){
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


	@RequestMapping(value = "/user/add-page", method = RequestMethod.GET)
	public String addPage(Model model){
		List<Role> roles = userInfoService.getUserRoles();
		model.addAttribute("roles", roles);
		return "user/add-user";
	}

	/**
	 * 删除数据库中一个user
	 * @param user_id
	 * @return 返回删除user的个数，这个函数只删除一个user，所以删除成功则返回1，失败为0
	 */
	@RequestMapping(value = "/user/delete/{userId}", method = RequestMethod.DELETE)
	public @ResponseBody String deleteUser(@PathVariable int userId){
		int num = userInfoService.deleteUserInfo(userId);
		return Integer.toString(num);
	}
	/**
	 * 登录人员角色判断来显示相应信息<br/>
	 * 默认一页显示20条用户信息，密码是假的<br/>
	 * @return json 数组，数组元素为各个设备信息对象，[{"userName":"${value}","password","${value}",{...}}]
	 */
	@RequestMapping(value = "/get/{pageNumber}", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public @ResponseBody List<User> getUsers(@PathVariable int pageNumber){
		if(SecurityUtils.getSubject().hasRole("administrator")
				||SecurityUtils.getSubject().hasRole("president")){
			
			List<User> users = userInfoService.getUserInfosByPageNumber(pageNumber);
			return UserUtils.jsonArrayPerceived(users);
		}else if(SecurityUtils.getSubject().hasRole("director")){
			
			User user = (User)ShiroSessionUtils.getSessionAttribute("currentUser");
			List<User> users = userInfoService.getUserInfosByDepartment(user.getDepartment(), pageNumber);
			return UserUtils.jsonArrayPerceived(users);
		}else{
			return new ArrayList<User>(0);
		}
	}
	
	/**
	 * 修改数据库中user实体的一个属性
	 * @param body 是一个Json对象，格式为{"${key}":"${value}"}
	 * @return 返回修改属性的个数，这个函数只修改一个属性值，所以修改成功则返回1，失败为0
	 */
	@RequestMapping(value = "/user/modify-account", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String modifyAUserAccount(@RequestBody String body){
		int userId = (Integer)ShiroSessionUtils.getSessionAttribute("currentUserId");
		return modifyAUserProperty(userId, body);
	}

	/**
	 * 修改数据库中user实体的一个属性
	 * @param body 是一个Json对象，格式为{"${key}":"${value}","${key1}":"${value1}"}
	 * @return 返回修改属性的个数，这个函数只修改一个属性值，所以修改成功则返回1，失败为0
	 */
	@RequestMapping(value = "/user/modify-properties/{userId}", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String modifyAUserProperties(@PathVariable int userId, @RequestBody String body){

		Map<String, Object> map = UserUtils.convertJsonToMap(body);
		if(map != null){
			int num = userInfoService.modifyUserInfo(userId, map);
			return Integer.toString(num);
		}else{
			return "0";
		}
	}

	/**
	 * 修改数据库中user实体的一个属性
	 * @param body 是一个Json对象，格式为{"${key}":"${value}"}
	 * @return 返回修改属性的个数，这个函数只修改一个属性值，所以修改成功则返回1，失败为0
	 */
	@RequestMapping(value = "/user/modify-property/{userId}", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String modifyAUserProperty(@PathVariable int userId, @RequestBody String body){

		KeyValue keyvalue = UserUtils.convertJsonToKeyValue(body);
		if(keyvalue != null){
			int num = userInfoService.modifyUserInfo(userId, keyvalue.getKey(), keyvalue.getValue());
			return Integer.toString(num);
		}else{
			return "0";
		}
	}

	@RequestMapping(value = "/user/modify-page/{userId}", method = RequestMethod.GET)
	public String modifyPage(@PathVariable int userId, Model model){

		User user = userInfoService.getUserInfoById(userId);
		model.addAttribute("user", user);

		List<Role> roles = userInfoService.getUserRoles();
		model.addAttribute("roles", roles);
		return "user/modify-user";
	}
	
	@RequestMapping(value="/search/{property}/{value}", method=RequestMethod.GET, produces=MediaType.APPLICATION_JSON_VALUE + ";charset=utf-8")
	public @ResponseBody List<User> search(@PathVariable String property, @PathVariable String value){
		Object valueTyped = value;
		try {
			valueTyped = UserUtils.parseToTypedValue(property, value);
		} catch (Exception e) {
			e.printStackTrace();
			return new ArrayList<User>(0);
		}
		List<User> users = userInfoService.search(property, valueTyped);
		return UserUtils.jsonArrayPerceived(users);
	}
}
