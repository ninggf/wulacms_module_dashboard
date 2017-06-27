<!DOCTYPE html>
<html lang="{$website.language}" class="app">
<head>
    <meta charset="UTF-8">
    <title>{'Dashboard'|t} - {$website.name} - {'wulacms'|t:$version}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="{'wula/ui/css/ui.css'|vendor:'min'}"/>
</head>
<body>
<div class="vbox wulaui">
    <header class="bg-dark dk header navbar navbar-fixed-top-xs">
        <div class="navbar-header aside-md">
            <a class="btn btn-link visible-xs" data-toggle="class:nav-off-screen,open" data-target="#nav,html">
                <i class="fa fa-bars"></i>
            </a>
            <a href="#" class="navbar-brand" data-toggle="fullscreen"><img src="{'logo2.svg'|assets}" class="m-r-sm">WulaCMS</a>
            <a class="btn btn-link visible-xs" data-toggle="dropdown" data-target=".nav-user">
                <i class="fa fa-cog"></i>
            </a>
        </div>
        <ul class="nav navbar-nav navbar-right m-n hidden-xs nav-user">
            <li class="dropdown hidden-xs">
                <a href="#" class="dropdown-toggle dker" data-toggle="dropdown"><i class="fa fa-fw fa-search"></i></a>
                <section class="dropdown-menu aside-xl animated fadeInUp">
                    <section class="panel bg-white">
                        <form role="search">
                            <div class="form-group wrapper m-b-none">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="{'Search'|t}">
                                    <span class="input-group-btn">
                      <button type="submit" class="btn btn-info btn-icon"><i class="fa fa-search"></i></button>
                    </span>
                                </div>
                            </div>
                        </form>
                    </section>
                </section>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <span class="thumb-sm avatar pull-left">
                        <img src="{'avatar.jpg'|assets}"/>
                    </span>
                    {$passport->nickname} <b class="caret"> </b>
                </a>
                <ul class="dropdown-menu animated fadeInRight">
                    <span class="arrow top"></span>
                    {foreach $menu.userMenu as $m}
                        {if $m.name == 'divider'}
                            <li class="divider"></li>
                        {else}
                            <li id="umi-li-{$m.id}" class="{$m.textCls}" style="{$m.textStyle}">
                                <a href="{$m.url|default:'#'}" id="navi-{$m.id}" {$m.h5datas}>
                                    {if $m.icon}
                                        <i class="{$m.icon}" {if $m.iconStyle}style="{$m.iconStyle}"{/if}></i>
                                    {/if}
                                    {$m.name}
                                    {if $m.badge}
                                        <span id="umi-badge-{$m.id}"
                                              class="badge bg-danger pull-right">{$m.badge}</span>
                                    {/if}
                                </a>
                            </li>
                        {/if}
                    {/foreach}
                </ul>
            </li>
        </ul>
    </header>
    <section>
        <section class="hbox stretch">
            <aside class="bg-light lter b-r aside-md hidden-print hidden-xs" id="nav">
                <section class="vbox">
                    <header class="header bg-primary lter text-center clearfix">
                        <div class="btn-group">
                            <button type="button" class="btn btn-sm btn-dark btn-icon"><i class="fa fa-plus"></i>
                            </button>
                            <div class="btn-group hidden-nav-xs">
                                <button type="button" class="btn btn-sm btn-primary dropdown-toggle"
                                        data-toggle="dropdown" aria-expanded="false">
                                    {'Shortcuts'|t}
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu text-left">
                                    <span class="arrow top"></span>
                                </ul>
                            </div>
                        </div>
                    </header>
                    <section class="w-f scrollable">
                        <div class="slim-scroll" data-height="auto" data-disable-fade-out="true" data-distance="0"
                             data-size="5px" data-color="#333333">
                            <nav class="nav-primary hidden-xs">
                                <ul class="nav">
                                    {foreach $menu.menus as $navi}
                                        <li>
                                            <a id="navi-{$navi.id}" class="{$navi.textCls}"
                                               href="{$navi.url|default:'#'}" {$navi.h5datas} style="{$navi.textStyle}">
                                                {if $navi.badge}
                                                    <b class="badge bg-danger pull-right">{$navi.badge}</b>
                                                {/if}
                                                <i class="{$navi.icon|default:'fa fa-hand-o-right'} icon"
                                                   style="{$navi.iconStyle}">
                                                    <b class="{$navi.iconCls|default:'bg-danger dk'}"></b>
                                                </i>
                                                {if $navi.child}
                                                    <span class="pull-right">
                                                      <i class="fa fa-angle-down text"></i>
                                                      <i class="fa fa-angle-up text-active"></i>
                                                    </span>
                                                {/if}
                                                <span>{$navi.name}</span>
                                            </a>
                                            {if $navi.child}
                                                <ul class="nav lt">
                                                    {foreach $navi.child as $nna}
                                                        <li>
                                                            <a id="navi-{$navi.id}-{$nna.id}" class="{$nna.textCls}"
                                                               href="{$nna.url|default:'#'}" {$nna.h5datas}
                                                               style="{$nna.textStyle}">
                                                                {if $nna.badge}
                                                                    <b class="badge bg-danger pull-right">{$nna.badge}</b>
                                                                {/if}
                                                                <i class="{$nna.icon|default:'fa fa-angle-right'}"
                                                                   style="{$nna.iconStyle}"></i>
                                                                <span>{$nna.name}</span>
                                                            </a>
                                                            {if $nna.child}
                                                                {capture append="_thirdNaviItems_"}
                                                                    <ul class="nav hide"
                                                                        id="navi-{$navi.id}-{$nna.id}-sub"
                                                                        data-name="{$nna.name}">
                                                                        {foreach $nna.child as $nta}
                                                                            <li class="b-b b-light">
                                                                                <a id="navi-{$navi.id}-{$nna.id}-{$nta.id}"
                                                                                   href="{$nta.url|default:'#'}"
                                                                                   class="{$nta.textCls}" {$nta.h5datas}
                                                                                   style="{$nta.textStyle}">
                                                                                    <i class="fa fa-chevron-right pull-right m-t-xs text-xs icon-muted"
                                                                                       style="{$nta.iconStyle}"></i>
                                                                                    {$nta.name}
                                                                                </a>
                                                                            </li>
                                                                        {/foreach}
                                                                    </ul>
                                                                {/capture}
                                                            {/if}
                                                        </li>
                                                    {/foreach}
                                                </ul>
                                            {/if}
                                        </li>
                                    {/foreach}
                                </ul>
                            </nav>
                        </div>
                    </section>
                    <footer class="footer lt hidden-xs b-t b-light">
                        <a href="#nav" data-toggle="class:nav-xs" class="pull-right btn btn-sm btn-default btn-icon">
                            <i class="fa fa-angle-left text"></i>
                            <i class="fa fa-angle-right text-active"></i>
                        </a>
                        <div class="btn-group hidden-nav-xs">
                            <a class="btn btn-icon btn-sm btn-default" href="/"><i class="fa fa-home"></i></a>
                            <a class="btn btn-icon btn-sm btn-default"><i class="fa fa-facebook"></i></a>
                        </div>
                    </footer>
                </section>
            </aside>
            <section id="wulaui-workspace">
                <section class="hbox stretch">
                    <aside class="aside aside-md bg-white b-r hide" id="third-navi">
                        <section class="vbox">
                            <header class="header bg-light dk">
                                <button class="btn btn-icon btn-default btn-sm pull-right visible-xs m-r-xs"
                                        data-toggle="class:show" data-target="#third-navi-item"><i
                                            class="fa fa-reorder"></i></button>
                                <p class="h4" id="third-menu-name"></p>
                            </header>
                            <section id="third-navi-item" class="hidden-xs scrollable">
                                <div class="slim-scroll" data-height="100%" data-disable-fade-out="true"
                                     data-distance="0" data-size="5px" data-color="#333333">
                                    <section class="nav-third">
                                        {foreach $_thirdNaviItems_ as $_thridNaviItem_}
                                            {$_thridNaviItem_}
                                        {/foreach}
                                    </section>
                                </div>
                            </section>
                        </section>
                    </aside>
                    <!-- 工作区开始 -->
                    <aside id="wulaui-workbench" class="wulaui">

                    </aside><!-- 工作区结束 -->
                </section>
                <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen, open"
                   data-target="#nav,html"></a>
            </section>
        </section>
    </section>
</div>
{combinate type='js' ver='1.0'}
    <script src="{'wula/ui/js/jquery.min.js'|vendor}"></script>
    <script src="{'wula/ui/js/bootstrap.min.js'|vendor}"></script>
    <script src="{'wula/ui/js/common.min.js'|vendor}"></script>
    <script src="{'wula/ui/js/slimscroll/slimscroll.min.js'|vendor}"></script>
    <script src="{'wula/ui/js/dialog/notify.min.js'|vendor}"></script>
    <script src="{'wula/ui/js/dialog/dialog.min.js'|vendor}"></script>
    <script src="{'wula/ui/js/app.js'|vendor:'min'}"></script>
{'wula/ui/lang'|vendor|i18n}
{/combinate}
<script type="text/javascript">
	$(function () {
		$.wulaUI.init({
			hash: true
		}, true);
	});
</script>
</body>
</html>