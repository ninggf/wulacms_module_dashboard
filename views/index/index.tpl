<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <title>wulacms dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="{'wula/ui/ui/app.css'|vendor}">
    <script src="https://cdn.staticfile.org/jquery/3.1.1/jquery.min.js"></script>
    <script src="{'wula/ui/ui/app.js'|vendor}"></script>
</head>
<body>

<div class="console-app " id="wula-app">
    <div class="app-topbar">
        <a href="#" class="topbar-logo">
            <i class="fa fa-cloud"></i>
        </a>
        <div class="topbar-nav">
            <div class="topbar-info-item">
                <a href="#" class="topbar-btn">帮助文档 <span class="topbar-btn-label">12</span></a>
            </div>
            <div class="dropdown topbar-info-item">
                <a href="#" class="topbar-btn" data-toggle="dropdown"><i class="fa fa-user"></i> 1530****777 <span
                            class="caret"></span></a>

                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
                    <li role="presentation" class="disabled"><a role="menuitem" tabindex="-1" href="#">Something else
                            here</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
                </ul>
            </div>
        </div>

        <div class="topbar-info">
            <div class="topbar-info-item">
                <a href="#zine/home/help" class="topbar-btn">帮助文档</a>
            </div>
            <div class="topbar-info-item">
                <a href="#" class="topbar-btn"><i class="fa fa-android"></i> 手机版</a>
            </div>
            <div class="dropdown topbar-info-item">
                <a href="#" class="topbar-btn" data-toggle="dropdown"><i class="fa fa-user"></i> 1530****777 <span
                            class="caret"></span></a>

                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
                    <li role="presentation" class="disabled"><a role="menuitem" tabindex="-1" href="#">Something else
                            here</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="{'~logout'|app}">退出</a></li>
                </ul>
            </div>
            <div class="topbar-info-item">
                <div class="dropdown">
                    <button class="btn topbar-btn dropdown-toggle" type="button" id="dropdownMenu1"
                            data-toggle="dropdown">

                        Dropdown
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
                        <li role="presentation" class="disabled"><a role="menuitem" tabindex="-1" href="#">Something
                                else here</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="app-body " :class="{ 'app-sidebar-full':appSidebarFull }">
        <div class="app-sidebar">
            <div class="app-sidebar-inner">
                <div class="app-sidebar-fold fa" @click="appSidebarFull = !appSidebarFull"></div>
                <div class="sidebar-nav" v-for="menu in menus">
                    <div class="sidebar-nav-head" v-if="menu.name">
                        <span class="sidebar-title-icon"> <i class="fa fa-caret-down"></i> </span>
                        <span class="sidebar-title-text" v-cloak>{{ menu.name }}</span>
                        <span class="sidebar-title-manage"><!-- Todo:: --></span>
                    </div>
                    <ul class="sidebar-nav-body" :style="{ height: (menu.child.length * 40)+'px' }">
                        <li v-for="subMenu in menu.child" :class="{ 'active':parentUrl==subMenu.url }">
                            <el-tooltip :content="subMenu.title" placement="right" :disabled="appSidebarFull">
                                <a :href="subMenu.url">
                                    <span class="sidebar-item-icon" v-html="subMenu.icon"></span>
                                    <span class="sidebar-item-title" v-cloak> {{subMenu.name}} </span>
                                </a>
                            </el-tooltip>

                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="app-product " :class="{ 'app-product-navbar-full':subMenus.length }">

            <!--二级菜单折叠按钮-->
            <div id="wula-sub-menu" v-show="subMenus.length">
                <div class="app-product-navbar">
                    <div class="product-navbar-header">
                        {{ parentName }}
                    </div>
                    <div class="product-nav-list">
                        <ul>
                            <li v-for="sub in subMenus" :class="{ 'active':subUrl==sub.url }" class="nav-showchild">

                                <a :href="showUrl(sub.url)" :class="{ 'nav-tree-link':hasChild(sub.child)}">
                                    <div class="nav-icon"></div>
                                    <div class="nav-title">{{ sub.name }}</div>
                                </a>

                                <ul v-if="hasChild(sub.child)">
                                    <li v-for="ssub in sub.child" :class="{ 'active':subUrl==ssub.url }">
                                        <a :href="showUrl(ssub.url)">
                                            <div class="nav-icon"></div>
                                            <div class="nav-title">{{ ssub.name }}</div>
                                        </a>
                                    </li>

                                </ul>

                            </li>

                        </ul>
                    </div>
                </div>
                <div class="app-product-navbar-collapse ">
                    <div class="product-navbar-collapse-inner">
                        <div class="product-navbar-collapse-icon fa"></div>
                    </div>
                </div>
            </div>

            <div class="app-product-body">
                <div class="app-product-body-inner" id="wula-body">
                    <!-- 工作内容区 -->
                </div>

            </div>

        </div>
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
