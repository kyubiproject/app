<?php
namespace app\controllers;

use yii\filters\AccessControl;
use yii\filters\VerbFilter;
use app\models\LoginForm;

class SiteController extends \kyubi\web\Controller
{

    public function behaviors()
    {
        $behaviors['access'] = [
            'class' => AccessControl::className(),
            'except' => [
                'login'
            ],
            'rules' => [
                [
                    'allow' => true,
                    'roles' => [
                        '@'
                    ]
                ]
            ]
        ];
        return $behaviors;
    }

    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionLogin()
    {
        if (! app()->user->isGuest) {
            return $this->goHome();
        }
        $this->layout = null;
        $model = new LoginForm();
        if ($model->load(request()->post()) && $model->login()) {
            return $this->goBack();
        }
        $model->password = null;
        return $this->render('login', [
            'model' => $model
        ]);
    }

    public function actionLogout()
    {
        app()->user->logout();
        app()->getSession()->open(); 
        return $this->goHome();
    }

    public function actionError()
    {
        $exception = app()->errorHandler->exception;
        if ($exception !== null) {
            return $this->render('error', [
                'code' => $exception->getCode(),
                'message' => $exception->getMessage(),
                'file' => $exception->getFile() . '(' . $exception->getLine() . ')',
                'trace' => $exception->getTraceAsString()
            ]);
        }
    }

    public function getHeader()
    {
        return false;
    }
}