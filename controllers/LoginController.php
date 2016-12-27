<?php
/*
 * This file is part of wulacms.
 *
 * (c) Leo Ning <windywany@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace dashboard\controllers;

use dashboard\classes\BackendController;
use wulaphp\app\App;
use wulaphp\io\Response;

class LoginController extends BackendController {
	/**
	 * @return \wulaphp\mvc\view\SmartyView
	 * @nologin
	 */
	public function index() {
		if ($this->passport->isLogin) {
			Response::redirect(App::url('~'));
		}

		//TODO: 完成登录界面操作.
		return view();
	}

	/**
	 * @nologin
	 */
	public function indexPost() {
		//TODO: 完成登录操作.
		Response::redirect(App::url('~'));
	}
}