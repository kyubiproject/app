<?php
namespace operacion\models;

use operacion\models\base\Orden;

class ReservaModel extends Orden
{

    protected static $_config = 'operacion/config/reserva';

    public $momento = 'RESERVA';
}