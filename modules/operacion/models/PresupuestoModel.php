<?php
namespace operacion\models;

use operacion\models\base\Orden;

class PresupuestoModel extends OrdenModel
{

    const DEFAULT_MOMENTO = 'PRESUPUESTO';

    protected static $_config = 'operacion/config/presupuesto';

    public $momento = self::DEFAULT_MOMENTO;
}