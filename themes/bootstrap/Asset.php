<?php
namespace themes\bootstrap;

class Asset extends \yii\web\AssetBundle
{

    public $sourcePath = '@themes/bootstrap/assets';

    public $css = [
        'css/bootstrap.min.css',
        'css/font-awesome.min.css',
        'css/select2.min.css',
        'css/main.css'
    ];

    public $js = [
        'js/main.js',
        [
            'js/select2.full.min.js',
            'position' => \yii\web\View::POS_END
        ],
        [
            'js/popper.min.js',
            'position' => \yii\web\View::POS_END
        ],
        [
            'js/bootstrap.min.js',
            'position' => \yii\web\View::POS_END
        ]
    ];

    public $depends = [
        'yii\web\YiiAsset'
    ];

}