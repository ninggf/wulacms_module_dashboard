<?php
namespace dashboard;

use wulaphp\app\App;
use wulaphp\app\Module;
use wulaphp\io\Response;
use wulaphp\router\URLGroupSupport;

trait DashBoardPrefix {
	use URLGroupSupport;

	public static function urlGroup() {
		$backend = App::cfg('dashboard', 'backend');

		return ['~', $backend];
	}
}

class DashboardModule extends Module {
	use DashBoardPrefix;

	public function getName() {
		return '控制台';
	}

	public function getDescription() {
		return '基于jQuery; Vuejs; bootstrap(v3); element-ui等的控制台.';
	}

	public function getHomePageURL() {
		return 'https://www.wulacms.com/modules/dashboard';
	}

	/**
	 * @bind mvc\admin\needLogin
	 */
	public static function onNeedLogin() {
		Response::redirect(App::url('~login'));
	}

	/**
	 * @param string $message
	 *
	 * @bind mvc\admin\onDenied $message
	 */
	public static function onDenied($message) {

	}
}

App::register(new DashboardModule());