<?php
if (YII_DEBUG) {
    $config['bootstrap'][] = 'gii';
    $config['modules']['gii'] = [
        'class' => 'yii\gii\Module'
    ];

    // $config['bootstrap'][] = 'debug';
    // $config['modules']['debug'] = [
    // 'class' => 'yii\debug\Module'
    // ];
}
return $config ?? [];