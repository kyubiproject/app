<?php
namespace operacion\models;

use operacion\models\base\Orden;

class ContratoModel extends Orden
{
    const DEFAULT_MOMENTO = 'CONTRATO';
    
    protected static $_config = 'operacion/config/contrato';

    public $momento = self::DEFAULT_MOMENTO;
}