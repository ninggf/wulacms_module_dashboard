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
		$ui            = new DashboardUI();
		$setting       = $ui->getMenu('setting');
		$setting->name = '系统设置';
		$setting->icon = 'fa fa-cogs';
		$setting->pos  = 999999;

		fire('dashboard\initUI', $ui);
		$data = $ui->menuData();

		$uileft = new DashboardUI();
		fire('dashboard\initLeftTopbar', $uileft);
		$m            = $uileft->getMenu('home');
		$m->name      = '管理控制台';
		$m->pos       = 1;
		$m->url       = App::url('~');
		$m->target    = '_self';
		$lf           = $uileft->menuData();
		$data['left'] = $lf['menus'];

		$uiright = new DashboardUI();
		fire('dashboard\initRightTopbar', $uiright);
		$m       = $uiright->getMenu('user');
		$m->icon = 'fa fa-user-o';
		$m->name = $this->passport->nickname;

		$m2                  = $m->getMenu('logout');
		$m2->iconStyle       = 'color:red';
		$m2->icon            = 'fa fa-power-off';
		$m2->name            = '退出管理控制台';
		$m2->url             = App::url('~logout?ajax');
		$m2->target          = 'ajax';
		$m2->data['confirm'] = '你确定要退出吗?';

		$rt = $uiright->menuData();

		$data['right'] = $rt['menus'];

		return view(['menu' => $data, 'ui' => $ui, 'appmode' => APP_MODE]);
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