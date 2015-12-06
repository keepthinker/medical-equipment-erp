<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
  <head>
    <meta charset="utf-8">
    <title>修改医疗设备信息</title>
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
      <div class="bs-docs-section">
        <div>
          <h2>设备信息</h2>
        </div>
        <div class="bs-component">
          <div class="list-group  col-lg-6">
            <a href="#" class="list-group-item active">
              <span class="header">设备基本信息</span>
            </a>
            <a href="#" class="list-group-item">
              <span><strong class="col-lg-3">序列号:</strong></span><span>${equipment.serial }</span>
            </a>
            <a href="#" class="list-group-item">
              <span><strong class="col-lg-3">中文名称:</strong></span><span>${equipment.chineseName }</span>
            </a>
            <a href="#" class="list-group-item">
              <span><strong class="col-lg-3">英文名称:</strong></span><span>${equipment.englishName }</span>
            </a>
            <a href="#" class="list-group-item">
              <span><strong class="col-lg-3">说明:</strong></span><span>${equipment.description }</span>
            </a>
            <a href="#" class="list-group-item">
              <span><strong class="col-lg-3">备注:</strong></span><span>${equipment.note }</span>
            </a>
            <a href="#" class="list-group-item">
              <span><strong class="col-lg-3">产地:</strong></span><span>${equipment.madeBy }</span>
            </a>
            <a href="#" class="list-group-item">
              <span><strong class="col-lg-3">数量:</strong></span><span>${equipment.quantity }</span>
            </a>
            <a href="#" class="list-group-item">
              <span><strong class="col-lg-3">种类:</strong></span><span>${equipment.category }</span>
            </a>
            <a href="#" class="list-group-item">
              <span><strong class="col-lg-3">厂商:</strong></span><span>${equipment.manufacturer }</span>
            </a>
            <a href="#" class="list-group-item">
              <span><strong class="col-lg-3">单价</strong></span><span>${equipment.price }</span>
            </a>
          </div>
        </div>
        <div class="bs-component">
          <div id="others"  class="list-group  col-lg-5">
            <a href="#" class="list-group-item active">
              <span class="header">其他</span>
            </a>
            <a href="#" class="list-group-item">
              <span><strong class="col-lg-3">管理类别:</strong></span><span>${equipment.managementLevel }</span>
            </a>
            <a href="#" class="list-group-item">
              <span><strong class="col-lg-3">操作者:</strong></span><span>${equipment.operator.realName }</span>
            </a>
            <a href="#" class="list-group-item">
              <span><strong class="col-lg-3">操作者ID:</strong></span><span>${equipment.operatorId }</span>
            </a>
            <a href="#" class="list-group-item">
              <span><strong class="col-lg-3">科室主任:</strong></span><span>${equipment.director.realName }</span>
            </a>
            <a href="#" class="list-group-item">
              <span><strong class="col-lg-3">科室主任ID:</strong></span><span>${equipment.directorId }</span>
            </a>
            <a href="#" class="list-group-item">
              <span><strong class="col-lg-3">运动状态:</strong></span><span>${equipment.motionState }</span>
            </a>
            <a href="#" class="list-group-item">
              <span><strong class="col-lg-3">运转状态:</strong></span><span>${equipment.runningState }</span>
            </a>
            <a href="#" class="list-group-item">
              <span><strong class="col-lg-3">维修时间:</strong></span><span>${equipment.repairChineseDate }</span>
            </a>
            <a href="#" class="list-group-item">
              <span><strong class="col-lg-3">维修次数:</strong></span><span>${equipment.repairFrequency }</span>
            </a>
            <a href="#" class="list-group-item">
              <span><strong class="col-lg-3">保养时间:</strong></span><span>${equipment.maintainChineseDate }</span>
            </a>
            <a href="#" class="list-group-item">
              <span><strong class="col-lg-3">保养次数:</strong></span><span>${equipment.maintainFrequency }</span>
            </a>
          </div>
        </div>
      </div>
      <div class="bs-docs-section">
       <a id='modify-btn' href="${pageContext.request.contextPath}/equipments/equipment/modify-page/${equipment.id}" class="btn btn-primary">修改</a>
      </div>
    </div>
	<jsp:include page="../footer.jsp"/>
    <style>
    .label-content{
      text_align: left;
    }
    strong{
    }
    #others{
      float:right;
    }
    span{
    }
    .header{
      font-size: 23px;
    }
    #modify-btn{
      width: 150px
    }
    </style>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script>
    $(".list-group-item").on("click", function(){
      return false;
    });
    </script>
	</body>

</html>
	