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

    public function actionAccion()
    {
        return $this->renderContent(json_encode([
            __FUNCTION__,
            func_get_args()
        ]));
    }

    public function metodo($id)
    {
        return $this->renderContent("hola");
    }

    public static function demo($id)
    {
        echo controller()->renderContent(json_encode([
            __FUNCTION__,
            func_get_args()
        ]));
    }

    public function getHeader()
    {
        return false;
    }
}