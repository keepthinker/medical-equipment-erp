package com.keepthinker.meerp.config;

import java.util.Properties;

import com.keepthinker.meerp.utils.LocalFileUtils;

/**
 *  默认：<br/>
 *  展示的页面一页为 20个单位<br/>
 *  搜索的页面最多为 30个单位<br/>
 *  resources/export文件夹里的过期文件清理时间间隔  = 1*60*60*1000毫秒 即 1个小时<br/>
 *  resources/export文件夹里的文件有效时间 = 2*60*60*1000毫秒 即 2个小时
 *  @author keepthinker
 */
public class SystemConfig {
	
	private int pageSize;
	private int searchResultSize;
	/**
	 * 毫秒
	 */
	private int fileCleanInterval;
	private int durationOfExpiredTime;
	private boolean hasTrash;
	
	public SystemConfig() {	
		this.pageSize = 20;
		this.searchResultSize=30;
		this.fileCleanInterval  = 1*60*60*1000;
		this.durationOfExpiredTime = 2*60*60*1000;
		this.hasTrash = false;
	}

	public SystemConfig(int pageSize, int searchResultSize, int fileCleanInterval,
			int durationOfExpiredTime, boolean hasTrash) {
		super();
		this.pageSize = pageSize;
		this.searchResultSize = searchResultSize;
		this.fileCleanInterval = fileCleanInterval;
		this.durationOfExpiredTime = durationOfExpiredTime;
		this.hasTrash = hasTrash;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getFileCleanInterval() {
		return fileCleanInterval;
	}

	public void setFileCleanInterval(int fileCleanInterval) {
		this.fileCleanInterval = fileCleanInterval;
	}

	public int getDurationOfExpiredTime() {
		return durationOfExpiredTime;
	}

	public void setDurationOfExpiredTime(int durationOfExpiredTime) {
		this.durationOfExpiredTime = durationOfExpiredTime;
	}

	public boolean isHasTrash() {
		return hasTrash;
	}

	public void setHasTrash(boolean hasTrash) {
		this.hasTrash = hasTrash;
	}
	
	public int getSearchResultSize() {
		return searchResultSize;
	}

	public void setSearchResultSize(int searchResultSize) {
		this.searchResultSize = searchResultSize;
	}

	public void persist(){
		Properties pro = new Properties();
		pro.put("pageSize", String.valueOf(this.pageSize));
		pro.put("searchResultSize", String.valueOf(this.searchResultSize));
		pro.put("fileCleanInterval", String.valueOf(this.fileCleanInterval));
		pro.put("durationOfExpiredTime", String.valueOf(this.durationOfExpiredTime));
		pro.put("hasTrash", this.hasTrash==true?"true":"false");
		LocalFileUtils.persistProperties(pro,"config.properties");
		
	}
	
}
