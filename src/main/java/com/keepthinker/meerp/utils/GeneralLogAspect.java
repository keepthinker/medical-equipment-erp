package com.keepthinker.meerp.utils;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class GeneralLogAspect {
	//缓存 Logger 对象
	Map<String,Logger> map=new HashMap<String, Logger>();
	
	@Pointcut("execution(* com.keepthinker.meerp.web.*.*(..))")
	public void logWebController(){};

	@Before("logWebController()")
	public void logWebFuncIn(JoinPoint joinpoint){
		String targetClassName=joinpoint.getTarget().getClass().getName();
		Logger logger = getLogger(targetClassName);
		
		String signature=joinpoint.getSignature().toString();
		String argsInfo="";
		for(Object obj:joinpoint.getArgs()){
			argsInfo+=obj+":"+obj.getClass().getName()+"  ";
		}
		logger.info("get into controller via "+signature+(argsInfo.length()>0?(" with args: "+argsInfo):""));
		logger.info("userName : "+SecurityUtils.getSubject().getPrincipal());
	}
	
	@AfterReturning(pointcut = "logWebController()", returning = "retVal")
	public void logWebFuncSuccessExit(JoinPoint joinpoint, Object retVal) {
		String targetClassName=joinpoint.getTarget().getClass().getName();
		Logger logger = getLogger(targetClassName);
		String signature=joinpoint.getSignature().toString();
		logger.info("normally exit the controller via " + signature + 
				(retVal != null ? (" with return value: " + renderReturnValue(retVal)):""));
	}
	
	@Pointcut("execution(* com.keepthinker.meerp.service.*.*(..))")
	public void logServiceController(){};

	@Before("logServiceController()")
	public void logServiceFuncIn(JoinPoint joinpoint){
		String targetClassName=joinpoint.getTarget().getClass().getName();
		Logger logger = getLogger(targetClassName);

		String signature=joinpoint.getSignature().toString();
		String argsInfo="";
		for(Object obj:joinpoint.getArgs()){
			argsInfo+=obj+":"+obj.getClass().getName()+"  ";
		}
		logger.info("get into service via "+signature+(argsInfo.length()>0?(" with args: "+argsInfo):""));

	}

	@AfterReturning(pointcut = "logServiceController()", returning = "retVal")
	public void logServiceFuncSuccessExit(JoinPoint joinpoint, Object retVal) {
		String targetClassName=joinpoint.getTarget().getClass().getName();
		Logger logger = getLogger(targetClassName);

		String signature=joinpoint.getSignature().toString();
		logger.info("normally exit the service via " + signature + 
				(retVal != null ? (" with return value: " + renderReturnValue(retVal)):""));
	}


	@Pointcut("execution(* com.keepthinker.meerp.dao.*.*(..))")
	public void logDaoController(){};

	@Before("logDaoController()")
	public void logDaoFuncIn(JoinPoint joinpoint){
		String targetClassName=joinpoint.getTarget().getClass().getName();
		Logger logger = getLogger(targetClassName);

		String signature=joinpoint.getSignature().toString();
		String argsInfo="";
		for(Object obj:joinpoint.getArgs()){
			argsInfo+=obj+":"+obj.getClass().getName()+"  ";
		}
		logger.info("get into Dao via "+signature+(argsInfo.length()>0?(" with args: "+argsInfo):""));

	}

	@AfterReturning(pointcut = "logDaoController()", returning = "retVal")
	public void logDaoFuncSuccessExit(JoinPoint joinpoint, Object retVal){
		String targetClassName=joinpoint.getTarget().getClass().getName();
		Logger logger = getLogger(targetClassName);

		String signature=joinpoint.getSignature().toString();
		logger.info("normally exit the Dao via " + signature + 
				(retVal != null ? (" with return value: " + renderReturnValue(retVal)):""));
	}
	
	private Logger getLogger(String targetClassName){
		Logger logger;
		if(map.keySet().contains(targetClassName)==false){
			logger=Logger.getLogger(targetClassName);
			map.put(targetClassName, logger);
		}else{
			logger=map.get(targetClassName);
		}
		return logger;
	}
	
	private String renderReturnValue(Object retVal){
		String returnValue = retVal.toString();
		int len = returnValue.length();
		int retStrLen = 300;
		return len > retStrLen ? returnValue.substring(0, retStrLen)+"..." : returnValue;
	}
}
