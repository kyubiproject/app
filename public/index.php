<?php
define('DIR_ROOT', dirname(__DIR__));

require_once DIR_ROOT . '/vendor/autoload.php';
switch ($_SERVER['SERVER_NAME']) {
    case 'localhost':
    case 'furgoline':
        Kyubi::app(get('__debug', true), get('__env', 'dev'));
        break;
    case 'furgo2.sigarus.com':
    case 'furgo.sigarus.com':
        Kyubi::app(get('__debug', true), get('__env', 'sigarus'));
        break;
    default:
        Kyubi::app(get('__debug', false), get('__env', 'live'));
}