
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE HTML>
<html>
	<head>
    <meta charset="utf-8">
    <title>医疗设备ERP系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/tiny-logo.jpg">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" media="screen">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootswatch.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/meerp-common.css">
  	</head>
	<body>
	<jsp:include page="header.jsp"/>
	<br/>
    <div id="main" class="container">
      <div class="col-lg-13">
        <div class="bs-component">
          <ul class="nav nav-tabs" style="z-index:999">
            <li id="equipment-mng" class="active"><a href="#equipment-tab-pane" data-toggle="tab" aria-expanded="true"><strong>设备<shiro:hasPermission name="equ_modify">管理</shiro:hasPermission><shiro:lacksPermission name="equ_modify">查看</shiro:lacksPermission></strong></a></li>
            <shiro:hasPermission name="user_read"><li id="user-mng" class=""><a href="#user-tab-pane" data-toggle="tab" aria-expanded="false"><strong>用户<shiro:hasRole name="administrator">管理</shiro:hasRole><shiro:lacksRole name="administrator">查看</shiro:lacksRole></strong></a></li></shiro:hasPermission>
            <li>
              <shiro:hasPermission name="equ_search">
              <form id="search-equ" name="searchEqu" class="navbar-form navbar-left" role="search" style="margin-left: 50px;" >
                <div class="form-group">
                  <input name="keyword" type="text" class="form-control" placeholder="关键字">
                </div>
                <div class="form-group">
                  <div class="col-lg-10">
                    <select name="property" class="form-control" id="select">
                      <option value="serial">序列号</option>
                      <option value="chineseName">中文名称</option>
                      <option value="englishName">英文名称</option>
                      <option value="category">种类</option>
                      <option value="manufacturer">厂商</option>
                      <option value="madeBy">产地</option>
                      <option value="operatorId">操作者ID</option>
                      <option value="directorId">科室主任ID</option>
                    </select>
                  </div>
                </div>
                <button id="search-equ-btn" type="submit" class="btn btn-primary">搜索</button>
              </form>
              </shiro:hasPermission>
              <shiro:hasPermission name="user_search">
              <form id="search-user" name="searchUser" class="navbar-form navbar-left" role="search" style="margin-left: 50px;display:none" >
                <div class="form-group">
                  <input type="text" name="keyword" class="form-control" placeholder="关键字">
                </div>
                <div class="form-group">
                  <div class="col-lg-10">
                    <select name="property" class="form-control" id="select">
                      <option value="id">用户ID</option>
                      <option value="userName">用户名</option>
                      <option value="realName">真实姓名</option>
                      <option value="phoneNumber">电话号码</option>
                      <option value="department">部门</option>
                    </select>
                  </div>
                </div>
                <button id="search-user-btn" type="submit" class="btn btn-primary">搜索</button>
              </form>
              </shiro:hasPermission>
            </li>
            <shiro:hasPermission name="equ_add"><li id="add-equ" class="add-object"><a href="#" class="btn btn-primary"><strong>新增</strong></a></li></shiro:hasPermission>
            <shiro:hasPermission name="user_add"><li id="add-user" class="add-object" style="display:none"><a href="#" class="btn btn-primary"><strong>新增</strong></a></li></shiro:hasPermission>
          </ul>
          <div id="myTabContent" class="tab-content">
            <div class="tab-pane fade active in" id="equipment-tab-pane" style = "display:none">
              <div class="row">
                <div class="col-lg-12">
                  <div class="bs-component">
                    <table class="table table-striped table-hover ">
                      <thead>
                        <tr>
                          <th>#</th>
                          <th>序列号</th>
                          <th>中文名称</th>
                          <!-- <th>英文名称</th>
                          <th>说明</th>
                          <th>备注</th>
                          <th>产地</th> -->
                          <th class="cn-2-char">数量</th>
                          <th>种类</th>
                          <!-- <th>厂商</th>
                          <th>价格</th> -->
                          <th class="cn-2-char">管理类别</th>
                          <th class="cn-3-char">操作者</th>
                          <th class="cn-3-char">科室主任</th>
                          <th class="cn-2-char">运动状态</th>
                          <th class="cn-2-char">运转状态</th>
                          <th>维修时间</th>
                          <th class="cn-2-char">维修次数</th>
                          <th>保养时间</th>
                          <th class="cn-2-char">保养次数</th>
                      </thead>
                      <tbody>
                        <!-- 网页加载后，js在此添加列表 -->
                      </tbody>
                    </table> 
                  </div>
                </div>
              </div>
            </div>
            <shiro:hasPermission name="user_read">
            <div class="tab-pane fade" id="user-tab-pane" style = "display:none">
              <div class="row">
                <div class="col-lg-12">
                  <div class="bs-component">
                    <table class="table table-striped table-hover ">
                      <thead>
                        <tr>
                          <th>#</th>
                          <th>用户ID</th>
                          <th>用户名</th>
                          <shiro:hasPermission name="user_modify"><th>密码</th></shiro:hasPermission>
                          <th>真实姓名</th>
                          <th>电话号码</th>
                          <th>角色</th>
                          <th>部门</th>
                        </tr>
                      </thead>
                      <tbody>
                      <!-- 网页加载后，点击账号管理，在此添加列表 -->
                      </tbody>
                    </table> 
                  </div>
                </div>
              </div>
            </div>
            </shiro:hasPermission>
          </div>

          <div id="more-info" class="bs-component" style="display:none">
            <a href="#" class="btn btn-default">更&nbsp&nbsp&nbsp&nbsp&nbsp多</a>
          </div>
        </div>
      </div>
    </div>
	<jsp:include page="footer.jsp" />
    <!-- deleteModal -->
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content alert alert-warning">
          <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="deleteModalLabel" >删除</h4>
          </div>
          <div class="modal-body">
          ...
          </div>
          <div class="modal-footer">
          <button id="cancel" type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
          <button id="delete-confirm-btn" type="button" class="btn btn-danger" delete-id="">确定</button>
          </div>
        </div>
      </div>
    </div>
	<shiro:hasPermission name="user_add">
    <!-- addUserModal -->
    <div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="addUserModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="addUserModalLabel">注册用户信息</h4>
          </div>
          <div class="modal-body"></div>
          <div class="modal-footer">
          <button id="cancel" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
          <button id="add-user-confirm-btn" type="button" class="btn btn-primary">提交</button>
          </div>
        </div>
      </div>
    </div>
	</shiro:hasPermission>
	<shiro:hasPermission name="user_modify">
    <!-- modifyUserModal -->
    <div class="modal fade" id="modifyUserModal" tabindex="-1" role="dialog" aria-labelledby="modifyUserModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="modifyUserModalLabel">修改用户信息</h4>
          </div>
          <div class="modal-body">
          ...
          </div>
          <div class="modal-footer">
          <button id="cancel" type="button" class="btn btn-default" data-dismiss="modal">退出</button> </div>
        </div>
      </div>
    </div>
	</shiro:hasPermission>

    <style>
      #role-div div{
        padding-left:0;
        padding-right:0;
        font-size:15px;
      }

      #add-user{
        float: right;
        position: relative;
        bottom: -11px;
      }
      #add-user a{
        font-size: 18px;
        padding:7px 20px;
      }

      #add-equ{
        float: right;
        position: relative;
        bottom: -11px;
      }
      #add-equ a{
        font-size: 18px;
        padding:7px 20px;
      }

      #equipment-mng a{
        font-size: 22px;
      }

      #user-mng a{
        font-size: 22px;
      }
      #more-info{
        text-align: center;
      }
      #more-info a{
        width: 30%;
      }

      #deleteModal h4{
        text-align:center;
        color:red;
        font-size:28px;
      }

      #addUserModal h4{
        text-align:center;
        color:rgb(43, 146, 232);
        font-size:28px;
      }
      #modifyUserModal h4{
         text-align:center;
         color:blue;
         font-size:28px;
      }
      .cn-2-char{
        width:48px;
      }
      .cn-3-char{
        width:60px;
      }
      .list-group-item{
        border: hidden; 
        padding: 5px;
      }
      .list-group{
        width:250px;
        font-size:15px;
      }
      .list-group-item .userName{
        padding-right: 0px;
      }
    </style>
    
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>    
    <script src="${pageContext.request.contextPath}/resources/js/bootswatch.js"></script>
    <script>
