<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
	 <head>
    <meta charset="utf-8">
    <title>个人账号设置</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/tiny-logo.jpg">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" media="screen">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootswatch.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/meerp-common.css">
  </head>
	<body>
	<jsp:include page="../header.jsp"/>
    <div id="main" class="container">
      <div class="col-lg-13">
      <h2 style="margin:30px 100px">个人账号信息</h2>
        <form class="bs-component form-horizontal" user-id="${user.id}">
          <div class="form-group">
            <label class="control-label col-lg-2" for="focusedInput">用户名</label>
            <div class="col-lg-5"><input class="form-control" id="focusedInput" type="text" value="${user.userName}" readonly></div>
            
          </div>

          <div class="form-group">
            <label class="control-label col-lg-2" for="focusedInput">密码</label>
            <div class="col-lg-5"><input class="form-control" name="password" id="focusedInput" type="password" value="******" readonly></div>
            <div class="col-lg-3">
              <a href="#" class="btn btn-primary modify-button">修改</a>
              <a href="#" class="btn btn-warning ok-button" style="display:none"  data-toggle="modal" data-target="#myModal">确定</a>
              <a href="#" class="btn btn-primary cancel-button" style="display:none">取消</a>
            </div>
          </div>

          <div class="form-group">
            <label class="control-label col-lg-2" for="focusedInput">真实姓名</label>
            <div class="col-lg-5"><input class="form-control" name="realName" id="focusedInput" type="text" value="${user.realName}" readonly></div>
            <div class="col-lg-3">
              <a href="#" class="btn btn-primary modify-button">修改</a>
              <a href="#" class="btn btn-warning ok-button" style="display:none"  data-toggle="modal" data-target="#myModal">确定</a>
              <a href="#" class="btn btn-primary cancel-button" style="display:none">取消</a>
            </div>
          </div>

          <div class="form-group">
            <label class="control-label col-lg-2" for="focusedInput">电话号码</label>
            <div class="col-lg-5"><input class="form-control" name="phoneNumber" id="focusedInput" type="text" value="${user.phoneNumber}" readonly></div>
            <div class="col-lg-3">
              <a href="#" class="btn btn-primary modify-button">修改</a>
              <a href="#" class="btn btn-warning ok-button" style="display:none"  data-toggle="modal" data-target="#myModal">确定</a>
              <a href="#" class="btn btn-primary cancel-button" style="display:none">取消</a>
            </div>
          </div>

          <div class="form-group">
            <label class="control-label col-lg-2" for="roles">角色</label>
            <div class="col-lg-5"><input class="form-control" id="roles" type="text" value="<c:forEach var='role' items='${user.roles}'>${role.chineseRoleName}  </c:forEach>" readonly></div>
          </div>
          
          <div class="form-group">
            <label class="control-label col-lg-2" for="focusedInput">部门</label>
            <div class="col-lg-5"><input class="form-control" name="department" id="focusedInput" type="text" value="${user.department}" readonly></div>
            <div class="col-lg-3">
              <a href="#" class="btn btn-primary modify-button">修改</a>
              <a href="#" class="btn btn-warning ok-button" style="display:none"  data-toggle="modal" data-target="#myModal">确定</a>
              <a href="#" class="btn btn-primary cancel-button" style="display:none">取消</a>
            </div>
          </div>
        </form>
      </div>
    </div>
	<jsp:include page="../footer.jsp"/>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/private/account-settings.js"></script>
	<script>
		callAccountSettingsJS("${pageContext.request.contextPath}");
	</script>
	</body>
</html>
	