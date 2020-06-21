<?php
namespace base\controllers;

use kyubi\base\web\Controller;

/**
 * Default controller for the `base` module
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
