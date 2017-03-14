<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <title>{'sitename'|cfg:'乌拉小站'} - 管理控制台V{$version}[{$appmode}]</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="{'wula/ui/app.css'|vendor}">
</head>
<body>
<div class="console-app " id="wula-app">
    <div class="app-topbar">
        <a href="{'siteurl'|cfg:'/'}" class="topbar-logo" target="_blank">
            <i class="fa fa-gg"></i>
        </a>
        <wula-topbar class="topbar-nav" ref="lefttopbar"></wula-topbar>
        <wula-topbar class="topbar-info" ref="righttopbar"></wula-topbar>
    </div>
    <wula-dashboard :sidebar-open="true" :sidebar-only="true" :sidebar-full="true" ref="dashboard"></wula-dashboard>
</div>
<script src="{'wula/ui/vendor/jquery/jquery.min.js'|vendor}"></script>
<script src="{'wula/ui/app.js'|vendor}"></script>
<script>
    {minify}
	$.wula.index({
		homeUrl : '{"~home"|app}',
		loginUrl: '{"~login"|app}'
	});
	$.wula.index.vue.$refs.lefttopbar.setMenus({$menu.left|json_encode});
	$.wula.index.vue.$refs.righttopbar.setMenus({$menu.right|json_encode});
	$.wula.index.vue.$refs.dashboard.setMenus({$menu.menus|json_encode});
    {/minify}
</script>
</body>
</html>