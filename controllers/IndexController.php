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
			$system       = $ui->getMenu('system', '系统', 999999);
			$system->icon = 'fa fa-cogs';
			// 设置
			$setting       = $system->getMenu('setting', '设置', 999999);
			$setting->icon = 'fa fa-cogs';
			$setting->url  = App::hash('~setting');
			// 通用设置
			$base       = $setting->getMenu('base', '通用设置');
			$base->url  = $setting->url;
			$base->icon = 'fa fa-cogs';
		}

		fire('dashboard\initUI', $ui);
		$data = $ui->menuData();

		// 顶部左菜单
		$uileft = new DashboardUI();
		fire('dashboard\initLeftTopbar', $uileft);
		$m            = $uileft->getMenu('home', '管理控制台', 1);
		$m->url       = App::url('~');
		$lf           = $uileft->menuData();
		$data['left'] = $lf['menus'];

		$rightMenu = new DashboardUI();
		fire('dashboard\initRightTopbar', $rightMenu);
		$rf            = $rightMenu->menuData();
		$data['right'] = $rf['menus'];
		// 顶部用户菜单
		$userMenu = new DashboardUI();
		fire('dashboard\initUserTopbar', $userMenu);

		$m2        = $userMenu->getMenu('system-account-cp', '修改密码', 2);
		$m2->icon  = 'fa fa-lock';
		$m2->group = 'user';
		$m2->url   = App::hash('~core/user/change-password');

		$m2                            = $userMenu->getMenu('logout', __('Logout'), 999999);
		$m2->iconStyle                 = 'color:red';
		$m2->icon                      = 'fa fa-sign-out';
		$m2->url                       = App::url('~logout?ajax');
		$m2->data['confirm']           = __('Are your sure?');
		$m2->data['confirm-title']     = $m2->name . __('Account');
		$m2->data['confirm-theme']     = 'supervan';
		$m2->data['confirm-autoclose'] = 'ok|10000';
		$m2->data['loading']           = 1;
		$m2->data['block']             = 1;
		$m2->data['ajax']              = 'get';

		$rt = $userMenu->menuData(true);

		$data['user'] = $rt['menus'];

		$module = App::getModule('dashboard');

		$data   = ['menu' => $data, 'ui' => $ui, 'appmode' => APP_MODE, 'version' => $module->getCurrentVersion()];
		$groups = App::$prefix;
		unset($groups['check']);
		$data['appConfig'] = json_encode(['ids' => App::id2dir(null), 'groups' => $groups, 'base' => WWWROOT_DIR]);

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