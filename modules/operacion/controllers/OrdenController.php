<?php
namespace operacion\controllers;

use kyubi\helper\Str;

abstract class OrdenController extends \app\base\Controller
{

    /**
     *
     * {@inheritdoc}
     * @see \app\base\Controller::getTitle()
     */
    public function getTitle(array $params = [])
    {
        switch (action()->id) {
            case 'index':
                $params['{controller}'] = Str::pluralize(t($this->module->id, $this->uniqueId));
            default:
        }
        return parent::getTitle($params);
    }

}