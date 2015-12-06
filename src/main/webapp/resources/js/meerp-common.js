//为<select>标签生成时间对应的<option>，比如年份，月份，日期列表
//参数为css选择器类型
function generateCalendarOptions(yearSelect, monthSelect, dateSelect, defaultTime){
	if(defaultTime == null){
		defaultTime = 0;
	}
	var yearSelect = yearSelect;
	var maxYear = new Date().getFullYear() + 1;
	var defaultDate = new Date(defaultTime);
	var tag = "";
	var year = defaultDate.getFullYear();
	for(var i = 1970; i < maxYear; i++){
	  if(i == year){
	    tag += "<option selected>"+ i +"</option>";
	  }else{
	    tag += "<option>" + i + "</option>";
	  }
	}
	$(yearSelect).append(tag);

	tag = "";
	var month = defaultDate.getMonth() + 1;
	for(var i = 1; i <= 12; i++){
	  if(i == month){
	    tag += "<option selected>" + i + "</option>";
	  }else{
	    tag += "<option>" + i + "</option>";
	  }
	}
	$(monthSelect).append(tag);

	tag="";
	var date = defaultDate.getDate();
	for(var i = 1; i <= 31; i++){
	  if(i == date){
	    tag += "<option selected>" + i + "</option>";
	  }else{
	    tag += "<option>" + i + "</option>";
	  }
	}
	$(dateSelect).append(tag);
	//结束
}