<?php
namespace flota\models;

use flota\models\base\Tarifa;

class TarifaModel extends Tarifa
{

    /**
     *
     * {@inheritdoc}
     * @see \flota\models\base\Tarifa::getHistorias()
     */
    public function getHistorias()
    {
        return parent::getHistorias()->orderBy('fecha_transaccion DESC');
    }
}