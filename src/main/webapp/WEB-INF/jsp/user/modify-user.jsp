<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List" %>
<%@ page import="com.keepthinker.meerp.entity.User" %>
<%@ page import="com.keepthinker.meerp.entity.Role" %>
<% 
	User user = (User)request.getAttribute("user");
	List<Role> roles = (List<Role>)request.getAttribute("roles");
%>
<div class="col-lg-13">
  <form name="modifyUserForm" class="bs-component form-horizontal" user-id="${user.id}">
    <div class="form-group">
      <label class="control-label col-lg-3" for="focusedInput">用户名</label>
      <div class="col-lg-6"><input class="form-control" id="focusedInput" name="userName" type="text" value="${user.userName}" readonly></div>
      
    </div>

    <div class="form-group">
      <label class="control-label col-lg-3" for="focusedInput">密码</label>
      <div class="col-lg-6"><input class="form-control" id="focusedInput" name="password" type="text" value="${user.password}" readonly></div>
      <div class="col-lg-3">
        <a href="#" class="btn btn-primary modify-user-button">修改</a>
        <a href="#" class="btn btn-warning modify-user-confirm-btn" style="display:none"  data-toggle="modal" data-target="#myModal">确定</a>
        <a href="#" class="btn btn-primary cancel-button" style="display:none">取消</a>
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-lg-3" for="focusedInput">真实姓名</label>
      <div class="col-lg-6"><input class="form-control" id="focusedInput" name="realName" type="text" value="${user.realName}" readonly></div>
      <div class="col-lg-3">
        <a href="#" class="btn btn-primary modify-user-button">修改</a>
        <a href="#" class="btn btn-warning modify-user-confirm-btn" style="display:none"  data-toggle="modal" data-target="#myModal">确定</a>
        <a href="#" class="btn btn-primary cancel-button" style="display:none">取消</a>
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-lg-3" for="focusedInput">电话号码</label>
      <div class="col-lg-6"><input class="form-control" id="focusedInput" name="phoneNumber" type="text" value="${user.phoneNumber}" readonly></div>
      <div class="col-lg-3">
        <a href="#" class="btn btn-primary modify-user-button">修改</a>
        <a href="#" class="btn btn-warning modify-user-confirm-btn" style="display:none"  data-toggle="modal" data-target="#myModal">确定</a>
        <a href="#" class="btn btn-primary cancel-button" style="display:none">取消</a>
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-lg-3" for="focusedInput">角色</label>
      <div class="col-lg-6"><input class="form-control" id="focusedInput" type="text" value="<c:forEach var='role' items='${user.roles}'>${role.chineseRoleName}  </c:forEach>" readonly></div>
      <div id="role-div" class="col-lg-7" style="display:none">
        <div class="checkbox col-lg-3">
          <label><input type="checkbox" name="role1" value="${roles[0].id}" <% if(user.getRoles().contains(roles.get(0))){out.print("checked");} %>>${roles[0].chineseRoleName}</label>
        </div>
        <div class="checkbox col-lg-3">
          <label><input type="checkbox" name="role2" value="${roles[1].id}" <% if(user.getRoles().contains(roles.get(1))){out.print("checked");} %>>${roles[1].chineseRoleName}</label>
        </div>
          <div class="checkbox col-lg-3">
          <label><input type="checkbox" name="role3" value="${roles[2].id}" <% if(user.getRoles().contains(roles.get(2))){out.print("checked");} %>>${roles[2].chineseRoleName}</label>
        </div>
        <div class="checkbox col-lg-3">
          <label><input type="checkbox" name="role4" value="${roles[3].id}" <% if(user.getRoles().contains(roles.get(3))){out.print("checked");} %>>${roles[3].chineseRoleName}</label>
        </div>
        <div class="checkbox col-lg-3">
          <label><input type="checkbox" name="role5" value="${roles[4].id}" <% if(user.getRoles().contains(roles.get(4))){out.print("checked");} %>>${roles[4].chineseRoleName}</label>
        </div>
      </div>
      <div class="col-lg-3">
        <a href="#" class="btn btn-primary modify-user-button">修改</a>
        <a href="#" class="btn btn-warning modify-user-confirm-btn" style="display:none"  data-toggle="modal" data-target="#myModal">确定</a>
        <a href="#" class="btn btn-primary cancel-button" style="display:none">取消</a>
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-lg-3" for="focusedInput">部门</label>
      <div class="col-lg-6"><input class="form-control" id="focusedInput" name="department" type="text" value="${user.department}" readonly></div>
      <div class="col-lg-3">
        <a href="#" class="btn btn-primary modify-user-button">修改</a>
        <a href="#" class="btn btn-warning modify-user-confirm-btn" style="display:none"  data-toggle="modal" data-target="#myModal">确定</a>
        <a href="#" class="btn btn-primary cancel-button" style="display:none">取消</a>
      </div>
    </div>
  </form>
</div>
