<?php
/*
 * This file is part of wulacms.
 *
 * (c) Leo Ning <windywany@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace dashboard\api\v1;

use rest\classes\API;
use wulaphp\cache\RtCache;

/**
 * Class RtcacheApi
 * @package dashboard\api\v1
 * @name 运行缓存管理
 */
class RtcacheApi extends API {
	/**
	 * 删除key指定的缓存内容.
	 *
	 * @apiName 删除缓存
	 *
	 * @param string $key 缓存Key值
	 *
	 * @return array {
	 *  "ok":1
	 * }
	 */
	public function clear($key) {
		RtCache::delete($key);

		return ['ok' => 1];
	}
}