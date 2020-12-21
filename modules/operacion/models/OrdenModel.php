<?php
namespace operacion\models;

use operacion\models\base\Orden;

class OrdenModel extends Orden
{

    public function getBaseTotal(): float
    {
        $total = 0;
        /**
         *
         * @var \operacion\models\base\OrdenTarifa $tarifa
         */
        foreach ($this->getTarifas()->all() as $tarifa) {
            $item = $tarifa->tarifaHistoria;
            switch ($item->getOldAttribute('tipo_tarifa')) {
                case 'MONTH':
                    $total += $item->eur_mes * $tarifa->periodo;
                    $total += $item->eur_dia * $tarifa->fraccion;
                    break;
                case 'HOUR':
                    $total += $item->eur_hora * $tarifa->periodo;
                    break;
                default:
                    $total += $item->eur_dia * $tarifa->periodo;
                    $total += $item->eur_hora * $tarifa->fraccion;
            }
        }
        return $total;
    }
}