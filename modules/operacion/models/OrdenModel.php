<?php
namespace operacion\models;

use operacion\models\base\Orden;
use kyubi\db\Query;

class OrdenModel extends Orden
{

    public $__error;

    public function beforeValidate()
    {
        if (is_array($detalles = post('OrdenDetalles') ?? null)) {
            $result = Query::instance()->createCommand()
                ->setSql('SELECT MIN(fecha) AS fecha_entrega, MAX(fecha) AS fecha_recogida 
                    FROM operacion__orden_vehiculo
                    WHERE vehiculo_id=:t0 AND id NOT IN (:t1)
                    AND fecha BETWEEN :t2  AND :t3')
                ->bindValues([
                ':t0' => $detalles['vehiculo_id'],
                ':t1' => $this->id ?? 0,
                ':t2' => $detalles['fecha_entrega'],
                ':t3' => $detalles['fecha_recogida']
            ])
                ->queryOne();
            if (array_sum($result)) {
                $this->addError('__error', strtr('El vehículo asignado no esta disponible desde {desde} hasta {hasta}', [
                    '{desde}' => app()->formatter->asDate($detalles['fecha_entrega']),
                    '{hasta}' => app()->formatter->asDate($detalles['fecha_recogida'])
                ]));
                return false;
            }
        }
        return parent::beforeValidate();
    }

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