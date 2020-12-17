<?php
if (! function_exists("array_key_first")) {
	function array_key_first($array) {
		return array_keys($array)[0] ?? null;
	}
}

define('DIR_ROOT', dirname(__DIR__));

require_once DIR_ROOT . '/vendor/autoload.php';
Kyubi::app(get('__debug', true), get('__env', 'dev'));
