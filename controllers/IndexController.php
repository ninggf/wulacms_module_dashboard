<?php

namespace dashboard\controllers;

use core\model\UserTable;
use dashboard\classes\BackendController;
use dashboard\classes\DashboardUI;
use wulaphp\app\App;

/**
 * 默认控制器.
 *
 * @roles 管理员
 */
class IndexController extends BackendController {

	public function index() {
		$ui = new DashboardUI();
		if ($this->passport->cando('m:system')) {
			$system = $ui->getMenu('system');
			// 系统
			$system->name = '系统';
			$system->icon = 'fa fa-cogs';
			$system->pos  = 999999;
			// 设置
			$setting       = $system->getMenu('setting');
			$setting->name = '设置';
			$setting->icon = 'fa fa-cogs';
			$setting->url  = App::hash('~setting');
			$setting->pos  = 999999;
			// 通用设置
			$base       = $setting->getMenu('base');
			$base->name = '通用设置';
			$base->url  = $setting->url;
			$base->icon = 'fa fa-cogs';
		}

		fire('dashboard\initUI', $ui);
		$data = $ui->menuData();
		// 顶部左菜单
		$uileft = new DashboardUI();
		fire('dashboard\initLeftTopbar', $uileft);
		$m            = $uileft->getMenu('home');
		$m->name      = '管理控制台';
		$m->pos       = 1;
		$m->url       = App::url('~');
		$m->target    = '_self';
		$lf           = $uileft->menuData();
		$data['left'] = $lf['menus'];

		// 顶部右菜单
		$uiright = new DashboardUI();
		fire('dashboard\initRightTopbar', $uiright);
		$m       = $uiright->getMenu('user');
		$m->icon = 'fa fa-user-o';
		$m->name = $this->passport->nickname;
		$m->pos  = 2;

		$m2                       = $m->getMenu('logout');
		$m2->iconStyle            = 'color:red';
		$m2->icon                 = 'fa fa-sign-out';
		$m2->name                 = '退出控制台';
		$m2->url                  = App::hash('~logout?ajax');
		$m2->target               = 'ajax';
		$m2->data['confirm']      = '你确定要退出吗?';
		$m2->data['confirmTitle'] = '退出';

		$m2        = $m->getMenu('cp');
		$m2->name  = '修改密码';
		$m2->icon  = 'fa fa-lock';
		$m2->pos   = 2;
		$m2->group = 'user';
		$m2->url   = App::hash('~core/user/change-password');

		$rt = $uiright->menuData(true);

		$data['right'] = $rt['menus'];
		$module        = App::getModule('dashboard');

		return view(['menu' => $data, 'ui' => $ui, 'appmode' => APP_MODE, 'version' => $module->getCurrentVersion()]);
	}

	public function home() {

		return view();
	}

	public function users() {
		$table = new UserTable();
		$data  = $table->find()->page(1)->asc('id')->toArray();

		return ['items' => $data];
	}
}