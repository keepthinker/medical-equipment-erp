<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
  <head>
    <meta charset="utf-8">
    <title>添加医疗设备信息</title>
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
          <h2>设备信息添加</h2>
        </div>
        <div class="row">
          <form name="equipmentForm" class="bs-component form-horizontal">
            <div class="col-lg-6">
                <div class="form-group">
                  <label class="control-label col-lg-2" for="focusedInput">序列号</label>
                  <div class="col-lg-7"><input name="serial" class="form-control" id="focusedInput" type="text" value=""></div>
                </div>

                <div class="form-group">
                  <label class="control-label col-lg-2" for="focusedInput">中文名称</label>
                  <div class="col-lg-7"><input name="chineseName" class="form-control" id="focusedInput" type="text" value=""></div>
                </div>

                <div class="form-group">
                  <label class="control-label col-lg-2" for="focusedInput">英文名称</label>
                  <div class="col-lg-7"><input name="englishName" class="form-control" id="focusedInput" type="text" value=""></div>
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
                  <div class="col-lg-7"><input name="madeBy" class="form-control" id="focusedInput" type="text" value=""></div>
                </div>

                <div class="form-group  ">
                  <label class="control-label col-lg-2" for="focusedInput">数量</label>
                  <div class="col-lg-7"><input name="quantity" class="form-control" id="focusedInput" type="number" value="0"></div>
                </div>

                <div class="form-group  ">
                  <label class="control-label col-lg-2" for="focusedInput">种类</label>
                  <div class="col-lg-7"><input name="category" class="form-control" id="focusedInput" type="text" value=""></div>
                </div>

                <div class="form-group  ">
                  <label class="control-label col-lg-2" for="focusedInput">厂商</label>
                  <div class="col-lg-7"><input name="manufacturer" class="form-control" id="focusedInput" type="text" value=""></div>
                </div>

                <div class="form-group  ">
                  <label class="control-label col-lg-2" for="focusedInput">单价</label>
                  <div class="col-lg-7"><input name="price" class="form-control" id="focusedInput" type="number" value="0"></div>
                </div>
            </div>

            <div class="col-lg-6">
                <div class="form-group  ">
                  <label class="control-label col-lg-2" for="focusedInput">管理类别</label>
                  <div class="col-lg-7">
	                  <select name="managementLevel" class="form-control" id="focusedInput" type="text">
	                    <option>1</option>
	                    <option>2</option>
	                    <option>3</option>
	                  </select>
                  </div>
                </div>

                <div class="form-group">
                  <label class="control-label col-lg-2" for="focusedInput">操作者ID</label>
                  <div class="col-lg-7"><input name="operatorId" class="form-control" id="focusedInput" type="number" value="0"></div>
                </div>

                <div class="form-group">
                  <label class="control-label col-lg-2" for="focusedInput">科室主任ID</label>
                  <div class="col-lg-7"><input name="directorId" class="form-control" id="focusedInput" type="number" value="0"></div>
                </div>

                <div class="form-group">
                  <label class="control-label col-lg-2" for="focusedInput">运动状态</label>
                  <div class="col-lg-7">
                    <select name="motionState" class="form-control" id="focusedInput" type="text">
                      <option>入库</option>
                      <option>出库</option>
                      <option>转存</option>
                    </select>
                  </div>
                </div>

                <div class="form-group">
                  <label class="control-label col-lg-2" for="focusedInput">运转状态</label>
                  <div class="col-lg-7">
                    <select name="runningState" class="form-control" id="focusedInput" type="text">
                      <option>正常</option>
                      <option>损坏</option>
                      <option>维修</option>
                      <option>报废</option>
                    </select>
                  </div>
                </div>

                <div class="form-group  ">
                  <label class="control-label col-lg-2" for="focusedInput">维修时间</label>
                  <div class="col-lg-7">
                    <div class="date-input year-input">
                      <select name="repairYear" class="form-control" id="repairYear" type="text">
                      </select>
                    </div>
                    <div class="date-label">
                      <label>年</label>
                    </div>
                    <div class="date-input">
                      <select name="repairMonth" class="form-control" id="repairMonth" type="text">
                      </select>
                    </div>
                    <div class="date-label">
                      <label>月</label>
                    </div>
                    <div class="date-input">
                      <select name="repairDate" class="form-control" id="repairDate" type="text">
                      </select>
                    </div>
                    <div class="date-label">
                      <label>日</label>
                    </div>
                  </div>
                </div>

                <div class="form-group  ">
                  <label class="control-label col-lg-2" for="focusedInput">维修次数</label>
                  <div class="col-lg-7"><input name="repairFrequency" class="form-control" id="focusedInput" type="text" value="0"></div>
                </div>

                <div class="form-group  ">
                  <label class="control-label col-lg-2" for="focusedInput">保养时间</label>
                  <div class="col-lg-7">
                    <div class="date-input year-input">
                      <select name="maintainYear" class="form-control" id="maintainYear" type="text">
                      </select>
                    </div>
                    <div class="date-label">
                      <label>年</label>
                    </div>
                    <div class="date-input">
                      <select name="maintainMonth" class="form-control" id="maintainMonth" type="text">
                      </select>
                    </div>
                    <div class="date-label">
                      <label>月</label>
                    </div>
                    <div class="date-input">
                      <select name="maintainDate" class="form-control" id="maintainDate" type="text">
                      </select>
                    </div>
                    <div class="date-label">
                      <label>日</label>
                    </div>
                  </div>
                </div>

                 <div class="form-group  ">
                  <label class="control-label col-lg-2" for="focusedInput">保养次数</label>
                  <div class="col-lg-7"><input name="maintainFrequency" class="form-control" id="focusedInput" type="text" value="0"></div>
                </div>
            </div>
          </form>
          <div class="form-group">
            <div class="col-lg-10 col-lg-offset-2">
              <button id="submit" class="btn btn-primary btn-lg">提交</button>
            </div>
          </div>
        </div>
      </div>
    </div>
	<jsp:include page="../footer.jsp"/>

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
    <script src="${pageContext.request.contextPath}/resources/js/private/add-equipment.js"></script>
    <script>
      //调用add-equipment.js的方法，启动里面所有事件绑定
      callAddEquipmentJS("${pageContext.request.contextPath}");
    </script>
    <style>
      .date-input{
        width:22%;
        display: inline-block;
      }
      .year-input{
        width:30%;
      }
      .date-label{
        display: inline-block;
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
	