<?php
/*
 * This file is part of wulacms.
 *
 * (c) Leo Ning <windywany@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace dashboard\classes;

use core\model\SettingsTable;
use rest\classes\RestFulClient;
use wulaphp\app\App;
use wulaphp\cache\RtCache;

/**
 * Class Setting
 * @package dashboard\classes
 */
abstract class Setting {
	/**
	 * 保存配置.
	 *
	 * @param array  $data    数据
	 * @param string $setting 配置
	 * @param string $group   配置组
	 *
	 * @return bool 成功返回true，反之false。
	 */
	public function save($data, $setting, $group = '') {
		if ($group) {
			$setting .= '/' . $group;
		}
		$table = new SettingsTable();

		try {
			$cfgs = $table->saveSetting($setting, $data);
			if (is_array($cfgs)) {
				RtCache::add('cfg.' . $setting, $cfgs);
			}
			$this->sync($setting);

			return true;
		} catch (\PDOException $e) {
			return false;
		}
	}

	/**
	 * 同步配置
	 *
	 * @param string $setting
	 */
	public final function sync($setting) {
		$nodes = App::cfg('cluster_nodes');
		if ($nodes) {
			$curl = new RestFulClient('', '', '');
			$c    = [];
			foreach ($nodes as $node) {
				$client = new RestFulClient($node['url'], $node['appId'], $node['appSecret'], $node['ver']);
				$c[]    = $client->get('dashboard.clearSettingCache', ['group' => $setting], 10);
			}
			$curl->execute($c);
		}
	}

	/**
	 * 自定义配置页面模板.
	 *
	 * @param string $group 配置组
	 * @param array  $data  数据
	 *
	 * @return null|string
	 */
	public function customTpl($group = '', &$data = []) {
		return null;
	}

	/**
	 * 配置组.
	 * @return null|array 配置组
	 */
	public function getGroups() {
		return null;
	}

	/**
	 * 配置表单.
	 *
	 * @param string $group 字配置
	 *
	 * @return \wulaphp\form\FormTable
	 */
	public abstract function getForm($group = '');

	/**
	 * 配置项名称.
	 * @return string
	 */
	public abstract function getName();

	/**
	 * 填充.
	 *
	 * @param \wulaphp\form\FormTable $form
	 * @param string                  $setting 配置
	 * @param string                  $group   配置组
	 */
	public function load(&$form, $setting, $group = '') {
		$table = new SettingsTable();
		if ($group) {
			$setting .= '/' . $group;
		}
		$cfg = $table->findAll(['group' => $setting], 'name,value')->toArray('value', 'name');
		$form->inflateByData($cfg);
	}
}