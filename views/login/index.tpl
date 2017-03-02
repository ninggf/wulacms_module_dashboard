<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="{'wula/ui/app.css'|vendor}">
    <script src="https://cdn.staticfile.org/jquery/3.1.1/jquery.min.js"></script>
    <script src="{'wula/ui/app.js'|vendor}"></script>
</head>
<style>
    body {
        position: relative;
    }

    .login-wrap {
        background-color: rgb(255, 255, 255);
        position: fixed;
        _position: absolute;
        top: 0;
        left: 0;
        height: 100%;
        width: 100%;
        min-width: 1000px;
        z-index: -10;
        background-position: center 0;
        background-repeat: no-repeat;
        background-size: cover;
        -webkit-background-size: cover;
        -o-background-size: cover;
        zoom: 1;
    }
</style>
<body>
<div class="login-wrap"
     style="background-image: url('https://ss0.bdstatic.com/k4oZeXSm1A5BphGlnYG/skin/823.jpg');"></div>

<div class="page-login" id="vue-login">
    <nav>
        <div class="pull-left">
            <a href="#" class="nav-link">首页</a>
        </div>
        <div class="pull-right">
            <a href="#" class="nav-link">加入我们</a>
            <a href="#" class="nav-link">设置</a>
            <div class="dropdown">
                <a href="#" class="dropdown-toggle nav-link" id="dropdownMenu1" data-toggle="dropdown">设置 <span
                            class="caret"></span> </a>
                <ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="dropdownMenu1">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container">
        <form action="{'~login'|app}" target="ajax" name="login" method="post">
            <div class="panel panel-body login-form">
                <div class="text-center">
                    <div class="icon-object border-slate-300 text-slate-300"><i class="icon-reading"></i></div>
                    <h4 class="content-group">
                        用户登录
                        <small class="display-block sr-only">Enter your credentials below</small>
                    </h4>
                </div>

                <div class="form-group has-feedback has-feedback-left">
                    <input type="text" class="form-control" placeholder="Username" name="username" autocomplete="off">
                    <div class="form-control-feedback">
                        <i class="fa fa-user"></i>
                    </div>
                </div>

                <div class="form-group has-feedback has-feedback-left">
                    <input type="password" class="form-control" placeholder="Password" name="password" autocomplete="off">
                    <div class="form-control-feedback">
                        <i class="fa fa-lock"></i>
                    </div>
                </div>

                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block">Sign in <i
                                class="icon-circle-right2 position-right"></i></button>
                </div>

                <div class="text-center">
                    <a href="#">Forgot password?</a>
                </div>
            </div>
        </form>

    </div>
</div>

<script>
	//检验
	$.wula.validate.init('login', {
		rules   : {
			username: {
				'required': true
			},
			password: 'required'
		},
		messages: {
			username: '用户名不能为空',
			password: '密码不能为空'
		}
	})
</script>
</body>
</html>