package com.keepthinker.meerp.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="user")
public class User{
	@Id
	@GeneratedValue
	@Column(name="id")
	private int id;
	@Column(name="user_name")
	private String userName;
	@Column(name="password")
	private String password;
	@Column(name="real_name")
	private String realName;
	@Column(name="phone_number")
	private String phoneNumber;
	@Transient
	private List<Role> roles;
	@Column(name="department")
	private String department;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public List<Role> getRoles() {
		return roles;
	}
	public String getRolesAsString() {
		String rolesString = "";
		for(Role role : roles){
			rolesString += role.getChineseRoleName() + ",";
		}
		rolesString = rolesString.substring(0, rolesString.length()-1);
		return rolesString;
	}
	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", userName=" + userName + ", password="
				+ password + ", realName=" + realName + ", phoneNumber="
				+ phoneNumber + ", roles=" + roles + ", department=" + department
				+ "]";
	}
	
	
}
