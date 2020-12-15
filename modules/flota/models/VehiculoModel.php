<?php
namespace flota\models;

use flota\models\base\Vehiculo;

class VehiculoModel extends Vehiculo
{

    /**
     *
     * {@inheritdoc}
     * @see \flota\models\base\Vehiculo::getHistorias()
     */
    public function getHistorias()
    {
        return parent::getHistorias()->orderBy('fecha_transaccion DESC');
    }
}