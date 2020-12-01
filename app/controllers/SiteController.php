<?php
namespace app\controllers;

class SiteController extends \kyubi\web\Controller
{

    public function actions(): array
    {
        return [
            'error' => [
                'class' => '\yii\web\ErrorAction',
                'view' => '@yii/views/errorHandler/error'
            ]
        ];
    }

    public function actionIndex()
    {
        return $this->render('index');
    }

    public function getHeader()
    {
        return false;
    }
}