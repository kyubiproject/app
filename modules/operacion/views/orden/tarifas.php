<?php
/**
 * @var \operacion\models\base\OrdenTarifa $tarifa
 */
use kyubi\helper\Str;
use yii\helpers\Html;

$fn = 'get' . ucfirst($relation);
if ($tarifas = model()->$fn()->all()) {
    ?>
<table class="table table-sm table-stripped">
	<thead>
		<tr>
			<th>Concepto</th>
			<th colspan="2">Tarifa</th>
			<th>Cantidad</th>
			<th>Base</th>
		</tr>
	</thead>
	<tbody>
<?php

    foreach ($tarifas as $i => $tarifa) {
        if (! $item = $tarifa->tarifaHistoria) {
            continue;
        }
        if (count($tarifas) > 1) {
            echo strtr('<tr><td class="bg-light text-muted text-center py-0" colspan="5">Desde {desde} hasta {hasta} {extra}</td></tr>', [
                '{desde}' => app()->formatter->asDate($tarifa->fecha_entrega),
                '{hasta}' => app()->formatter->asDate($tarifa->fecha_recogida),
                '{extra}' => $item->tipo_tarifa != model()->tipo_tarifa ? (' - Tarifa en ' . lcfirst($item->tipo_tarifa)) : null
            ]);
        }
        foreach ($item->getAttributes([
            'eur_mes',
            'eur_dia',
            'hora',
            'eur_hora',
            'km',
            'eur_km',
            'eur_lt'
        ]) as $attribute => $value) {
            if (! is_numeric($value)) {
                continue;
            }
            $params = [
                '{concepto}' => null,
                '{tarifa}' => $value,
                '{unidad}' => $item->getAttributeLabel($attribute),
                '{cantidad}' => null,
                '{monto}' => 0
            ];
            switch ($attribute) {
                case 'eur_mes':
                    switch ($item->getOldAttribute('tipo_tarifa')) {
                        case 'MONTH':
                            $params['{concepto}'] = 'Costo alquiler por mes';
                            $params['{monto}'] = $tarifa->periodo * $value;
                            $params['{cantidad}'] = $tarifa->periodo;
                            break;
                        default:
                            $params['{concepto}'] = 'Mes adicional';
                    }
                    break;
                case 'eur_dia':
                    switch ($item->getOldAttribute('tipo_tarifa')) {
                        case 'DAY':
                            $params['{concepto}'] = 'Costo alquiler por día';
                            $params['{cantidad}'] = $tarifa->periodo;
                            $params['{monto}'] = $tarifa->periodo * $value;

                            break;
                        case 'MONTH':
                            $params['{cantidad}'] = $tarifa->fraccion;
                            $params['{monto}'] = $tarifa->fraccion * $value;
                        default:
                            $params['{concepto}'] = 'Día adicional';
                    }
                    break;
                case 'eur_hora':
                    switch ($item->getOldAttribute('tipo_tarifa')) {
                        case 'HOUR':
                            $params['{concepto}'] = 'Costo alquiler por hora';
                            $params['{cantidad}'] = $tarifa->periodo;
                            $params['{monto}'] = $tarifa->periodo * $value;
                            break;
                        case 'DAY':
                            $params['{cantidad}'] = $tarifa->fraccion;
                            $params['{monto}'] = $tarifa->fraccion * $value;
                        default:
                            $params['{concepto}'] = 'Hora adicional';
                    }
                    break;
                case 'km':
                    $params['{concepto}'] = 'Kilómetros incluidos por ' . lcfirst(model()->tipo_tarifa);
                case 'hora':
                    $params['{concepto}'] = $params['{concepto}'] ?? 'Horas de cortesía';
                    $params['{unidad}'] = ucfirst($attribute);
                    $params['{tarifa}'] = '-';
                    $params['{cantidad}'] = $value;
                    $params['{monto}'] = null;
                    break;
                case 'eur_km':
                    $params['{concepto}'] = 'Kilómetro adicional';
                case 'eur_lt':
                    $params['{concepto}'] = $params['{concepto}'] ?? 'Combustible adicional';
                    $params['{tarifa}'] = app()->formatter->asDecimal($value, 2);
                    $params['{monto}'] = null;
                    break;
            }
            if (! is_null($params['{monto}'])) {
                $params['{monto}'] = app()->formatter->asDecimal($params['{monto}'], 2);
            }
            echo strtr('<tr><td>{concepto}</td><td class="text-right">{tarifa}</td><td>{unidad}</td><td class="text-center">{cantidad}</td><td class="text-right">{monto}</td></tr>', $params);
        }
        ?>
<?php } ?>
    </tbody>
</table>
<?php } ?>