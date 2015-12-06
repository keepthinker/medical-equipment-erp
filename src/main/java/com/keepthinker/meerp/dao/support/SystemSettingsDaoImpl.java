package com.keepthinker.meerp.dao.support;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.keepthinker.meerp.dao.SystemSettingsDao;

@Repository
public class SystemSettingsDaoImpl implements SystemSettingsDao{
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Override
	public int updateIsRecyclable(boolean isTrue) {
		// TODO Auto-generated method stub
		return 0;
	}

}
