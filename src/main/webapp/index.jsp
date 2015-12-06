<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	response.sendRedirect(request.getContextPath()+"/homepage");//jsp:forward 方式不能被shiro过滤
%>