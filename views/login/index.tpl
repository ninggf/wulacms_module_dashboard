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
	<wula-login-page url="{'~login'|app}" method="post"></wula-login-page>
</div>

<script>
	new Vue({
		el:'#login-page'
	})
</script>
</body>
</html>