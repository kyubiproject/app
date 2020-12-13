<?php
define('DIR_ROOT', dirname(__DIR__));

require_once DIR_ROOT . '/vendor/autoload.php';

Kyubi::app(get('__debug', true), get('__env', 'dev'));
