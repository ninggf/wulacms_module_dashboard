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
use wulaphp\io\Ajax;
use wulaphp\io\Request;

/**
 * 退出登录.
 *
 * @package dashboard\controllers
 */
class LogoutController extends BackendController {

	public function index() {
		$this->passport->logout();
		if (Request::isAjaxRequest() || rqset('ajax')) {
			return Ajax::redirect(App::url('~login'));
		}
		App::redirect('~login');
	}
}