//函数依赖meerp-common.js文件
function callAddEquipmentJS(contextPath){
 
  //维修时间选择器的实现
  generateCalendarOptions("#repairYear","#repairMonth","#repairDate");
  
  //保养时间选择器的实现
  generateCalendarOptions("#maintainYear","#maintainMonth","#maintainDate");
  
  $("#submit").on("click",function(){
    //检查输入值是否有效
    var equipment;
    //维修时间
    repairDate=new Date();
    repairDate.setFullYear(document.equipmentForm.repairYear.value);
    repairDate.setMonth(document.equipmentForm.repairMonth.value-1);
    repairDate.setDate(document.equipmentForm.repairDate.value);
    //保养时间
    maintainDate=new Date();
    maintainDate.setFullYear(document.equipmentForm.maintainYear.value);
    maintainDate.setMonth(document.equipmentForm.maintainMonth.value-1);
    maintainDate.setDate(document.equipmentForm.maintainDate.value);

    equipment="{"
      +"\"serial\":\""+document.equipmentForm.serial.value+"\","
      +"\"chineseName\":\""+document.equipmentForm.chineseName.value+"\","
      +"\"englishName\":\""+document.equipmentForm.englishName.value+"\","
      +"\"description\":\""+document.equipmentForm.description.value+"\","
      +"\"note\":\""+document.equipmentForm.note.value+"\","
      +"\"madeBy\":\""+document.equipmentForm.madeBy.value+"\","
      +"\"quantity\":"+document.equipmentForm.quantity.value+","
      +"\"category\":\""+document.equipmentForm.category.value+"\","
      +"\"manufacturer\":\""+document.equipmentForm.manufacturer.value+"\","
      +"\"price\":"+document.equipmentForm.price.value+","
      +"\"managementLevel\":"+document.equipmentForm.managementLevel.value+","
      +"\"operatorId\":"+document.equipmentForm.operatorId.value+","
      +"\"directorId\":"+document.equipmentForm.directorId.value+","
      +"\"motionState\":\""+document.equipmentForm.motionState.value+"\","
      +"\"runningState\":\""+document.equipmentForm.runningState.value+"\","
      +"\"repairTime\":"+repairDate.getTime()+","
      +"\"repairFrequency\":"+document.equipmentForm.repairFrequency.value+","
      +"\"maintainTime\":"+maintainDate.getTime()+","
      +"\"maintainFrequency\":"+document.equipmentForm.maintainFrequency.value+"}";
    $.ajax({
      type : "POST",
      url : contextPath + "/equipments/equipment/add",
      data : equipment,
      contentType : "application/json;charset=utf-8",
      dataType : "json",
      success : function(result){
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
          alert("添加成功");
          window.location.reload(false);//当前页面刷新，不从服务端获取页面信息
        }else{
          alert("返回的状态码异常,状态码为" + result.status);
        }
      },
      error : function(xhr, textStatus){
        alert("输入数据格式错误，xhr:"+xhr.statusText+",text status:"+textStatus);
        window.location.reload(false); 
      }
    });
  });
  
};
