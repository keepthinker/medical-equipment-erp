<%@page import="com.keepthinker.meerp.utils.UserUtils"%>
<%@page import="com.keepthinker.meerp.utils.ShiroSessionUtils"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.apache.shiro.SecurityUtils"%>
	<!-- Fixed navbar -->
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="${pageContext.request.contextPath}/homepage">医疗设备ERP系统</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="${pageContext.request.contextPath}/static/about.html" target="_blank">关于</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><%=ShiroSessionUtils.getCurrentUserName()%></a>
              <shiro:authenticated><ul class="dropdown-menu" role="menu">
                <li><a href="${pageContext.request.contextPath}/users/user/account-settings/">账号设置</a></li>
                <shiro:hasRole name="administrator"><li><a href="${pageContext.request.contextPath}/system-settings/display">系统设置</a></li></shiro:hasRole>
                <li><a href="${pageContext.request.contextPath}/export/page" target="_blank">导出数据</a></li>
                <li class="divider"></li>
                <li><a href="${pageContext.request.contextPath}/logout">退出</a></li>
              </ul></shiro:authenticated>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <br/>
