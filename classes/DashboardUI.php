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

use wulaphp\util\ArrayCompare;

class DashboardUI {
	private $menus = [];

	/**
	 * 获取导航菜单.
	 *
	 * @param string $id
	 * @param int    $pos
	 *
	 * @return Menu
	 */
	public function &getMenu($id, $pos = 9999) {
		$ids = explode('/', trim($id, '/'));
		$id  = array_shift($ids);

		if (isset ($this->menus [ $id ])) {
			$menu = $this->menus [ $id ];
		} else {
			$menu                = new Menu($id);
			$this->menus [ $id ] = $menu;
		}
		if ($ids) {
			foreach ($ids as $id) {
				$menu = $menu->getMenu($id);
			}
		}
		$menu->pos = $pos;

		return $menu;
	}

	public function menuData() {
		$menus = ['menus' => []];
		foreach ($this->menus as $menu) {
			$menus['menus'][] = $menu->data();
		}
		usort($menus['menus'], ArrayCompare::compare('pos'));

		return $menus;
	}
}