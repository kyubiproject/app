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
        switch ($action = action()->id) {
            case 'index':
                $params['{controller}'] = Str::pluralize(t($this->module->id, $this->uniqueId));
                $string = '{controller}';
                break;
            case 'create':
                $string = $action. ' {controller}';
                break;
            default:
                return parent::getTitle($params);
        }
        $params['{controller}'] = $params['{controller}'] ?? t($this->module->id, $this->uniqueId);
        return t($this->module->id, $string, $params);
    }
}
