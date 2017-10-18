<?php
/*
 * 后台控制器，需要添加前缀时才继承此控制器.
 *
 * This file is part of wulacms.
 *
 * (c) Leo Ning <windywany@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace dashboard\classes;

use dashboard\DashBoardPrefix;
use wulaphp\app\App;
use wulaphp\mvc\controller\AdminController;
use wulaphp\mvc\view\SmartyView;

class BackendController extends AdminController {
	use DashBoardPrefix;

	public function beforeRun($action, $refMethod) {
		$domain = App::cfg('domain');
		if ($domain && $_SERVER['HTTP_HOST'] != $domain) {
			status_header(403);
			exit();
		}
		$view = parent::beforeRun($action, $refMethod);

		return $view;
	}

	public function afterRun($action, $view) {
		if ($view instanceof SmartyView) {
			$view->assign(['passport' => $this->passport]);
		}

		return $view;
	}
}