package com.keepthinker.meerp.main.annotated;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
@Component
@Aspect
public class PersonAspect {
	@Pointcut("execution(* com.keepthinker.meerp.main.annotated.*.*(..))")
	public void logPerson() {
	}
	@Before("logPerson()")
	public void log(JoinPoint joinPoint){
		System.out.println("adsfgxz");
		for(Object o:joinPoint.getArgs()){
			System.out.println("arg:"+o+":"+o.getClass().getName());
		}
		System.out.println("signiture "+joinPoint.getSignature());
		System.out.println("signiture declaringTypeName:"+joinPoint.getSignature().getDeclaringTypeName());
		System.out.println("signiture name:"+joinPoint.getSignature().getName());
		System.out.println("kind:"+joinPoint.getKind());
		System.out.println("this:"+joinPoint.getThis());
		System.out.println("target:"+joinPoint.getTarget());
		System.out.println("target class name:"+joinPoint.getTarget().getClass().getName());
		System.out.println("toString:"+joinPoint.toString());
		System.out.println("staticPart:"+joinPoint.getStaticPart());;
		System.out.println("sourceLocation:"+joinPoint.getSourceLocation());
	}
	@Around("logPerson()")
	public void logAround(ProceedingJoinPoint point){
		System.out.println("into");
		try {
			point.proceed();
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("out");
	}
}
