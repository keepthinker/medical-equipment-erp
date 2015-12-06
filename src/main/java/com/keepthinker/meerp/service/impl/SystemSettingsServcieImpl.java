package com.keepthinker.meerp.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keepthinker.meerp.dao.SystemSettingsDao;
import com.keepthinker.meerp.service.SystemSettingsService;

@Service
public class SystemSettingsServcieImpl implements SystemSettingsService{
	@Autowired
	private SystemSettingsDao systemSettingsDao;
	@Override
	public int setIsRecyclable(boolean isIrue) {
		return 0;
	}

}
