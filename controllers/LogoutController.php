<?php
/*
 * 退出登录.
 *
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

/**
 * 退出登录.
 *
 * @package dashboard\controllers
 */
class LogoutController extends BackendController {

	public function index() {
		$this->passport->logout();
		App::redirect('~login');
	}
}