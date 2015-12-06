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
  <jsp:include page="header.jsp" />
  <div id="main" class="container">
    <div id="sys-div">
      <h2>系统设置</h2>
      <form name="form" class="bs-component form-horizontal" action="#">
        <div class="form-group">
          <label class="control-label col-lg-4" for="focusedInput">展示每一页最多个数</label>
          <div class="col-lg-6">
            <input class="form-control" name="pageSize" id="focusedInput" type="text" value="${config.pageSize}" disabled>
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-lg-4" for="focusedInput">搜索一页显示最多个数</label>
          <div class="col-lg-6">
            <input class="form-control" name="searchResultSize" id="focusedInput" type="text" value="${config.searchResultSize}" disabled>
          </div>
        </div>
 <!--        <div class="form-group">
          <label class="control-label col-lg-4" for="focusedInput">垃圾箱功能</label>
          <div class="col-lg-6">
            <select name="hasTrash" class="form-control" id="focusedInput" type="text" disabled>
              <option value="false" <c:if test="${config.hasTrash==false}" >selected</c:if>>关闭</option>
              <option value="true" <c:if test="${config.hasTrash==true}" >selected</c:if>>开启</option>
            </select>
          </div>
        </div> -->
        <div class="form-group">
          <div id="button-area" class="col-lg-6 col-lg-offset-4">
            <a id="modify-btn" class="col-lg-2 btn btn-primary">修改</a>
            <a id="submit-btn" class="col-lg-2 btn btn-warning" style="display: none">提交</a>
            <a id="cancel-btn" class="col-lg-2 btn btn-primary" style="display: none">取消</a>
          </div>
        </div>
      </form>
    </div>
  </div>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
  <jsp:include page="footer.jsp"/>
  <script>
  $("#modify-btn").on("click",function(){
    $(".form-control").prop("disabled",false);
    $(this).css("display","none");
    $(this).next().css("display","block");
    $(this).next().next().css("display","block");
    return false;
  });

  $("#submit-btn").on("click", function(){
    var pageSize = document.form.pageSize.value;
    var hasTrash = false;//document.form.hasTrash.value;
    var searchResultSize = document.form.searchResultSize.value;
    var dataToSent ="pageSize=" + pageSize+"&hasTrash=" + hasTrash+"&searchResultSize=" + searchResultSize;
    var submitButton = this;
    $.ajax({
      type : "POST",
      url : "${pageContext.request.contextPath}" + "/system-settings/set/",
      data : dataToSent,
      success : function(msg){
        if(msg == 2){
          alert("修改成功");
          $(".form-control").prop("disabled",true);
          $(submitButton).css("display","none");
          $(submitButton).next().css("display","none");
          $(submitButton).prev().css("display","block");
        }else{
          alert("修改失败");
        }
      },
      error : function(xhr, textStatus, errorThrown){
        alert("xhr:" + xhr.statusText + ",textStatus:" + textStatus + ",errorThrown:" + errorThrown);
      }
    });
    return false;
  });
  $("#cancel-btn").on("click", function(){
    $(".form-control").prop("disabled", true);
    $(this).css("display", "none");
    $(this).prev().css("display", "none");
    $(this).prev().prev().css("display", "block");
  })
  </script>
  
  <style>
	
  #sys-div {
    text-align: center;
    border-style: groove;
    border-color: lightblue;
    border-width: 2px;
    width: 50%;
    margin: auto;
  }

  #sys-div h2 {
    text-align: center;
    margin-top: 50px;
    margin-bottom: 50px
  }

  .btn{
    width: 70px;
    margin-right: 10px;
  }

  #button-area{
    margin-top: 20px;
  }

  </style>
</body>
</html>
