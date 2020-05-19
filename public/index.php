<?php
defined('YII_DEBUG') or define('YII_DEBUG', true);
defined('YII_ENV') or define('YII_ENV', 'dev');

define('DIR_ROOT', dirname(__DIR__));
require_once __DIR__ . '/../vendor/kyubi/core/autoload.php';

Kyubi::app();