function callHomepageJS(contextPath, pageSize){

  //---------------页面初始化，绑定的事件-------------开始
  //是否显示更多按钮的条件
  var isEquFull =  false;
  var isUserFull = false;
  //分页的counter
  var counterEqu = 1;
  var counterUser = 1;
  //搜索
  var isEquSearched = false;
  var isUserSearched = false;
  //更多按钮
  $("#more-info").on("click", function(){
    var selectedTab=$(".nav-tabs .active").prop("id");
    if(selectedTab=="equipment-mng"){
      if(isEquFull == true){
        return false;
      }
      counterEqu++;
      appendToTbody(counterEqu, "#equipment-tab-pane tbody", "equipment");
    }else if(selectedTab=="user-mng"){
      if(isUserFull == true){
        return false;
      }
      counterUser++;
      appendToTbody(counterUser, "#user-tab-pane tbody", "user");
    }
    return false;
  });
<shiro:hasPermission name="equ_search">
  //搜索框
  $("#search-equ-btn").on("click", function(){
    if(searchEqu.keyword.value == ""){
      alert("没有要查询的数据");
      return false;
    }
    $.ajax({
      type : "GET",
      url : contextPath+"/equipments/search/"+searchEqu.property.value+"/"+searchEqu.keyword.value,
      dataType : "json",
      success : function(equipments){
        var tRNodes = "";
        for(var i = 0, len = equipments.length; i<len; i++){
          tRNodes += generateEquipmentTRNode(equipments[i], i+1);
        }
        $("#equipment-tab-pane tbody").html(tRNodes);
        $("#more-info").html('');
        
        bindPopoverEvent();
        isEquSearched = true;
      },
      error:function(xhr,textStatus,errorThrown){
        alert("xhr:"+xhr.statusText+",textStatus:"+textStatus+",errorThrown:"+errorThrown);
        window.location.href = contextPath;
      }
    });
    return false;
  });
</shiro:hasPermission>
<shiro:hasPermission name="user_search">
  $("#search-user-btn").on("click", function(){
    if(searchUser.keyword.value == ""){
      alert("没有要查询的数据");
      return false;
    }
    $.ajax({
      type : "GET",
      url : contextPath+"/users/search/"+searchUser.property.value+"/"+searchUser.keyword.value,
      dataType : "json",
      success : function(users){
        var tRNodes = "";
        for(var i = 0, len = users.length; i<len; i++){
          tRNodes += generateUserTRNode(users[i], i+1);
        }
        $("#user-tab-pane tbody").html(tRNodes);
        $("#more-info").html('');

        bindDeleteEvent();
        if(typeof(bindModifyUserEvent)!="undefined"){
          bindModifyUserEvent();
        }
        isUserSearched = true;
      },
      error:function(xhr,textStatus,errorThrown){
        alert("xhr:"+xhr.statusText+", textStatus:"+textStatus+", errorThrown:"+errorThrown);
        window.location.href = contextPath;
      }
    });
    return false;
  });
</shiro:hasPermission>
  //点击设备管理选项卡
  $("#equipment-mng").on("click", function(){
    $("#add-equ").css("display","block");
    $("#add-user").css("display","none");

    $("#search-equ").css("display","block");
    $("#search-user").css("display","none");

    if(isEquSearched == true){//若果之前搜索过内容，若再次点击按钮则页面显示第一次加载的内容
      window.location.reload(false);
      isEquSearched == false;
    }

    if(isEquFull == true){
      $("#more-info").html('无更多内容');
    }else{
      $("#more-info").html('<a href="#" class="btn btn-default">更&nbsp&nbsp&nbsp&nbsp&nbsp多</a>');
    }

  });
  //点击用户管理选项卡
  $("#user-mng").on("click", function(){
    $("#add-equ").css("display","none");
    $("#add-user").css("display","block");

    $("#search-equ").css("display","none");
    $("#search-user").css("display","block");

    if(isUserSearched == true){
      $("#user-tab-pane").css("display", "none");
      $("#user-tab-pane tbody").html('');;
      appendToTbody(1, "#user-tab-pane tbody", "user");
      setTimeout(function(){ //动画效果
        $("#user-tab-pane").slideDown(500,function(){
        $("#more-info").css("display", "block");
        });
      },300);
      bindDeleteEvent();
      bindModifyUserEvent();
      isUserSearched = false;
    }
    
    if(isUserFull == true){
      $("#more-info").html('无更多内容');
    }else{
      $("#more-info").html('<a href="#" class="btn btn-default">更&nbsp&nbsp&nbsp&nbsp&nbsp多</a>');
    }
  });
  //如果是设备管理则跳转到新页面，若是用户管理则再当前页面弹出输入框
  $(".add-object").on("click", function(){
    var selectedTab=$(".nav-tabs .active").prop("id");
    if(selectedTab=="equipment-mng"){
      window.location.href=contextPath+"/equipments/equipment/add-page";
    }else if(selectedTab=="user-mng"){
      //添加用户信息，
      if($("#addUserModal .modal-body").text()==""){
        $("#addUserModal .modal-body").load(contextPath+"/users/user/add-page",function(response, status, xhr){
          if ( status == "error" ) {
            var msg = "加载出现问题";
            alert( msg + "，状态 ：" + xhr.status + "，状态文本 ：" + xhr.statusText );
          }else{
            $('#addUserModal').modal('show');
          }
        });
      }else{
        $("#add-user-form .form-control").prop("value", "");
        $("#add-user-form .role").prop("checked", false);
        $('#addUserModal').modal('show');
      }
    }
  });
  
  //弹出删除确认框
  $("#delete-confirm-btn").on("click",function(){
    
    var selectedTab=$(".nav-tabs .active").prop("id");
    if(selectedTab=="equipment-mng"){
      var equipmentId=$(this).prop("delete-id"); $("#deleteModal").modal("hide");
      $.ajax({
        type:"DELETE",
        url:contextPath+"/equipments/equipment/delete/"+equipmentId,
        success:function(msg){
          if(msg==1){
            $("#deleteModal").modal("hide");
            $("#equipment-id-"+equipmentId).fadeOut(1000, function(){
              $("#equipment-id-"+equipmentId).remove();
            });
          }else{
            alert("删除失败");
          }
        },
        error:function(xhr,textStatus,errorThrown){
          alert("xhr:"+xhr.statusText+",textStatus:"+textStatus+",errorThrown:"+errorThrown);
          window.location.href = contextPath;
        }
      });
    }else if(selectedTab=="user-mng"){
      var userId=$(this).prop("delete-id");
      $.ajax({
        type:"DELETE",
        url:contextPath+"/users/user/delete/"+userId,
        success:function(msg){
          if(msg==1){
            $("#deleteModal").modal("hide");
            $("#user-id-"+userId).fadeOut(1000, function(){
              $("#user-id-"+userId).remove();
            });
          }else{
            alert("删除失败");
          }
        },
        error:function(xhr,textStatus,errorThrown){
          alert("xhr:"+xhr.statusText+",textStatus:"+textStatus+",errorThrown:"+errorThrown);
          window.location.href = contextPath;
        }
      });
    }
  });
  <shiro:hasPermission name="user_add">

  //注册用户信息提交按钮
  $("#add-user-confirm-btn").on("click",function(){
    var user;
    //检查输入值是否有效
    var roles;
    roles = (document.addUserForm.role1.checked == true ? '{"id":'+document.addUserForm.role1.value+'},':"")
    + (document.addUserForm.role2.checked == true ? '{"id":'+document.addUserForm.role2.value+'},':"")
    + (document.addUserForm.role3.checked == true ? '{"id":'+document.addUserForm.role3.value+'},':"")
    + (document.addUserForm.role4.checked == true ? '{"id":'+document.addUserForm.role4.value+'},':"")
    + (document.addUserForm.role5.checked == true ? '{"id":'+document.addUserForm.role5.value+'},':"");
    
    roles= "[" + roles.substr(0, roles.length-1) + "]";

    var cnRoles=(document.addUserForm.role1.checked == true ? '{"chineseRoleName":"' + document.addUserForm.role1.nextSibling.nodeValue + '"},' : '')
      + (document.addUserForm.role2.checked == true ? '{"chineseRoleName":"' + document.addUserForm.role2.nextSibling.nodeValue + '"},' : "")
      + (document.addUserForm.role3.checked == true ? '{"chineseRoleName":"' + document.addUserForm.role3.nextSibling.nodeValue + '"},' : "")
      + (document.addUserForm.role4.checked == true ? '{"chineseRoleName":"' + document.addUserForm.role4.nextSibling.nodeValue + '"},' : "")
      + (document.addUserForm.role5.checked == true ? '{"chineseRoleName":"' + document.addUserForm.role5.nextSibling.nodeValue + '"},' : "");
    cnRoles = "[" + cnRoles.substr(0, cnRoles.length-1) + "]";
    
    user="{"
      +"\"userName\":\""+document.addUserForm.userName.value+"\","
      +"\"password\":\""+document.addUserForm.password.value+"\","
      +"\"realName\":\""+document.addUserForm.realName.value+"\","
      +"\"phoneNumber\":\""+document.addUserForm.phoneNumber.value+"\","
      +"\"roles\":"+roles+","
      +"\"department\":\""+document.addUserForm.department.value+"\"}";
      
    $.ajax({
      type:"POST",
      url:contextPath+"/users/user/add",
      contentType:"application/json;charset=utf-8",
      data:user,
      success:function(result){
        if(result.status == "FAILURE"){
          var inputStatus = result.inputCheckResult.status;
          var alertMsg;
          if(inputStatus == "INVALID"){
            alertMsg = ("输入非法， \n" + result.inputCheckResult.statusText);
          }else{
            alertMsg = ("其他错误， 可能为序列号重名");
          }
          alert(alertMsg);
        }else if(result.status == "SUCCESS"){
          var userJson=JSON && JSON.parse(user) || $.parseJSON(user);
          alert("添加用户信息成功,用户名为"+userJson.userName);
          var cnRolesJson = JSON && JSON.parse(cnRoles) || $.parseJSON(cnRoles);
          userJson.roles=cnRolesJson;
          userJson.id = result.other;
          var tr=generateUserTRNode(userJson,"#",'class="success"');
          $("#user-tab-pane tbody").append(tr);
          bindDeleteEvent();
          <shiro:hasPermission name="user_modify">
          bindModifyUserEvent();
          </shiro:hasPermission>
          $("#addUserModal").modal("hide");
        }else{
          alert("返回的状态码异常,状态码为" + result.status);
        }
      },
      error:function(xhr,textStatus,errorThrown){
        alert("输入数据格式错误，xhr:"+xhr.statusText+",text status:"+textStatus);
      }
    });
  
  });
  </shiro:hasPermission>
  //---------------页面初始化，绑定的事件-------------结束


  //-------第一次加载页面时，显示第一页设备信息----------开始

  appendToTbody(1, "#equipment-tab-pane tbody", "equipment");
  setTimeout(function(){ //动画效果
    $("#equipment-tab-pane").slideDown(500,function(){
    $("#more-info").css("display", "block");
   // $("#footer").css("display", "block");
    });
  },300);
  //-------第一次加载页面时，显示第一页设备信息----------结束

  function appendToTbody(pageNum, location, elemType){
    var getURL; 
    if(elemType == "equipment"){
      getURL = contextPath + "/equipments/get/" + pageNum;
    }else if(elemType == "user"){
      getURL = contextPath + "/users/get/" + pageNum;
    }
    $.ajax({
      type : "GET",
      url : getURL,
      dataType : "json",
      success : function(elems){
        var length = elems.length;
        var tRNodes="";
        var tr;
        var beginTRIndex = (pageNum - 1) * pageSize;
        if(elemType == "equipment"){
          for(var i = 0; i < length; i++){
            tr = generateEquipmentTRNode(elems[i], beginTRIndex + i + 1);
            tRNodes += tr;
          }
        }else if(elemType == "user"){
         for(var i = 0; i < length; i++){
            tr = generateUserTRNode(elems[i], beginTRIndex + i + 1);
            tRNodes += tr;
          }
        }

        $(location).append(tRNodes);
        if(length == pageSize){
          $("#more-info").html('<a href="#" class="btn btn-default">更&nbsp&nbsp&nbsp&nbsp&nbsp多</a>');
        }else{
          if(elemType == "equipment"){
            isEquFull = true;
          }else if(elemType == "user"){
            isUserFull = true;
          }
          $("#more-info").html('无更多内容');
        }
        bindDeleteEvent();
        if(elemType == "user"){
          <shiro:hasPermission name="user_modify">
          bindModifyUserEvent();
          </shiro:hasPermission>
        }
        if(elemType == "equipment"){
          bindPopoverEvent();
        }
      },
      error:function(xhr,textStatus,errorThrown){
        alert("xhr:"+xhr.statusText+",textStatus:"+textStatus+",errorThrown:"+errorThrown);
        window.location.href = contextPath;
      }
    });
  }
  
  function generateEquipmentTRNode(equipment, trId){
    var repairDate=new Date(equipment.repairTime);
    var maintainDate=new Date(equipment.maintainTime);
    var tds="<td>"+trId+"</td>"
        +"<td class=\"serial\">"+equipment.serial+"</td>"
        +"<td class=\"chineseName\">"+equipment.chineseName+"</td>"
        +"<!--<td>"+equipment.englishName+"</td>"
        +"<td>"+equipment.description+"</td>"
        +"<td>"+equipment.note+"</td>"
        +"<td>"+equipment.madeBy+"</td>-->"
        +"<td>"+equipment.quantity+"</td>"
        +"<td>"+equipment.category+"</td>"
        +"<!--<td>"+equipment.manufacturer+"</td>"
        +"<td>"+equipment.price+"</td>-->"
        +"<td>"+equipment.managementLevel+"</td>"
        +'<td class="operator" '+generateUserPopoverProperties(equipment,"operator")
        +'>'+equipment.operator.realName+"</td>"
        +'<td class="director" '+generateUserPopoverProperties(equipment,"director")
        +'>'
        +equipment.director.realName+"</td>"
        +"<td>"+equipment.motionState+"</td>"
        +"<td"
        +(equipment.runningState == "损坏"?' class="danger"':
          (equipment.runningState == "维修"?' class="warning"':""))
        +">"
        +equipment.runningState+"</td>"
        +"<td>"+repairDate.getFullYear()+"/"+(repairDate.getMonth()+1)+"/"+repairDate.getDate()+""+"</td>"
        +"<td>"+equipment.repairFrequency+"</td>"
        +"<td>"+maintainDate.getFullYear()+"/"+(maintainDate.getMonth()+1)+"/"+maintainDate.getDate()+""+"</td>"
        +"<td>"+equipment.maintainFrequency+"</td>"
        +'<td><a href="'+contextPath+'/equipments/equipment/display/'+equipment.id+'" class="btn btn-info" target="_blank">详情</a></td>'
        +'<shiro:hasPermission name="equ_modify"><td><a href="'+contextPath+'/equipments/equipment/modify-page/'+equipment.id+'" class="btn btn-primary">修改</a></td></shiro:hasPermission>'
        +'<shiro:hasPermission name="equ_delete"><td><a href=\"#\" class=\"btn btn-warning open-delete-dialog\" data-toggle=\"modal\" data-target=\"#deleteModal\">删除</a></td></shiro:hasPermission>';
    return "<tr id=\"equipment-id-"+equipment.id+"\">"+tds+"</tr>"
  }

  function generateUserPopoverProperties(equipment, roleName){
    var user;
    if(roleName == "operator"){
      user = equipment.operator;
    }else if(roleName == "director"){
      user = equipment.director;
    }
    return 'data-container="body" data-toggle="popover" data-html=true data-placement="top" data-content=\''
    +'<div class="list-group">'
        +'<a href="#" class="list-group-item active">'
          +'<span class="header">' + user.realName + '的用户信息</span>'
        +'</a>'
        +'<a href="#" class="list-group-item">'
          +'<span><strong class="col-lg-4">ID:</strong></span><span>' + user.id + '</span>'
        +'</a>'
        +'<a href="#" class="list-group-item">'
          +'<span><strong class="col-lg-4 userName">用户名:</strong></span><span>' + user.userName + '</span>'
        +'</a>'
        +'<a href="#" class="list-group-item">'
          +'<span><strong class="col-lg-4">电话:</strong></span><span>' + user.phoneNumber + '</span>'
        +'</a>'
        +'<a href="#" class="list-group-item">'
          +'<span><strong class="col-lg-4">部门:</strong></span><span>' + user.department + '</span>'
        +'</a>'
        +'<a href="#" class="list-group-item">'
          +'<span><strong class="col-lg-4">角色:</strong></span><span>' + user.rolesAsString + '</span>'
        +'</a>'
      +'</div>'
    +'\' '
    +'data-template='
    +'\'<div class="popover" role="tooltip" style="max-width:500px;"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content" style="padding:0px"></div></div>\'';
  }


  //------------第一次点击用户管理按钮后，ajax添加用户信息列表----------开始

  <shiro:hasPermission name="user_read">
  var isFirstClick=true;
  $("#user-mng").on("click",function(){
    if(isFirstClick==true){
      $("#more-info").css("display", "none");
      appendToTbody(1, "#user-tab-pane tbody", "user");
      setTimeout(function(){ //动画效果
        $("#user-tab-pane").slideDown(500,function(){
          $("#more-info").css("display", "block");
        });
      },300);
    }
    isFirstClick=false;
  });
  </shiro:hasPermission>

  function generateUserTRNode(user, trId, classType){
    var roles="";
    for(var i = 0, len = user.roles.length; i < len; i++){
      roles += user.roles[i].chineseRoleName + ", ";
    }
    roles = roles.substr(0, roles.length - 2);
      var td="<td>" + trId + "</td>"
          + "<td class=\"id\">" + user.id + "</td>"
          + "<td class=\"userName\">" + user.userName + "</td>"
          + '<shiro:hasPermission name="user_modify"><td class="password">' + user.password + '</td></shiro:hasPermission>'
          + "<td class=\"realName\">" + user.realName + "</td>"
          + "<td class=\"phoneNumber\">" + user.phoneNumber + "</td>"
          + "<td class=\"roles\">" + roles + "</td>"
          + "<td class=\"department\">" + user.department + "</td>"
          + '<shiro:hasPermission name="user_modify"><td><a href=\"#\" class=\"btn btn-primary open-user-modify-dialog\">修改</a></td></shiro:hasPermission>'+
          '<shiro:hasPermission name="user_delete"><td><a href=\"#\" class=\"btn btn-warning open-delete-dialog\" data-toggle=\"modal\" data-target=\"#deleteModal\">删除</a></td></shiro:hasPermission>';
    return "<tr " + classType + " id=\"user-id-" + user.id + "\">" + td + "</tr>";
  }

  //------------第一次点击用户管理按钮后，ajax添加用户信息列表----------结束



  //--------------ajax成功后绑定click事件--------------开始
  //为用户管理与设备管理，绑定删除事件，在生成新的button时操作时调用
  function bindDeleteEvent(){
    $(".open-delete-dialog").on("click", function (){

        var selectedTab = $(".nav-tabs .active").prop("id");
        var idTemp = $(this.parentNode.parentNode).prop("id");
        var id = idTemp.substr(idTemp.search(/[0-9]/));//idTemp 的格式为 equipment-id-([0-9]*)

        if(selectedTab == "equipment-mng"){
          //删除设备信息
          var serial = $(this.parentNode.parentNode).children(".serial").text();
          var chineseName = $(this.parentNode.parentNode).children(".chineseName").text();

          $("#deleteModal .modal-body").html("<strong>是否删除该设备</strong><br>"+
          "<strong>序列号："+serial+"<br/>中文名："+chineseName+"</strong>");

          $("#delete-confirm-btn").prop("delete-id",id);//在这里delete-id是equipmentId
        }else if(selectedTab == "user-mng"){
          //删除用户信息
          $("#deleteModal .modal-body").html("<strong>是否删除该用户</strong>");
          var userName = $(this.parentNode.parentNode).children(".userName").text();
          var realName = $(this.parentNode.parentNode).children(".realName").text();

          $("#deleteModal .modal-body").html("<strong>是否删除该用户</strong><br>"+
          "<strong>用户名："+userName+"<br/>姓名："+realName+"</strong>");

          $("#delete-confirm-btn").prop("delete-id",id);//在这里delete-id是userId

        }
    });
  }
  <shiro:hasPermission name="user_modify">
  //为用户信息修改，绑定信息修改事件，在生成新的button时操作时调用
  function bindModifyUserEvent(){
    $(".open-user-modify-dialog").on("click", function (){

      var idTemp = $(this.parentNode.parentNode).prop("id");
      var id = idTemp.substr(idTemp.search(/[0-9]/));//idTemp 的格式为 equipment-id-([0-9]*)

      $("#modifyUserModal .modal-body").load(contextPath+"/users/user/modify-page/"+id,function(response,status,xhr){
        if (status == "error") {
          var msg = "加载出现问题，";
          alert( msg + xhr.status + " " + xhr.statusText );
        }else{
          $('#modifyUserModal').modal('show');
          bindModifyUserConfirmEvent();
        }
      });
      return false;
    });
  }

  //当成功load /users/user/modify-page/{id} 时绑定弹出框里的确定修改事件
  function bindModifyUserConfirmEvent(){
    
    $(".modify-user-button").on("click",function(){
      var node = $(this.parentNode).prev();
      if($(node).prop("id") != "role-div"){
        $(node).children().prop( "readonly", false );
      }else{
        $(node).prev().prev().prop("class","control-label col-lg-2");
        $(node).prev().css("display","none");  
        $(node).css("display", "block");
      }

      $(this).css("display","none");
      $(this).nextAll().css("display","inline-block");
      return false;
    });

    $(".cancel-button").on("click",function(){
      var node = $(this.parentNode).prev();
      if($(node).prop("id") != "role-div"){
       $(node).children().prop( "readonly", true );
      }else{
       $(node).prev().prev().prop("class","control-label col-lg-3");
       $(node).prev().css("display","block");
       $(node).css("display", "none");
      }
      $(this).prev().prev().css("display", "inline-block");
      $(this).prev().css("display", "none");
      $(this).css("display", "none");
      return false;
    });

    $(".modify-user-confirm-btn").on("click",function(){
      var nodeDiv = $(this.parentNode).prev();
      var userId = $(this.parentNode.parentNode.parentNode).attr("user-id");
      var confirmButton=this;
      if($(nodeDiv).prop("id") != "role-div"){
        var nodeInput = $(nodeDiv).children("input")[0];
        var name = $(nodeInput).prop("name");
        var nodeValue = nodeInput.value;
        var dataToSent = '{"'+name+'"'+':'+'"'+nodeValue+'"}'; 
        $.ajax({
          type : "POST",
          url : "users/user/modify-property/"+userId,
          contentType : "application/json;charset=utf-8",
          data : dataToSent,
          success : function(msg){
            if(msg==1){
              
              alert("修改成功");

              var div = $(confirmButton.parentNode).prev();
              $(div).children().prop( "readonly", true );
              $(confirmButton).next().css("display", "none");
              $(confirmButton).css("display", "none");
              $(confirmButton).prev().css("display", "inline-block");

              var td = "#user-id-"+userId+" ."+name;
              $(td).text(nodeValue);
              $(td).css("color","blue");

            }
          },
          error : function(xhr,textStatus,errorThrown){
            alert("xhr:"+xhr.statusText+",textStatus:"+textStatus+",errorThrown:"+errorThrown);
            window.location.href = contextPath;
          }
        });

      }else{
        var roles;
        roles = (document.modifyUserForm.role1.checked == true ? '{"id":'+document.modifyUserForm.role1.value+'},':"")
        + (document.modifyUserForm.role2.checked == true ? '{"id":'+document.modifyUserForm.role2.value+'},':"")
        + (document.modifyUserForm.role3.checked == true ? '{"id":'+document.modifyUserForm.role3.value+'},':"")
        + (document.modifyUserForm.role4.checked == true ? '{"id":'+document.modifyUserForm.role4.value+'},':"")
        + (document.modifyUserForm.role5.checked == true ? '{"id":'+document.modifyUserForm.role5.value+'},':"");

        var cnRoles=(document.modifyUserForm.role1.checked == true ?  document.modifyUserForm.role1.nextSibling.nodeValue + '  ' : '')
        + (document.modifyUserForm.role2.checked == true ? document.modifyUserForm.role2.nextSibling.nodeValue + '  ' : "")
        + (document.modifyUserForm.role3.checked == true ? document.modifyUserForm.role3.nextSibling.nodeValue + '  ' : "")
        + (document.modifyUserForm.role4.checked == true ? document.modifyUserForm.role4.nextSibling.nodeValue + '  ' : "")
        + (document.modifyUserForm.role5.checked == true ? document.modifyUserForm.role5.nextSibling.nodeValue + '  ' : "");
       
        roles= '{"roles" : [' + roles.substr(0, roles.length-1) + ']}';

        $.ajax({
          type : "POST",
          url : "users/user/modify-property/"+userId,
          contentType : "application/json;charset=utf-8",
          data : roles,
          success : function(msg){
            if(msg == 1){
              
              alert("修改成功");
              $(nodeDiv).prev().children("input").prop("value",cnRoles);

              var div = $(confirmButton.parentNode).prev();
              $(div).prev().prev().prop("class","control-label col-lg-3");
              $(div).prev().css("display","block");
              $(div).css("display", "none");
              $(confirmButton).next().css("display", "none");
              $(confirmButton).css("display", "none");
              $(confirmButton).prev().css("display", "inline-block");

              cnRoles = cnRoles.replace(/  /g, ",");
              cnRoles = cnRoles.substr(0, cnRoles.length-1);
              var td = "#user-id-" + userId + " .roles";
              $(td).text(cnRoles);
              $(td).css("color","blue");
            }
          },
          error : function(xhr, textStatus, errorThrown){
            alert("xhr:" + xhr.statusText + ",textStatus:" + textStatus + ",errorThrown:" + errorThrown);
            window.location.href = contextPath;
          }
        });
      }

    });
  }
  </shiro:hasPermission>
  function bindPopoverEvent(){
    $('[data-toggle="popover"]').on("mouseover", function(){
      $(this).popover("show");
    });

    $('[data-toggle="popover"]').on("mouseleave", function(){
      $(this).popover("hide");
    });
  }
  //--------------ajax成功后绑定click事件--------------结束

};
      callHomepageJS("${pageContext.request.contextPath}", ${config.pageSize});
    </script>
	</body>

</html>
	