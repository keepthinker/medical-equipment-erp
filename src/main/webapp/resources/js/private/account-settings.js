function callAccountSettingsJS(contextPath){ 
  $(document).on("click",".modify-button",function(){
    $(this).parent().prev().children().prop( "readonly", false );
    $(this).css("display","none");
    $(this).nextAll().css("display","inline-block");
  })

  $(document).on("click",".cancel-button",function(){
    $(this).prev().prev().css("display","inline-block");
    $(this).prev().css("display","none");
    $(this).css("display","none");
    $(this).parent().prev().children().prop( "readonly", true );
  })

  $(document).on("click",".ok-button",function(){

    var userId = $(this.parentNode.parentNode.parentNode).attr("user-id");
    var nodeInput = $(this).parent().prev().children()[0];
    var value =  nodeInput.value;
    var name = $(nodeInput).prop("name");
    var dataToSent = '{"' + name + '":"' + value + '"}';
    var okButton = this;
    $.ajax({
      type : "POST",
      url : contextPath + "/users/user/modify-account",
      contentType : "application/json;charset=utf-8",
      data : dataToSent,
      success : function(msg){
        if(msg==1){
          alert("修改成功")
          $(okButton.parentNode).prev().children().prop( "readonly", true );
          $(okButton).next().css("display","none");
          $(okButton).css("display","none");
          $(okButton).prev().css("display","inline-block");
        }
      },
      error : function(xhr,textStatus,errorThrown){
        alert("xhr:"+xhr.statusText+",textStatus:"+textStatus+",errorThrown:"+errorThrown);
      }
    });
  });
} 