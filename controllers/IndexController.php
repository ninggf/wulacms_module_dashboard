<?php

namespace dashboard\controllers;

use dashboard\classes\BackendController;
use dashboard\classes\DashboardUI;
use wulaphp\app\App;
use function dashboard\get_system_settings;

/**
 * 默认控制器.
 *
 * @roles 管理员
 */
class IndexController extends BackendController {

	public function index() {
		$ui = new DashboardUI();
		if ($this->passport->cando('m:system')) {
			$system       = $ui->getMenu('system', '系统', 999999);
			$system->icon = 'fa fa-cogs';
			// 设置
			if ($this->passport->cando('m:system/setting')) {
				$setting       = $system->getMenu('setting', '设置', 999999);
				$setting->icon = 'fa fa-cogs';
				$setting->url  = App::hash('~setting');
				//通知其它模块提供配置
				$settings = get_system_settings();
				if ($settings) {
					/**@var \dashboard\classes\Setting $cfg */
					foreach ($settings as $sid => $cfg) {
						if ($this->passport->cando($sid . ':system/setting')) {
							$base      = $setting->getMenu($sid, $cfg->getName());
							$base->url = $setting->url . '/' . $sid;
						}
					}
				}
				$setting->url .= '/default';
			}
		}

		fire('dashboard\initUI', $ui);
		$data = $ui->menuData();

		// 顶部左菜单
		$uileft = new DashboardUI();
		fire('dashboard\initLeftTopbar', $uileft);
		$m            = $uileft->getMenu('home', '管理控制台', 1);
		$m->url       = App::url('~');
		$lf           = $uileft->menuData();
		$data['left'] = $lf['menus'];

		$module = App::getModuleById('dashboard');

		$data   = ['menu' => $data, 'ui' => $ui, 'appmode' => APP_MODE, 'version' => $module->getCurrentVersion()];
		$groups = App::$prefix;
		unset($groups['check']);

		$data['appConfig'] = json_encode([
			'ids'    => App::id2dir(null),
			'groups' => $groups,
			'base'   => WWWROOT_DIR,
			'medias' => apply_filter('get_media_domains', null),
			'assets' => WWWROOT_DIR . ASSETS_DIR . '/'
		]);

		$data['website']['name'] = App::cfg('name', 'Hello WulaCms');
		$data['isDeveloper']     = $this->passport->is('开发人员');

		return view($data);
	}

	public function home() {
		return view();
	}

}