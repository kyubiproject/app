<?php
namespace operacion\models;

class ContratoModel extends OrdenModel
{

    const DEFAULT_MOMENTO = 'CONTRATO';

    protected static $_config = 'operacion/config/contrato';

    public $momento = self::DEFAULT_MOMENTO;
}