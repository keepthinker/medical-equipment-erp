<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
          <h2>设备信息修改</h2>
        </div>
        <div class="row">
          <form name="meerpForm" class="bs-component form-horizontal">
            <div class="col-lg-6">
                <div class="form-group">
                  <label class="control-label col-lg-2" for="focusedInput">序列号</label>
                  <div class="col-lg-7"><input name="serial" class="form-control" id="focusedInput" type="text" value="${equipment.serial}"></div>
                </div>

                <div class="form-group">
                  <label class="control-label col-lg-2" for="focusedInput">中文名称</label>
                  <div class="col-lg-7"><input name="chineseName" class="form-control" id="focusedInput" type="text" value="${equipment.chineseName}"></div>
                </div>

                <div class="form-group">
                  <label class="control-label col-lg-2" for="focusedInput">英文名称</label>
                  <div class="col-lg-7"><input name="englishName" class="form-control" id="focusedInput" type="text" value="${equipment.englishName}"></div>
                </div>

                <div class="form-group">
                  <label class="control-label col-lg-2" for="focusedInput">说明</label>
                  <div class="col-lg-7"><textarea class="form-control" name="description" rows="3" id="focusedInput" >${equipment.description}</textarea></div>
                </div>

                <div class="form-group">
                  <label class="control-label col-lg-2" for="focusedInput">备注</label>
                  <div class="col-lg-7"><textarea class="form-control" name="note" rows="3" id="focusedInput" >${equipment.note}</textarea></div>
                </div>

                <div class="form-group">
                  <label class="control-label col-lg-2" for="focusedInput">产地</label>
                  <div class="col-lg-7"><input name="madeBy" class="form-control" id="focusedInput" type="text" value="${equipment.madeBy}"></div>
                </div>

                <div class="form-group  ">
                  <label class="control-label col-lg-2" for="focusedInput">数量</label>
                  <div class="col-lg-7"><input name="quantity" class="form-control" id="focusedInput" type="number" value="${equipment.quantity}"></div>
                </div>

                <div class="form-group  ">
                  <label class="control-label col-lg-2" for="focusedInput">种类</label>
                  <div class="col-lg-7"><input name="category" class="form-control" id="focusedInput" type="text" value="${equipment.category}"></div>
                </div>

                <div class="form-group  ">
                  <label class="control-label col-lg-2" for="focusedInput">厂商</label>
                  <div class="col-lg-7"><input name="manufacturer" class="form-control" id="focusedInput" type="text" value="${equipment.manufacturer}"></div>
                </div>
            </div>

            <div class="col-lg-6">
                <div class="form-group  ">
                  <label class="control-label col-lg-2" for="focusedInput">单价</label>
                  <div class="col-lg-7"><input name="price" class="form-control" id="focusedInput" type="number" value="${equipment.price}"></div>
                </div>
                
                <div class="form-group  ">
                  <label class="control-label col-lg-2" for="focusedInput">管理类别</label>
                  <div class="col-lg-7">
	                  <select name="managementLevel" class="form-control" id="focusedInput" type="number">
	                    <option <c:if test="${equipment.managementLevel==1}"> selected</c:if>>1</option>
	                    <option <c:if test="${equipment.managementLevel==2}"> selected</c:if>>2</option>
	                    <option <c:if test="${equipment.managementLevel==3}"> selected</c:if>>3</option>
	                  </select>
                  </div>
                </div>

                <div class="form-group">
                  <label class="control-label col-lg-2" for="focusedInput">操作者ID</label>
                  <div class="col-lg-7"><input name="operatorId" class="form-control" id="focusedInput" type="number" value="${equipment.operatorId}"></div>
                </div>

                <div class="form-group">
                  <label class="control-label col-lg-2" for="focusedInput">科室主任ID</label>
                  <div class="col-lg-7"><input name="directorId" class="form-control" id="focusedInput" type="number" value="${equipment.directorId}"></div>
                </div>

                <div class="form-group">
                  <label class="control-label col-lg-2" for="focusedInupt">运动状态</label>
                  <div class="col-lg-7">
                    <select name="motionState" class="form-control" id="focusedInput" type="text">
                      <option <c:if test="${equipment.motionState=='入库'}"> selected</c:if>>入库</option>
                      <option <c:if test="${equipment.motionState=='出库'}"> selected</c:if>>出库</option>
                      <option <c:if test="${equipment.motionState=='转存'}"> selected</c:if>>转存</option>
                    </select>
                  </div>
                </div>

                <div class="form-group">
                  <label class="control-label col-lg-2" for="focusedInput">运转状态</label>
                  <div class="col-lg-7">
                    <select name="runningState" class="form-control" id="focusedInput" type="text">
                      <option <c:if test="${equipment.runningState=='正常'}"> selected</c:if>>正常</option>
                      <option <c:if test="${equipment.runningState=='损坏'}"> selected</c:if>>损坏</option>
                      <option <c:if test="${equipment.runningState=='维修'}"> selected</c:if>>维修</option>
                      <option <c:if test="${equipment.runningState=='报废'}"> selected</c:if>>报废</option>
                    </select>
                  </div>
                </div>

                <div class="form-group  ">
                  <label class="control-label col-lg-2">维修时间</label>
                  <div  class="col-lg-7">
                    <div class="date-input year-input">
                      <select name="repairYear" class="form-control" id="repairYear" type="number">
                      </select>
                    </div>
                    <div class="date-label">
                      <label>年</label>
                    </div>
                    <div class="date-input">
                      <select name="repairMonth" class="form-control" id="repairMonth" type="number">
                      </select>
                    </div>
                    <div class="date-label">
                      <label>月</label>
                    </div>
                    <div class="date-input">
                      <select name="repairDate" class="form-control" id="repairDate" type="number">
                      </select>
                    </div>
                    <div class="date-label">
                      <label>日</label>
                    </div>
                  </div>
                </div>

                <div class="form-group  ">
                  <label class="control-label col-lg-2" for="focusedInput">维修次数</label>
                  <div class="col-lg-7"><input name="repairFrequency" class="form-control" id="focusedInput" type="number" value="${equipment.repairFrequency}"></div>
                </div>

                <div class="form-group  ">
                  <label class="control-label col-lg-2" for="focusedInput">保养时间</label>
                  <div  class="col-lg-7">
                    <div class="date-input year-input">
                      <select name="maintainYear" class="form-control" id="maintainYear" type="number">
                      </select>
                    </div>
                    <div class="date-label">
                      <label>年</label>
                    </div>
                    <div class="date-input">
                      <select name="maintainMonth" class="form-control" id="maintainMonth" type="number">
                      </select>
                    </div>
                    <div class="date-label">
                      <label>月</label>
                    </div>
                    <div class="date-input">
                      <select name="maintainDate" class="form-control" id="maintainDate" type="number">
                      </select>
                    </div>
                    <div class="date-label">
                      <label>日</label>
                    </div>
                  </div>
                </div>

                 <div class="form-group  ">
                  <label class="control-label col-lg-2" for="focusedInput">保养次数</label>
                  <div class="col-lg-7"><input name="maintainFrequency" class="form-control" id="focusedInput" type="number" value="${equipment.maintainFrequency}"></div>
                </div>
            </div>
          </form>
          <div class="form-group">
            <div class="col-lg-10 col-lg-offset-2">
              <button id="submit" class="btn btn-primary btn-lg">保存修改</button>
            </div>
          </div>
        </div>
      </div>
    </div>
	<jsp:include page="../footer.jsp" />
    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="myModalLabel">Modal title</h4>
          </div>
          <div class="modal-body">
          ...
          </div>
          <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary">Save changes</button>
          </div>
        </div>
      </div>
    </div>

    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/meerp-common.js"></script>
    <script>
    //依赖meerp-common.js
    $(document).ready(function(){
      //保养时间选择器的实现
      generateCalendarOptions("#maintainYear","#maintainMonth","#maintainDate",${equipment.maintainTime});
      //结束

      //维修时间选择器的实现
      generateCalendarOptions("#repairYear","#repairMonth","#repairDate",${equipment.repairTime});
      //结束

      $("#submit").on("click",function(){
        var dataSend="{";
        if(document.meerpForm.serial.value != "${equipment.serial}"){
          dataSend += "\"serial\":\"" + document.meerpForm.serial.value + "\",";
        }
        if(document.meerpForm.chineseName.value != "${equipment.chineseName}"){
          dataSend += "\"chineseName\":\"" + document.meerpForm.chineseName.value + "\",";
        }
        if(document.meerpForm.englishName.value != "${equipment.englishName}"){
          dataSend += "\"englishName\":\"" + document.meerpForm.englishName.value + "\",";
        }
        if(document.meerpForm.description.value != "${equipment.description}"){
          dataSend += "\"description\":\"" + document.meerpForm.description.value + "\",";
        }
        if(document.meerpForm.note.value != "${equipment.note}"){
          dataSend += "\"note\":\"" + document.meerpForm.note.value + "\",";
        }
        if(document.meerpForm.madeBy.value != "${equipment.madeBy}"){
          dataSend += "\"madeBy\":\"" + document.meerpForm.madeBy.value +"\",";
        }
        if(document.meerpForm.quantity.value != "${equipment.quantity}"){
          dataSend += "\"quantity\":" + document.meerpForm.quantity.value + ",";
        }
        if(document.meerpForm.category.value != "${equipment.category}"){
          dataSend += "\"category\":\"" + document.meerpForm.category.value + "\",";
        }
        if(document.meerpForm.manufacturer.value != "${equipment.manufacturer}"){
          dataSend += "\"manufacturer\":\"" + document.meerpForm.manufacturer.value + "\",";
        }
        if(document.meerpForm.price.value != "${equipment.price}"){
            dataSend += "\"price\":" + document.meerpForm.price.value + ",";
          }
        if(document.meerpForm.managementLevel.value != "${equipment.managementLevel}"){
          dataSend += "\"managementLevel\":" + document.meerpForm.managementLevel.value + ",";
        }
        if(document.meerpForm.operatorId.value != "${equipment.operatorId}"){
          dataSend += "\"operatorId\":" + document.meerpForm.operatorId.value+",";
        }
        if(document.meerpForm.directorId.value != "${equipment.directorId}"){
          dataSend += "\"directorId\":" + document.meerpForm.directorId.value + ",";
        }
        if(document.meerpForm.motionState.value != "${equipment.motionState}"){
          dataSend += "\"motionState\":\"" + document.meerpForm.motionState.value + "\",";
        }
        if(document.meerpForm.runningState.value != "${equipment.runningState}"){
          dataSend += "\"runningState\":\"" + document.meerpForm.runningState.value + "\",";
        }
        //时间处理
        var oldRepairDate=new Date(${equipment.repairTime});
        if(document.meerpForm.repairYear.value != oldRepairDate.getFullYear()
          ||document.meerpForm.repairMonth.value-1 != oldRepairDate.getMonth()
          ||document.meerpForm.repairDate.value != oldRepairDate.getDate()){
          var repairDate = new Date();
          repairDate.setDate(document.meerpForm.repairDate.value);//以防止月份的天数的特殊性，先设置天数
          repairDate.setMonth(document.meerpForm.repairMonth.value - 1);
          repairDate.setFullYear(document.meerpForm.repairYear.value);
          dataSend += "\"repairTime\":" + repairDate.getTime()+",";
        }
        if(document.meerpForm.repairFrequency.value != "${equipment.repairFrequency}"){
          dataSend += "\"repairFrequency\":\"" + document.meerpForm.repairFrequency.value + "\",";
        }

         //时间处理
        var oldMaintainDate = new Date(${equipment.maintainTime});
        if(document.meerpForm.maintainYear.value != oldMaintainDate.getFullYear()
          ||document.meerpForm.maintainMonth.value-1 != oldMaintainDate.getMonth()
          ||document.meerpForm.maintainDate.value != oldMaintainDate.getDate()){
          var maintainDate = new Date();
          maintainDate.setDate(document.meerpForm.maintainDate.value);
          maintainDate.setMonth(document.meerpForm.maintainMonth.value - 1);
          maintainDate.setFullYear(document.meerpForm.maintainYear.value);
          dataSend += "\"maintainTime\":"+maintainDate.getTime() + ",";
        }
        if(document.meerpForm.maintainFrequency.value != "${equipment.maintainFrequency}"){
          dataSend += "\"maintainFrequency\":\"" + document.meerpForm.maintainFrequency.value + "\",";
        }

        if(dataSend != "{"){
        	dataSend=dataSend.slice(0, dataSend.length - 1);//去除最尾的,
        }
        dataSend += "}";
        if(dataSend.length < 3){
          alert("你没有对任何数据进行修改");
        	return;
        }

        $.ajax({
          type : "POST",
          url : "${pageContext.request.contextPath}/equipments/equipment/modify-properties/${equipment.id}",
          data : dataSend,
          contentType : "application/json;charset=utf-8",
          dateType : "text",
          success : function(msg){
            if(msg == 1){
        		  alert("修改成功");
        		window.location.href = "${pageContext.request.contextPath}/homepage";
            }else{
            	alert("修改失败");
            }
          },
          error : function(xhr, textStatus){
            alert("错误 : xhr:" + xhr.statusText + ",text status:" + textStatus);
          }
        });

      });
    });
    </script>
    <style>
      .date-input{
        width : 22%;
        display :  inline-block;
      }
      .year-input{
        width : 30%;
      }
      .date-label{
        display :  inline-block;
      }
      textarea{
        margin-top: 0px;
        margin-bottom: 0px; 
        height: 110px;
        max-width: 450px;
      }
    </style>
  </body>

</html>
	