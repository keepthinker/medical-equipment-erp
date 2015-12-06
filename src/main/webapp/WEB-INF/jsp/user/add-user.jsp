<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="col-lg-13">
  <form id="add-user-form" name="addUserForm" class="bs-component form-horizontal">
    <div class="form-group">
      <label class="control-label col-lg-3" for="focusedInput">用户名</label>
      <div class="col-lg-7"><input name="userName" class="form-control" id="focusedInput" type="text"></div>
    </div>

    <div class="form-group">
      <label class="control-label col-lg-3" for="focusedInput">密码</label>
      <div class="col-lg-7"><input name="password" class="form-control" id="focusedInput" type="password"></div>
    </div>

    <div class="form-group">
      <label class="control-label col-lg-3" for="focusedInput">姓名</label>
      <div class="col-lg-7"><input name="realName" class="form-control" id="focusedInput" type="text"></div>
    </div>

    <div class="form-group">
      <label class="control-label col-lg-3" for="focusedInput">电话</label>
      <div class="col-lg-7"><input name="phoneNumber" class="form-control" id="focusedInput" type="text"></div>
    </div>

    <div class="form-group">
      <label class="control-label col-lg-3" for="focusedInput">角色</label>
      <div id="role-div" class="col-lg-9">
        <div class="checkbox col-lg-3">
          <label><input type="checkbox" class="role" name="role1" value="${roles[0].id}">${roles[0].chineseRoleName}</label>
        </div>
        <div class="checkbox col-lg-3">
          <label><input type="checkbox" class="role" name="role2" value="${roles[1].id}">${roles[1].chineseRoleName}</label>
        </div>
          <div class="checkbox col-lg-3">
          <label><input type="checkbox" class="role" name="role3" value="${roles[2].id}">${roles[2].chineseRoleName}</label>
        </div>
        <div class="checkbox col-lg-3">
          <label><input type="checkbox" class="role" name="role4" value="${roles[3].id}">${roles[3].chineseRoleName}</label>
        </div>
        <div class="checkbox col-lg-3">
          <label><input type="checkbox" class="role" name="role5" value="${roles[4].id}">${roles[4].chineseRoleName}</label>
        </div>
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-lg-3" for="focusedInput">部门</label>
      <div class="col-lg-7"><input name="department" class="form-control" id="focusedInput" type="text"></div>
    </div>
  </form>
</div>