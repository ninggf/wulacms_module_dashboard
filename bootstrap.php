<?php
namespace dashboard;

use wulaphp\app\App;
use wulaphp\app\Module;

class DashboardModule extends Module {
	public function getName() {
		return '控制台';
	}

	public function getDescription() {
		return '基于jQuery; Vuejs; bootstrap(v3); element-ui等的控制台.';
	}

	public function getHomePageURL() {
		return 'https://www.wulacms.com/modules/dashboard';
	}

}

App::register(new DashboardModule());