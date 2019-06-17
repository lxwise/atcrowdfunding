<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="keys" content="">
    <meta name="author" content="">
	<link rel="stylesheet" href="${APP_PATH}/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${APP_PATH}/css/font-awesome.min.css">
	<link rel="stylesheet" href="${APP_PATH}/css/login.css">
	<style>


	</style>
  </head>
  <body>
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <div><a class="navbar-brand" href="index.html" style="font-size:32px;">尚筹网-创意产品众筹平台</a></div>
        </div>
      </div>
    </nav>

    <div class="container">

      <form class="form-signin" role="form">
        <h2 class="form-signin-heading"><i class="glyphicon glyphicon-log-in"></i> 用户注册</h2>
		  <div class="form-group has-success has-feedback">
			<input type="text" class="form-control" id="loginacct" name="loginacct" placeholder="请输入登录账号" autocomplete="off">
			<span class="glyphicon glyphicon-user form-control-feedback"></span>
		  </div>
		  <div class="form-group has-success has-feedback">
			<input type="password" class="form-control" id="userpswd" name="userpswd" placeholder="请输入登录密码" autocomplete="off" style="margin-top:10px;">
			<span class="glyphicon glyphicon-lock form-control-feedback"></span>
		  </div>
		  
		<div class="form-group has-success has-feedback">
			<input type="text" class="form-control" id="username" placeholder="请输入用户名称" autocomplete="off" style="margin-top:10px;">
			<span class="glyphicon glyphicon-user form-control-feedback"></span>
		  </div>
		  	  
		  <div class="form-group has-success has-feedback">
			<input type="text" class="form-control" id="email" name="email" placeholder="请输入邮箱" autocomplete="off" style="margin-top:10px;">
			<span class="glyphicon glyphicon glyphicon-envelope form-control-feedback"></span>
		  </div>
		  <div class="form-group has-success has-feedback">
			<select class="form-control" >
                <option>会员</option>
               
            </select>
		  </div>
        <div class="checkbox">
          <label>
            忘记密码
          </label>
          <label style="float:right">
            <a href="${APP_PATH}/login">我有账号</a>
          </label>
        </div>
        
         <button id="insertBtn" type="button" class="btn btn-lg btn-success btn-block"> 注册</button>
      </form>
    </div>
     <script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
    <script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH}/script/docs.min.js"></script>
	<script src="${APP_PATH}/layer/layer.js"></script>
       <script type="text/javascript">
			    
			    $("#insertBtn").click(function(){ 
			    	//非空校验
			        var loginacct = $("#loginacct").val();
			        //表单元素的value取值不会是null,取值是空字符串
			        if (loginacct == "") {
			   		//alert("用户登录账号不能为空,请输入!");//time:提示时间,icon:图标样式,shift:调出样式
			   		layer.msg("用户登录账号不能为空,请输入!", {time:2000, icon:5, shift:6}, function() {
			   		
			   		});
			   		return false;
			   	}
			        
			        if (loginacct.length>12) {
                        layer.msg("登录账号必须小于12位，请重新输入", {time:2000, icon:5, shift:6}, function(){
                        	
                        }); 
                    
                        return false;
			    	}
			        
			        
			        var userpswd = $("#userpswd").val();
			        if (userpswd == "") {
			   		//alert("用户登录密码不能为空,请输入!");
			   		layer.msg("用户登录密码不能为空,请输入!", {time:2000, icon:5, shift:6}, function() {
			   			
			   		});
			   		 return false;
			   	}
			        var userpswd = $("#userpswd").val();
			        if (userpswd.length>12) {
			   		layer.msg("用户登录密码必须小于12位,请重新输入!", {time:2000, icon:5, shift:6}, function() {
			   			
			   		});
			   		 return false;
			   	}    
			    	var username = $("#username").val();
			    	if ( username.length>12) {
                        layer.msg("用户名必须小于12位，请重新输入", {time:2000, icon:5, shift:6}, function(){
                        	
                        }); 
                    
                        return false;
			    	}
			        
			        var email = $("#email").val();
			        var email_reg=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/
				    	if (!email_reg.test(email)) {
	                        layer.msg("邮箱格式出错，请重新输入", {time:2000, icon:5, shift:6}, function(){
	                        	
	                        }); 
	                    
	                        return false;
			   	}
			    	/* var email = $("#email").val();
			    	var email_reg=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/
			    	if (!email_reg.test(email)) {
                        layer.msg("邮箱格式出错，请重新输入", {time:2000, icon:5, shift:6}, function(){
                        	
                        }); 
                    
                        return false;
			    	}
    */
			    	
			    	var loadingIndex = null;
			    	$.ajax({
			    		type : "POST",
			    		url  : "insertU",
			    		data : {
			    			"loginacct" : loginacct,
			    			"userpswd"  : $("#userpswd").val(),
			    			"username"	: $("#username").val(),
			    			"email"     : $("#email").val()
			    		},
			    		beforeSend : function() {
			    			loadingIndex = layer.msg('处理中', {icon: 16});
			    		},
			    		success : function(result) {
			    			layer.close(loadingIndex);
			    			if ( result.success ) {
		                        layer.msg("用户注册成功,请登录", {time:1000, icon:6}, function(){
		                        	window.location.href = "${APP_PATH}/login";
		                        });
			    			} else {
		                        layer.msg("用户注册失败，请重新操作", {time:2000, icon:5, shift:6}, function(){
		                        	
		                        });
			    			}
			    		}
			    	}); 
			    });
         
        </script>
  </body>
</html>