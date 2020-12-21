<?php
namespace operacion\models;

class ReservaModel extends OrdenModel
{

    const DEFAULT_MOMENTO = 'RESERVA';

    protected static $_config = 'operacion/config/reserva';

    public $momento = self::DEFAULT_MOMENTO;
}