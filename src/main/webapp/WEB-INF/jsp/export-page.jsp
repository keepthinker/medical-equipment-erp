<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="utf-8">
	<title>导出数据</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/tiny-logo.jpg">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" media="screen">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootswatch.min.css">
</head>
<body>
<jsp:include page="header.jsp"/>
	<div style="text-align:center; margin-top:100px">
		<shiro:hasPermission name="equ_read">
		<div><a id="export-equipments-btn" href="#" class="btn btn-primary btn-lg">导出设备信息</a></div>
		</shiro:hasPermission>
		<div id="export-equipments-address"  class="address"></div>
		<shiro:hasPermission name="user_read">
		<div><a id="export-users-btn" href="#" class="btn btn-primary btn-lg">导出用户信息</a></div>
		<div id = "export-users-address" class="address"></div>
	    </shiro:hasPermission>
	</div>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
	<script>
		var path = "${pageContext.request.contextPath}/export/";

		$("#export-equipments-btn").on("click", function(){
			$("#export-equipments-address").html('<div id="e-progress" class="progress progress-striped active"><div class="progress-bar" style="width: 100%"></div></div>');
			$("#e-progress").css("display", "block");
			$.ajax({
				type : "GET",
				url : path + "equipments",
				success : function(msg){
					var text;
					if(msg!=0){
						text = "<strong>请点击该链接，此链接将在2个小时内失效：</strong><a href = "+msg+" >"+msg+"</a>";
          }else{
          	text = "<strong>无数据可导出</strong>";
          }
        	$("#export-equipments-address").html(text);
	      },
	      error : function(xhr,textStatus,errorThrown){
	        alert("xhr:"+xhr.statusText+",textStatus:"+textStatus+",errorThrown:"+errorThrown);
	      }
			});
		});

		$("#export-users-btn").on("click", function(){
			$("#export-users-address").html('<div id="u-progress" class="progress progress-striped active"><div class="progress-bar" style="width: 100%"></div></div>');
			$("#u-progress").css("display", "block");
			$.ajax({
				type : "GET",
				url : path + "users",
				success : function(msg){
					var text;
					if(msg!=0){
						text = "<strong>请点击该链接，此链接将在2个小时内失效：</strong><a href = "+msg+" >"+msg+"</a>";
          }else{
          	text = "<strong>无数据可导出</strong>";
          }
          $("#export-users-address").html(text);
	      },
	      error : function(xhr,textStatus,errorThrown){
	        alert("xhr:"+xhr.statusText+",textStatus:"+textStatus+",errorThrown:"+errorThrown);
	      }
			});
		});
	</script>
	<style>
	.address{
		height: 3px;
		width: 30%;
		display: inline-block;
		margin: 10px 0px 20px
	}
	strong{
		display: inline-block;
	}
	.progress{
		display: none;
	}
	</style>
</body>
</html>