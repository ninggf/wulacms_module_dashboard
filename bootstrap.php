<?php

namespace dashboard;

use wula\cms\CmfModule;
use wulaphp\app\App;
use wulaphp\db\View;
use wulaphp\io\Response;
use wulaphp\router\URLGroupSupport;

trait DashBoardPrefix {
	use URLGroupSupport;

	public static function urlGroup() {
		$backend = App::cfg('dashboard', 'backend');

		return ['~', $backend];
	}
}

/**
 * Class DashboardModule
 * @package dashboard
 * @group   core
 */
class DashboardModule extends CmfModule {
	use DashBoardPrefix;

	public function getName() {
		return '控制台';
	}

	public function getDescription() {
		return '基于jQuery; Vuejs; bootstrap(v3); element-ui等的现代化控制台.';
	}

	public function getHomePageURL() {
		return 'https://www.wulacms.com/modules/dashboard';
	}

	public function getDependences() {
		$d['core'] = '*';

		return $d;
	}

	/**
	 * @param $view
	 *
	 * @filter mvc\admin\needLogin
	 */
	public static function onNeedLogin($view) {
		Response::redirect(App::url('~login'));

		return $view;
	}

	/**
	 * @param mixed  $view
	 * @param string $message
	 *
	 * @filter mvc\admin\onDenied $message
	 * @return View
	 */
	public static function onDenied($view, $message) {
		return $view;
	}

	public function getVersionList() {
		$v['1.0.0'] = '';

		return $v;
	}
}

App::register(new DashboardModule());