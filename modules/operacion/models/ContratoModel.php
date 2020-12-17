<?php
namespace operacion\models;

use operacion\models\base\Orden;

class ContratoModel extends Orden
{

    protected static $_config = 'operacion/config/contrato';

    public $momento = 'CONTRATO';
}