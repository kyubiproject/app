<?php
namespace operacion\models;

use operacion\models\base\Orden;

class PresupuestoModel extends Orden
{

    protected static $_config = 'operacion/config/presupuesto';

    public function init()
    {
        parent::init();
        if ($this->isNewRecord) {
            $this->momento = 'PRESUPUESTO';
            $this->estado = 'EN VIGOR';
        }
    }
}