<?php

namespace dashboard {

	use dashboard\classes\DashboardSetting;
	use wula\cms\CmfModule;
	use wulaphp\app\App;
	use wulaphp\db\View;
	use wulaphp\io\Ajax;
	use wulaphp\io\Request;
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
			return '基于Bootstrap、jQuery、H5等技术的现代化管理控制台.';
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
			if (!$view) {
				if (Request::isAjaxRequest()) {
					$view = Ajax::fatal($message ? $message : '权限受限，请联系管理员', 403);
				} else {
					Response::respond(403, '权限受限，请联系管理员');
				}
			}

			return $view;
		}

		public function getVersionList() {
			$v['1.0.0'] = '初始化控制台模块';

			return $v;
		}
	}

	App::register(new DashboardModule());

	function get_system_settings() {
		return apply_filter('dashboard/settings', ['default' => new DashboardSetting()]);
	}
}

namespace {
	function smarty_modifiercompiler_tableset($params, $compiler) {
		$id     = $params [0];
		$reload = isset($params[1]) ? $params[1] : "''";

		return 'core\model\UserGridcfgModel::echoSetButton(' . $id . ',' . $reload . ')';
	}

	function smarty_modifiercompiler_tablehead($params, $compiler) {
		$id = $params [0];

		return 'core\model\UserGridcfgModel::echoHead(' . $id . ')';
	}

	function smarty_modifiercompiler_tablerow($params, $compiler) {
		$id     = $params [0];
		$data   = isset($params[1]) ? $params[1] : '[]';
		$extras = isset($params[2]) ? $params[2] : '[]';

		return 'core\model\UserGridcfgModel::echoRow(' . $id . ',' . $data . ',' . $extras . ')';
	}

	function smarty_modifiercompiler_tablespan($params, $compiler) {
		$id   = $params [0];
		$data = isset($params[1]) ? $params[1] : 0;

		return 'core\model\UserGridcfgModel::colspan(' . $id . ',' . $data . ')';
	}
}