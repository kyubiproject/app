<?php
namespace client\controllers;

/**
 * Default controller for the `client` module
 */
class DefaultController extends \kyubi\web\Controller
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
