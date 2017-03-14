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
use wulaphp\io\Ajax;
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
		$module        = App::getModule('dashboard');

		return view(['appmode' => APP_MODE, 'version' => $module->getCurrentVersion()]);
	}

	/**
	 * @param string $username
	 * @param string $password
	 * @param string $captcha 验证码
	 *
	 * @nologin
	 * @return \wulaphp\mvc\view\View
	 */
	public function indexPost($username, $password, $captcha = '') {
		if ($this->passport->login([$username, $password, $captcha])) {
			return Ajax::redirect(App::url('~'));
		} else {
			return Ajax::error($this->passport->error);
		}
	}
}