<?php
namespace studio\controllers;

use kyubi\base\WebController;

/**
 * Default controller for the `studio` module
 */
class DefaultController extends WebController
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
