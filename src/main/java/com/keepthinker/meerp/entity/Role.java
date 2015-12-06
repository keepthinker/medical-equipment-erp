package com.keepthinker.meerp.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="role")
public class Role {
	@Id
	@GeneratedValue
	private int id;
	@Column(name="role_name")
	private String roleName;
	@Column(name="cn_role_name")
	private String chineseRoleName;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getChineseRoleName() {
		return chineseRoleName;
	}
	public void setChineseRoleName(String chineseRoleName) {
		this.chineseRoleName = chineseRoleName;
	}
	@Override
	public String toString() {
		return "Role [id=" + id + ", roleName=" + roleName
				+ ", chineseRoleName=" + chineseRoleName + "]";
	}
	/**
	 * 因为Role来自数据库，id为区分不同role对象的标示符，所以比较时仅需判断id是否相等
	 */
	@Override
	public boolean equals(Object o){
		if(o.getClass()!=this.getClass()){
			return false;
		}
		if(this.id==((Role)o).getId()){
			return true;
		}else{
			return false;
		}
		
	}
	
}
