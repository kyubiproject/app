<?php
return array_merge(require_once dirname(__DIR__) . '/config.php', [
    'controllerNamespace' => 'app\commands',
    'controllerMap' => [
        'config' => 'kyubi\commands\ConfigController'
    ]
]);
