<?php

namespace dashboard\controllers;

use dashboard\classes\BackendController;

/**
 * 默认控制器.
 * @login
 * @roles 管理员
 */
class IndexController extends BackendController {
	/**
	 * 默认控制方法.
	 */
	public function index() {
		$data = ['module' => 'Index'];

		// 你的代码写在这里
		return view($data);
	}
}