<?php
namespace operacion\controllers;

class ContratoController extends OrdenController
{

    public $modelClass = 'operacion\models\ContratoModel';

    public function buttons(array $params = [], array $buttons = null): array
    {
        $buttons = parent::buttons($params, $buttons);
        if (model() && model()->recogida && model()->recogida->fecha) {
            $crud = &$buttons['curd']['buttons'];
            unset($crud['update'], $crud['delete']);
        }
        return $buttons;
    }
}
