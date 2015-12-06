package com.keepthinker.meerp.config;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;

import com.keepthinker.meerp.entity.Role;
import com.keepthinker.meerp.entity.User;

@Configuration
public class SingletonBean {
	
	/**
	 * 当查找不到用户时，就设置此对象，避免之后处理该信息因null引用而出现不必要的麻烦
	 * @return
	 */
	@Bean
	@Scope("singleton")
	@Qualifier("nullUser")
	public User newNullUser(){
		User user = new User();
		user.setId(0);
		user.setUserName("无");
		user.setPassword("无");
		user.setPhoneNumber("无");
		user.setRealName("无");
		user.setDepartment("无");
		List<Role> roles =  new ArrayList<Role>(1);
		Role role = new Role();
		role.setId(0);
		role.setChineseRoleName("无");
		role.setRoleName("无");
		roles.add(role);
		user.setRoles(roles);
		return user;
	}
}
