<?php
if (YII_DEBUG) {
    if (class_exists('yii\gii\Module', false)) {
        $config['bootstrap'][] = 'gii';
        $config['modules']['gii'] = [
            'class' => 'yii\gii\Module'
        ];
    }

    if (class_exists('yii\debug\Module', false)) {
        $config['bootstrap'][] = 'debug';
        $config['modules']['debug'] = [
            'class' => 'yii\debug\Module'
        ];
    }
}