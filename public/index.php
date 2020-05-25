<?php
define('DIR_ROOT', dirname(__DIR__));
require_once __DIR__ . '/../vendor/kyubi/core/autoload.php';

Kyubi::web(true, 'dev');