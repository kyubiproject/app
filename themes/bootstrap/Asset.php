<?php
namespace themes\bootstrap;

class Asset extends \yii\web\AssetBundle
{

    public $sourcePath = '@themes/bootstrap/assets';

    public $css = [
        'css/bootstrap.min.css',
        'css/font-awesome.min.css',
        'css/main.css'
    ];

    public $js = [
        'js/main.js',
        [
            'js/bootstrap.min.js',
            'position' => \yii\web\View::POS_END
        ]
    ];

    public $depends = [
        'yii\web\YiiAsset'
    ];

    public function init()
    {
        require_file(__DIR__ . '/helpers/helpers.php');
        return parent::init();
    }
}