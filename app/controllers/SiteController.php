<?php
namespace app\controllers;

use yii\web\Controller;

class SiteController extends Controller
{

    public $layout = '/layouts/main';

    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionOffline()
    {
        return $this->render('offline');
    }
}