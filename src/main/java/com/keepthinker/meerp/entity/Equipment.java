package com.keepthinker.meerp.entity;

import java.util.Calendar;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="equipment")
public class Equipment{
	@Id
	@GeneratedValue()
	private int id;
	@Column(name="serial")
	private String serial;
	@Column(name="cn_name")
	private String chineseName;
	@Column(name="en_name")
	private String englishName;
	@Column(name="description")
	private String description;
	@Column(name="note")
	private String note;
	@Column(name="made_by")
	private String madeBy;
	@Column(name="quantity")
	private int quantity;
	@Column(name="category")
	private String category;
	@Column(name="manufacturer")
	private String manufacturer;
	@Column(name="price")
	private double price;
	@Column(name="mng_level")
	private int managementLevel;
	@Column(name="operator_id")
	private int operatorId;
	@Column(name="director_id")
	private int directorId;
	@Column(name="motion_state")
	private String motionState;
	@Column(name="running_state")
	private String runningState;
	@Column(name="repair_time")
	private long repairTime=0;
	@Column(name="repair_frqc")
	private int repairFrequency=0;
	@Column(name="maintain_time")
	private long maintainTime=0;
	@Column(name="maintain_frqc")
	private int maintainFrequency=0;
	@Column(name="is_deleted")
	private boolean isDeleted=false;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSerial() {
		return serial;
	}
	public void setSerial(String serial) {
		this.serial = serial;
	}
	public String getChineseName() {
		return chineseName;
	}
	public void setChineseName(String chineseName) {
		this.chineseName = chineseName;
	}
	public String getEnglishName() {
		return englishName;
	}
	public void setEnglishName(String englishName) {
		this.englishName = englishName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getMadeBy() {
		return madeBy;
	}
	public void setMadeBy(String madeBy) {
		this.madeBy = madeBy;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getManagementLevel() {
		return managementLevel;
	}
	public void setManagementLevel(int mangementLevel) {
		this.managementLevel = mangementLevel;
	}
	public int getOperatorId() {
		return operatorId;
	}
	public void setOperatorId(int operatorId) {
		this.operatorId = operatorId;
	}
	public int getDirectorId() {
		return directorId;
	}
	public void setDirectorId(int directorId) {
		this.directorId = directorId;
	}
	public String getMotionState() {
		return motionState;
	}
	public void setMotionState(String motionState) {
		this.motionState = motionState;
	}
	public String getRunningState() {
		return runningState;
	}
	public void setRunningState(String runningState) {
		this.runningState = runningState;
	}
	public long getRepairTime() {
		return repairTime;
	}
	public void setRepairTime(long repairTime) {
		this.repairTime = repairTime;
	}
	public int getRepairFrequency() {
		return repairFrequency;
	}
	public void setRepairFrequency(int repairFrequency) {
		this.repairFrequency = repairFrequency;
	}
	public long getMaintainTime() {
		return maintainTime;
	}
	public void setMaintainTime(long maintainTime) {
		this.maintainTime = maintainTime;
	}
	public int getMaintainFrequency() {
		return maintainFrequency;
	}
	public void setMaintainFrequency(int maintainFrequency) {
		this.maintainFrequency = maintainFrequency;
	}
	public boolean isDeleted() {
		return isDeleted;
	}
	public void setDeleted(boolean isDeleted) {
		this.isDeleted = isDeleted;
	}

	@Transient
	private User director;
	@Transient
	private User operator;

	public User getDirector() {
		return director;
	}
	public void setDirector(User director){
		this.director=director;
	}
	public User getOperator() {
		return operator;
	}
	public void setOperator(User operator){
		this.operator=operator;
	}
	@Override
	public String toString() {
		return "Equipment [id=" + id + ", serial=" + serial + ", chineseName="
				+ chineseName + ", englishName=" + englishName
				+ ", description=" + description + ", note=" + note
				+ ", madeBy=" + madeBy + ", quantity=" + quantity
				+ ", category=" + category + ", manufacturer=" + manufacturer
				+ ", managementLevel=" + managementLevel + ", operatorId="
				+ operatorId + ", directorId=" + directorId + ", motionState="
				+ motionState + ", runningState=" + runningState
				+ ", repairTime=" + repairTime + ", repairFrequency="
				+ repairFrequency + ", maintainTime=" + maintainTime
				+ ", maintainFrequency=" + maintainFrequency + ", isDeleted="
				+ isDeleted + ", director=" + director + ", operator="
				+ operator + "]";
	}
	
	public String getRepairChineseDate(){
		return getChineseDate(new Date(repairTime));
	}
	
	public String getMaintainChineseDate(){
		return getChineseDate(new Date(maintainTime));
	}
	
	private String getChineseDate(Date date){
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH)+1;
		int day = calendar.get(Calendar.DAY_OF_MONTH);
		return year+"年"+month+"月"+day+"日";
	}

}
