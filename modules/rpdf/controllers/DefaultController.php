<?php
namespace rpdf\controllers;

use kyubi\base\web\Controller;

/**
 * Default controller for the `rpdf` module
 */
class DefaultController extends Controller
{

    /**
     * Renders the index view for the module
     *
     * @return string
     */
    public function actionIndex()
    {
        return $this->render('index');
    }
}
