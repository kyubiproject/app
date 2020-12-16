<?php
namespace operacion\controllers;

use kyubi\helper\Str;

/**
 * Default controller for the `operacion` module
 */
class PresupuestoController extends \app\base\Controller
{

    public $modelClass = 'operacion\models\PresupuestoModel';

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
