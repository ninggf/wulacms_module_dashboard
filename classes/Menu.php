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

class Menu {
	public $id;
	public $name;
	public $title     = '';
	public $url       = '';
	public $target    = '';
	public $textCls   = '';
	public $textStyle = '';
	public $icon      = '';
	public $iconStyle = '';
	public $iconCls   = '';
	public $level     = 1;
	public $pos       = 9999;
	public $badge     = '';
	public $data      = [];
	public $child     = [];
	public $group     = 'ug';

	public function __construct($id, $name = '', $icon = '') {
		$this->id      = $id;
		$this->name    = $name;
		$this->iconCls = $icon;
	}

	/**
	 * 是否有子菜单.
	 *
	 * @return bool 有返回true，反之返回false.
	 */
	public function hasSubMenu() {
		return count($this->child) > 0;
	}

	/**
	 * 获取菜单项。
	 *
	 * @param string $id
	 * @param int    $pos
	 *
	 * @return Menu 菜单实例
	 */
	public function &getMenu($id, $pos = 9999) {
		if (!isset ($this->child [ $id ])) {
			$this->child[ $id ]        = new Menu($id);
			$this->child[ $id ]->level = $this->level + 1;
			$this->child[ $id ]->pos   = $pos;
		}

		return $this->child[ $id ];
	}

	/**
	 * @param bool $group 是否启用分组(在下拉菜单时有用)
	 *
	 * @return array
	 */
	public function data($group = false) {
		$data  = get_object_vars($this);
		$datas = $data['data'];
		unset($data['data']);
		foreach (array_keys($data) as $key) {
			if (empty($data[ $key ])) {
				unset($data[ $key ]);
			} else if (is_string($data[ $key ])) {
				$data[ $key ] = trim($data[ $key ]);
			}
		}
		if ($datas) {
			foreach ($datas as $key => $v) {
				$data['data'][ trim($key) ] = is_array($v) ? $v : trim($v);
			}
		}
		$data['child'] = [];
		if ($this->child) {
			foreach ($this->child as $item) {
				$data['child'][] = $item->data($group);
			}
			usort($data['child'], ArrayCompare::compare('pos'));
			if ($group) {
				$gdata = [];
				foreach ($data['child'] as $cd) {
					$gp = $cd['group'];
					unset($cd['group']);
					$gdata[ $gp ][] = $cd;
				}
				$data['child'] = [];
				foreach ($gdata as $gds) {
					$data['child']   = array_merge($data['child'], $gds);
					$data['child'][] = ['name' => 'divider'];
				}
				array_pop($data['child']);
			}
		}
		unset($data['level']);

		return $data;
	}
}