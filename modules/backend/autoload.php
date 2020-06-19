<?php
require_once 'helpers/base.php';

$config['import'][] = $module . '.components.*';
$config['import'][] = $module . '.components.base.*';

$config['components']['user']['loginUrl'] = [
    'backend/login'
];

$rules["<module:$module>/<action:(login|logout|clear|toggle)>"] = '<module>/default/<action>';