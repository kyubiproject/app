<?php
define('DIR_ROOT', dirname(__DIR__));

ini_set('display_errors', 1);

require_once DIR_ROOT . '/vendor/autoload.php';

Kyubi::app(get('__debug', true), get('__env', 'dev'));
