<?php
namespace operacion\models;

use operacion\models\base\Orden;

class ReservaModel extends Orden
{

    const DEFAULT_MOMENTO = 'RESERVA';

    protected static $_config = 'operacion/config/reserva';

    public $momento = self::DEFAULT_MOMENTO;
}