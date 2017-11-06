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

use wulaphp\form\FormTable;
use wulaphp\validator\JQueryValidator;

class MailSetting extends Setting {
	public function getForm($group = '') {
		return new MailSettingForm();
	}

	public function getName() {
		return '邮箱设置';
	}
}

class MailSettingForm extends FormTable {
	use JQueryValidator;
	public $table = null;
}