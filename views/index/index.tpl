<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <title>wulacms dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="{'wula/ui/app.css'|vendor}">
    <script src="https://cdn.staticfile.org/jquery/3.1.1/jquery.min.js"></script>
    <script src="{'wula/ui/app.js'|vendor}"></script>
</head>
<body>

<div class="console-app " id="wula-app">
    <div class="app-topbar">
        <a href="#{'~home'|app}" class="topbar-logo">
            <i class="fa fa-cloud"></i>
        </a>
        <wula-topbar class="topbar-nav" ref="topbar-left"></wula-topbar>
        <wula-topbar class="topbar-info" ref="topbar-right"></wula-topbar>
    </div>

    <div class="app-body " :class="{ 'app-sidebar-full':appSidebarFull }">
        <wula-sidebar :menus="menus" :is-open="true" :is-only="false"></wula-sidebar>
        <wula-product>
            <wula-sub-menu :subMenus="subMenus"></wula-sub-menu>
            <wula-product-body></wula-product-body>
        </wula-product>
    </div>

</div>

<script>
	var wulaVue;
	$(function () {
		wulaVue = $.wula.index({
			dashboard     : '#{"~home"|app}',
			menuUrl       : '{"~menu"|app}',
			loginUrl      : '{"~login"|app}',
			appSidebarFull: true
		});
	});
</script>
</body>
</html>
