<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <title>登录 - 管理控制台V{$version}[{$appmode}]</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="{'wula/ui/styles/ui.css'|vendor}">
	<script src="{'wula/ui/ui.js'|vendor}"></script>
	<style>
		body{
			background-color: #001a30;
		}
	</style>
</head>

<body>
<div id="login-page">
	<wula-login-page url="{'~login'|app}" method="post">
		<a href="{'siteurl'|cfg:'/'}" slot="brand">{'sitename'|cfg:'乌拉小站'}</a>

        <li class="main-nav__link" slot="menu"><a href="{'siteurl'|cfg:'/'}">首页</a></li>
        <li class="main-nav__link" slot="menu"><a href="http://wulacms.com/" target="_blank">支持</a></li>

        <p slot="welcome">立即管理您的网站</p>

        <div slot="meesage">
            <div class="waitlist__badge">
                <span class="badge">赞</span>
            </div>
            <div>
                <h3 class="waitlist__title"><a href="">wulacms 1.0 马上就要发布啦~</a></h3>
            </div>
        </div>

        <li class="footer-nav__link" slot="footer">
            <a href="http://wulacms.com/" target="_blank">
                <i class="fa fa-gg"></i> 本网站由wulacms提供动力 <i class="fa fa-gg"></i>
            </a>
        </li>
	</wula-login-page>
</div>

<script>
	new Vue({
		el:'#login-page'
	})
</script>
</body>
</html>