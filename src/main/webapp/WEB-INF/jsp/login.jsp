<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
	 <head>
    <meta charset="utf-8">
    <title>登录主页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/tiny-logo.jpg">
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" media="screen">
    <link rel="stylesheet" href="resources/css/bootswatch.min.css">
    <link rel="stylesheet" href="resources/css/meerp-common.css">
  </head>
	<body>
	<jsp:include page="header.jsp"/>
    <br/>
    <br/>
    
    <div id="main" class="container">
      <div style="float: left;">
        <img src="resources/img/glassland.jpg"  width="700px"></img>
      </div>
      <div class="col-lg-4" style="float: right;margin-top:50px">
        <div class="panel panel-primary">
          <div class="panel-heading">
            <h3 class="panel-title" style="font-size:23px;text-align:center;"><shiro:authenticated>已</shiro:authenticated>登录</h3>
          </div>
          <br/>
          <shiro:notAuthenticated>
          <br/>
          <form method="post" action="" class="bs-component form-horizontal">
            <div class="form-group">
              <label class="control-label col-lg-3" for="focusedInput">用户名</label>
              <div class="col-lg-8"><input name="username" class="form-control" id="focusedInput" type="text" ></div>          
            </div>
            <div class="form-group">
              <label class="control-label col-lg-3" for="focusedInput">密码</label>
              <div class="col-lg-8"><input name="password" class="form-control" id="focusedInput" type="password" ></div>
            </div>
            <div class="form-group">
              <label class="control-label col-lg-3" for="focusedInput"></label>
              <div class="col-lg-8 ">
                <button type="submit" class="btn btn-primary" style="padding-left: 30px;padding-right: 30px;">登录</button>
                <input type="checkbox" name="rememberMe" value="true" style="margin-left:20px"/><label style="margin-left:10px">记住登录</label>
              </div>
            </div>
            <c:if test="${shiroLoginFailure == 'org.apache.shiro.authc.IncorrectCredentialsException'||shiroLoginFailure == 'org.apache.shiro.authc.UnknownAccountException'}">
            <div class="panel-body" style="text-align:center">
              <div class="alert alert-warning" role="alert">
                <strong>注意：</strong>用户名或密码错误
              </div>
            </div>
            </c:if>
          </form>
        	</shiro:notAuthenticated>
          <shiro:authenticated>
            <body onload="redirectToHomepage()">
              <div class="panel-body" style="text-align:center"><strong>将在1.5秒钟后跳转到管理主页</strong>
              </div>
            </body>
          </shiro:authenticated>
        </div>
      </div>

    </div>
    <jsp:include page="footer.jsp"/>
    <script src="resources/js/jquery.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script>
    function redirectToHomepage(){
    	setTimeout(function(){
    	 	window.location.href="${pageContext.request.contextPath}/homepage";
    		}
    	,1500);
    }
    </script>
	</body>

</html>
	