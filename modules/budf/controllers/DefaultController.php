<?php
namespace budf\controllers;

use kyubi\base\web\Controller;

/**
 * Default controller for the `budf` module
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
