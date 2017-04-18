<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <title>{'sitename'|cfg:'乌拉小站'} - 管理控制台V{$version}[{$appmode}]</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="{'wula/ui/styles/ui.css'|vendor}">
    <style>
        #wula-no-body {
            position: absolute;
            left: 0;
            top: 0;
            height: 100%;
            width: 100%;
            background-size: 50% auto;
            background-repeat: no-repeat;
            background-position: 50% 50%;
            background-image: url({'logo.svg'|assets});
        }

        #wula-no-body:after {
            content: '';
            display: table-cell;
            position: absolute;
            left: 0;
            top: 0;
            height: 100%;
            width: 100%;
            background: rgba(249, 249, 249, 0.7);
        }
    </style>
    <script src="{'wula/ui/ui.js'|vendor}"></script>
</head>
<body>
<div class="console-app " id="wula-app">

    <wula-topbar>
        <a href="{'siteurl'|cfg:'/'}" class="topbar-logo" target="_blank">
            <i class="fa fa-gg"></i>
        </a>
        <wula-topbar-group ref="lefttopbar" class="pull-left">

        </wula-topbar-group>

        <wula-topbar-group ref="righttopbar" class="pull-right">

        </wula-topbar-group>
    </wula-topbar>

    <wula-dashboard :sidebar-open="false" :sidebar-only="true" :sidebar-full="true" ref="dashboard"></wula-dashboard>
</div>
<script>

	Wula.index = Wula.dashboard({
		homeUrl : '{"~home"|app}',
		loginUrl: '{"~login"|app}'
	});
	Wula.index.$refs.lefttopbar.setMenus({$menu.left|json_encode});
	Wula.index.$refs.righttopbar.setMenus({$menu.right|json_encode});
	Wula.index.$refs.dashboard.setMenus({$menu.menus|json_encode});
</script>
</body>
</html>

