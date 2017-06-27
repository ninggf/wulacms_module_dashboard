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
		$userMenu = new DashboardUI();
		fire('dashboard\initUserTopbar', $userMenu);

		$m2        = $userMenu->getMenu('system-account-cp');
		$m2->name  = '修改密码';
		$m2->icon  = 'fa fa-lock';
		$m2->pos   = 2;
		$m2->group = 'user';
		$m2->badge = 10;
		$m2->url   = App::hash('~core/user/change-password');

		$m2                        = $userMenu->getMenu('logout');
		$m2->iconStyle             = 'color:red';
		$m2->iconCls               = 'afdasdf';
		$m2->icon                  = 'fa fa-sign-out';
		$m2->name                  = __('Logout');
		$m2->url                   = App::url('~logout?ajax');
		$m2->data['confirm']       = __('Are your sure?');
		$m2->data['confirm-title'] = $m2->name . __('Account');
		$m2->data['confirm-theme'] = 'supervan';
		$m2->data['loading']       = 1;
		$m2->data['block']         = 1;
		$m2->data['ajax']          = 'get';

		$rt = $userMenu->menuData(true);

		$data['userMenu'] = $rt['menus'];

		$module = App::getModule('dashboard');

		$data = ['menu' => $data, 'ui' => $ui, 'appmode' => APP_MODE, 'version' => $module->getCurrentVersion()];

		$data['appConfig'] = json_encode(['ids' => App::id2dir(null), 'groups' => App::$prefix, 'base' => WWWROOT_DIR]);

		$data['website']['name'] = App::cfg('sitename', 'Hello WulaCms');

		return view($data);
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