<?php
namespace operacion\models;

use operacion\models\base\Orden;

class PresupuestoModel extends Orden
{
    public $estado;

    public function init()
    {
        parent::init();
        $this->estado = array_shift(t('operacion/lang/models/orden-situacion', '__options')['estado']);
    }
}