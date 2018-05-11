<#assign ctx=request.getContextPath()/>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>登录</title>
    <link rel="stylesheet" href="${ctx}/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="${ctx}/assets/css/admin.css">
    <link rel="stylesheet" href="${ctx}/assets/css/app.css">
    <script src="${ctx}/assets/js/jquery.min.js"></script>
    <script src="${ctx}/assets/js/amazeui.min.js"></script>
    <script src="${ctx}/assets/js/app.js"></script>
    <script src="${ctx}/assets/js/jquery.form.js"></script>
</head>
<body data-type="login">
<div class="am-g myapp-login">
    <div class="myapp-login-logo-block  tpl-login-max">
        <div class="myapp-login-logo-text">
            <div class="myapp-login-logo-text">
                后台管理系统&nbsp;&nbsp;&nbsp;&nbsp;<i class="am-icon-skyatlas"></i>&nbsp;&nbsp;&nbsp;&nbsp;登录
            </div>
        </div>
        <div class="am-u-sm-10 login-am-center">
            <form class="am-form" id="dataForm">
                <fieldset>
                    <div class="am-form-group" style="margin-bottom: 10px;">
                        <input type="text" name="account" id="account" placeholder="输入用户名">
                    </div>
                    <div class="am-form-group">
                        <input type="password" name="pwd" id="pwd" placeholder="输入密码">
                    </div>
                    <div class="am-form-group error-info">
                    </div>
                    <p>
                        <button type="button" class="am-btn am-btn-default">登录</button>
                    </p>
                </fieldset>
            </form>
        </div>
    </div>
</div>
<script>
    $(".am-btn-default").click(function () {
        var account=$("#account").val();
        var pwd=$("#pwd").val();
        var $errorinfo=$(".error-info");
        $errorinfo.empty();
        if(account&&pwd){
            $('#dataForm').ajaxSubmit({
                url: '${ctx}/home.do',
                type: 'POST',
                dataType: 'json',
                cache:false,
                success: function (res) {
                    if (res.code === 200) {
                        var url = "${ctx}/index.do";
                        $(window.location).prop('href', url);
                    }else{
                        $errorinfo.append('<br/><div class="am-alert am-alert-danger" style="border-radius: 6px;padding: .625em;"><p>'+res.message+'</p></div>');
                    }
                }
            });
        }else{
            $errorinfo.append('<br/><div class="am-alert am-alert-warning" style="border-radius: 6px;padding: .625em;"><span>用户名密码不能为空</span></div>');
        }
    });
</script>
</body>
</html>