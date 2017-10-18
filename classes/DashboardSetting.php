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

use dashboard\form\DashboardSettingForm;

class DashboardSetting extends Setting {
	public function getForm($group = '') {
		return new DashboardSettingForm();
	}

	public function getName() {
		return '通用设置';
	}
}