<?php
namespace app\controllers;

class SiteController extends \kyubi\web\Controller
{

    public function actionIndex()
    {
        return controller()->render('index');
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
}