package com.keepthinker.meerp.service.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ServletContextAware;

import com.keepthinker.meerp.config.SystemConfig;

/**
 * 清除resources/export文件夹里的过期导出文件
 * @author keepthinker
 *
 */
@Component
public class TrashFileCleaner implements ServletContextAware{

	private Logger logger;
	@Autowired
	private SystemConfig config;
	
	private ServletContext servletContext;

	private Timer timer;
	@Override
	public void setServletContext(ServletContext context) {
		this.servletContext=context;
	}

	public TrashFileCleaner(){
		logger = Logger.getLogger(TrashFileCleaner.class);
	}

	@PostConstruct
	private void run(){
		logger.info("Start running TrashFileCleaner");
		timer = new Timer();
		TimerTask task = new CleanTask(logger, config, servletContext);
		timer.schedule(task, 120000,  config.getFileCleanInterval());
	}
	private static class CleanTask extends TimerTask{

		private Logger logger;
		private SystemConfig config;
		private ServletContext servletContext;
		
		public CleanTask(Logger logger, SystemConfig config,
				ServletContext servletContext) {
			this.logger = logger;
			this.config = config;
			this.servletContext = servletContext;
		}
		@Override
		public void run() {
			if(servletContext!=null){
				String realPath = servletContext.getRealPath("/");
				String filePath = realPath + "resources/export/";
				File file = new File(filePath);
				logger.info("Tread id :" + Thread.currentThread().getId() + " \nStart cleaning out-of-date files inside " + filePath + "folder");
				long currentTime = System.currentTimeMillis();
				for(File f : file.listFiles()){
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");	
					logger.info("(" + f.getName() + ")'s lastModifiedTime is " + sdf.format(new Date(f.lastModified())));
					if((currentTime - f.lastModified()) > config.getDurationOfExpiredTime()){
						if(f.delete()){
							logger.info("删除成功");
						}else{
							logger.error("删除失败");
						};
					}
				}
			}
		}
	}

}
