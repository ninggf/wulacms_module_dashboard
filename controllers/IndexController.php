<?php

namespace dashboard\controllers;

use core\model\UserTable;
use dashboard\classes\BackendController;
use dashboard\classes\DashboardUI;
use wulaphp\mvc\view\JsonView;

/**
 * 默认控制器.
 *
 * @roles 管理员
 */
class IndexController extends BackendController {

	public function index() {
		$ui = new DashboardUI();
		fire('dashboard\initUI', $ui);

		return view();
	}

	public function home() {
		return view();
	}

	public function users() {
		$table = new UserTable();
		$data  = $table->find()->page(1)->asc('id')->toArray();

		return ['items' => $data];
	}

	public function menu() {
		$ui         = new DashboardUI();
		$menu       = $ui->getMenu('home/ok/l', 1);
		$menu->name = '第三级面板';

		$menu       = $ui->getMenu('home/ok', 10);
		$menu->name = '第二级';

		$menu       = $ui->getMenu('home/', 1);
		$menu->name = '第一级';
		fire('dashboard\initMenu', $ui);

		return new JsonView($ui->menuData());
	}
}