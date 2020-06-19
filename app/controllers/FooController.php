<?php
namespace app\controllers;

use yii\web\Controller;

class FooController extends Controller
{

    use \kyubi\theme\basic\ControllerTrait;

    public function actionIndex()
    {
        return $this->renderContent(__FILE__);
    }
}