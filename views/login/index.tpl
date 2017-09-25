<!DOCTYPE html>
<html lang="{$website.language}">
<head>
    <meta charset="UTF-8">
    <title>{'Login'|t} - {$website.name} - {'wulacms'|t:$version}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="{'wula/ui/css/ui.css'|vendor}">
    {combinate type='js' ver='1.0'}
        <script src="{'wula/ui/js/jquery.min.js'|vendor}"></script>
        <script src="{'wula/ui/js/bootstrap.min.js'|vendor}"></script>
        <script src="{'wula/ui/js/common.min.js'|vendor}"></script>
        <script src="{'wula/ui/js/dialog/notify.min.js'|vendor}"></script>
        <script src="{'wula/ui/js/dialog/dialog.min.js'|vendor}"></script>
        <script src="{'wula/ui/js/app.js'|vendor:'min'}"></script>
    {'wula/ui/lang'|vendor|i18n}
    {/combinate}
</head>
<body class="modal-open">
<div class="modal in wulaui" style="display: block;">
    <div class="modal-over">
        <div class="modal-center animated fadeInUp text-center" style="width:240px;margin:-80px 0 0 -120px;">
            <div class="thumb-md">
                <img src="{'logo2.svg'|assets}" class="img-circle b-a b-light b-3x" title="{'Be a happy wula!'|t}"/>
            </div>
            <div class="alert alert-danger m-t m-b text-left hidden" id="login-alert"></div>
            <div class="input-group dropdown m-b m-t">
                <input type="text" class="form-control text-sm" name="username" id="username"
                       placeholder="{'Username'|t}"/>
                <div class="input-group-btn">
                    <a class="btn btn-success"><i class="fa fa-user-o"></i></a>
                </div>
            </div>
            <div class="input-group">
                <input type="password" class="form-control text-sm" name="password"
                       placeholder="{'Enter password to continue'|t}" id="password"/>
                <div class="input-group-btn">
                    <a class="btn btn-success data-loading-text" data-ajax="post" id="login"
                       href="{'~dashboard/login'|app}"><i class="fa fa-arrow-right"></i></a>
                </div>
            </div>
            <p class="text-white h4 m-t m-b">
                <small>{'wulacms'|t:$version}<br/>&copy; 2017</small>
            </p>
        </div>
    </div>
</div>
<div class="modal-backdrop in"></div>
<script type="text/javascript">
	$(function () {
		var lang = {
			password: '{"Please enter your password."|t}',
			username: '{"Please enter your username."|t}'
		};

		$.wulaUI.init();
		$('#login').on('ajax.success', function (e, data) {
			if (data.code === 500) {
				$('#login-alert').html('<i class="fa fa-warning"></i><strong>' + $.lang.core.error + '</strong>' + data.message).removeClass('hidden');
			}
		}).on('ajax.build', function (e) {
			e.opts.data = {
				username: $('#username').val().trim(),
				password: $('#password').val()
			};
			if (!e.opts.data.username) {
				$.dialog({
					icon   : 'fa fa-warning',
					title  : $.lang.core.warning,
					type   : 'orange',
					content: lang.username
				});
				return false;
			}
			if (!e.opts.data.password) {
				$.dialog({
					icon   : 'fa fa-warning',
					title  : $.lang.core.warning,
					type   : 'orange',
					content: lang.password
				});
				return false;
			}
		});
	});
</script>
</body>
</html>