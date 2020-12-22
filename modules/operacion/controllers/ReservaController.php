<?php
namespace operacion\controllers;

class ReservaController extends OrdenController
{

    public $modelClass = 'operacion\models\ReservaModel';

    /**
     *
     * {@inheritdoc}
     * @see \operacion\controllers\OrdenController::buttons()
     */
    public function buttons(array $params = [], array $buttons = null): array
    {
        $buttons = parent::buttons($params, $buttons);
        if (model() && count(model()->ordens)) {
            $crud = &$buttons['curd']['buttons'];
            unset($crud['update'], $crud['delete']);
        }
        return $buttons;
    }
}
