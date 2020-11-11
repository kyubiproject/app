<?php
namespace app\controllers;

class SiteController extends \kyubi\web\Controller
{

    public function actions(): array
    {
        return [
            // declara la acción "error" utilizando un nombre de clase
            'error' => 'yii\web\ErrorAction'
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
}