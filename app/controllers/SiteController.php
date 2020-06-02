<?php
namespace app\controllers;

use yii\web\Controller;
use kyubi;
use kyubi\helpers\Str;

class SiteController extends Controller
{

    public function actionIndex()
    {
        echo powered();
    }

    public function actionOffline()
    {
        echo ':(';
    }
}