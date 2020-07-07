<?php
define('DIR_ROOT', dirname(__DIR__));
require_once dirname(__DIR__) . '/vendor/kyubi/core/autoload.php';



Kyubi::app(true, 'dev');