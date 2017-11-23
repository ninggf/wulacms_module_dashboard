<!DOCTYPE html>
<html class="app">
<head>
    <meta charset="UTF-8">
    <title>{'Dashboard'|t} | {$website.name} - {'wulacms'|t:$version}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    {combinate type='css' ver='1.0'}
        <link rel="stylesheet" href="{'wula/ui/css/ui.css'|vendor:'min'}"/>
    {'dashboard\headercss'|fire}
    {/combinate}
</head>
<body>
<div class="vbox wulaui">
    <header class="bg-dark dk header navbar navbar-fixed-top-xs">
        <div class="navbar-header aside-md">
            <a class="btn btn-link visible-xs" data-toggle="class:nav-off-screen,open" data-target="#nav,html">
                <i class="fa fa-bars"></i>
            </a>
            <a href="#" class="navbar-brand" data-toggle="fullscreen">
                <img src="{'logo2.svg'|assets}" class="m-r-sm"/>
                W<b class="text-danger">u</b>l<b class="text-success">a</b>C<b class="text-info">M</b>S<sup>&copy;</sup><sub>{$version}</sub>
            </a>
        </div>

        <div class="wula-nav-out" role="tab" data-widget data-target="#wulaui-workbench" id="dashboard-main-tabs">
            <div class="list">
                <b class="nav-btn-left">&pr;</b>
                <b class="nav-btn-right">&sc;</b>
                <ul class="wula-nav">
                    <li class="active">
                        <a href="#{'~home'|app}" title="{'Dashboard'|t}">
                            <span class="little"><span><i class="fa fa-home"></i>{'Dashboard'|t}</span></span>
                        </a>
                        <span class="tab-close none"><i>x</i></span>
                    </li>
                </ul>
            </div>
        </div>

    </header>
    <section id="wulacms-wrap">
        <section class="hbox stretch">
            <aside class="bg-light lter b-r aside-md hidden-print hidden-xs" id="nav">
                <section class="vbox">
                    <header class="header bg-light dk b-b clearfix">
                        <div class="clearfix">
                            <a href="#{'~core/user/account'|app}" class="pull-left thumb thumb-sm m-t-xs"
                               title="{'我的账户'|t}" style="margin-left:-6px">
                                <img id="my-avatar" src="{$passport->avatar|media}" class="img-circle">
                            </a>
                            <div class="hidden-nav-xs" style="padding-left: 40px">
                                <div class="h5 m-t-xs m-b-xs">你好，{$passport->nickname}</div>
                                <small class="text-muted">
                                    <i class="fa fa-clock-o"></i> <b id="dashtimer">{'Y-m-d H:i'|date}</b>
                                </small>
                            </div>
                        </div>
                    </header>
                    <section class="w-f scrollable">
                        <div class="slim-scroll" data-height="auto" data-disable-fade-out="true" data-distance="0"
                             data-size="5px" data-color="#333">
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
                    <footer class="footer lt hidden-xs b-t bg-light">
                        <a href="#nav" id="toggle-navi" data-toggle="class:nav-xs"
                           class="pull-right btn btn-sm btn-default btn-icon">
                            <i class="fa fa-angle-left text"></i>
                            <i class="fa fa-angle-right text-active"></i>
                        </a>
                        <div class="btn-group hidden-nav-xs">
                            <a class="btn btn-icon btn-sm btn-default" target="_blank" href="/"><i class="fa fa-home"></i></a>
                            <a class="btn btn-icon btn-sm btn-default" target="_blank" href="http://www.wulacms.com"><i
                                        class="fa fa-globe"></i></a>
                        </div>
                        {if $isDeveloper}
                            <a class="btn btn-icon btn-sm btn-default hidden-nav-xs" href="#{'~dashboard/doc'|app}"
                               title="帮助文档"><i class="fa fa-book text-info"></i> </a>
                        {/if}
                        <a class="btn btn-icon btn-sm btn-default hidden-nav-xs" href="{'~logout?ajax'|app}" data-ajax
                           data-confirm="你确定吗?" data-confirm-title="注销账户" data-confirm-theme="supervan"
                           data-confirm-autoclose="ok|10000" data-loading="1" data-block="1"><i
                                    class="fa fa-sign-out text-danger"></i></a>
                    </footer>
                </section>
            </aside>
            <section id="wulaui-workspace">
                <section class="hbox stretch">
                    <aside class="aside aside-md bg-white-only b-r hide" id="third-navi">
                        <section class="vbox">
                            <header class="header bg-light dk b-b clearfix">
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
                    <section id="wulaui-workbench"></section>
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
    <script src="{'wula/ui/js/datepicker/datepicker.min.js'|vendor}"></script>
    <script src="{'wula/ui/js/select2/select2.min.js'|vendor}"></script>
    <script src="{'wula/ui/js/plupload.min.js'|vendor}"></script>
    <script src="{'wula/ui/js/require.min.js'|vendor}"></script>
    <script src="{'wula/ui/js/app.js'|vendor:'min'}" type="text/javascript"></script>
{'wula/ui/lang'|vendor|i18n}
{'dashboard\footerjs'|fire}
{/combinate}
<script type="text/javascript">
	$(function () {
		setInterval(function () {
			var d          = new Date();
			var datestring = d.getFullYear() + "-" + ("0" + (d.getMonth() + 1)).slice(-2) + "-" + ("0" + d.getDate()).slice(-2) + " " + ("0" + d.getHours()).slice(-2) + ":" + ("0" + d.getMinutes()).slice(-2);
			$('#dashtimer').html(datestring);
			delete d, datestring;
		}, 10000);
		$(document).on('wula.need.login', function () {
			location.href = "{'~login'|app}" + (location.hash ? location.hash : '');
		});
		$.wulaUI.init({
			appConfig: {$appConfig},
			hash     : true,
			mode     : '{$appmode}',
			requirejs: {
				baseUrl: "{''|res}",
				paths  : {
					ztree       : '{"wula/ui/js/ztree/ztree.min"|vendor}',
					ztree_exhide: '{"wula/ui/js/ztree/exhide.min"|vendor}',
					ztree_check : '{"wula/ui/js/ztree/excheck.min"|vendor}',
					highlight   : '{"wula/ui/js/highlight/highlight.min"|vendor}',
					validator   : '{"wula/ui/js/validate/validate.min"|vendor}',
					jsgrid      : '{"wula/ui/js/jsgrid/jsgrid.min"|vendor}'
				},
				shim   : {
					ztree       : [],
					ztree_exhide: ['ztree'],
					ztree_check : ['ztree'],
					highlight   : [],
					jsgrid: []
				}
			}
		}, true);
	});
</script>
</body>
</html>