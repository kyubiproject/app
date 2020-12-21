<?php
/**
 * @var \yii\web\View $this
 * @var \kyubi\base\ActiveRecord $model
 */
use kyubi\ui\widgets\DetailView;
use yii\helpers\Html;
?>
<div class="d-flex">
<?php
echo DetailView::widget([
    'model' => $model,
    'options' => [
        'tag' => 'section',
        'class' => ' w-100 form-row'
    ]
]);
?>
<div class="pl-3 d-flex flex-column align-items-center justify-content-between">
	<div class="btn-group-vertical text-nowrap">
<?php
if ($model->getOldAttribute('momento') != 'CONTRATO') {
    if ($orden = $model->orden ?? null) {
        if ($orden1 = $orden->orden ?? null) {
            if ($orden2 = $orden1->orden ?? null) {
                echo Html::a('Presupuesto Nº ' . $orden2->codigo, url([
                    '/operacion/presupuesto/view',
                    'id' => $orden2->id
                ]), [
                    'class' => 'btn btn-sm btn-outline-primary'
                ]);
            }
            echo Html::a('Reserva Nº ' . $orden1->codigo, url([
                '/operacion/reserva/view',
                'id' => $orden1->id
            ]), [
                'class' => 'btn btn-sm btn-outline-primary'
            ]);
        }
        echo Html::a('Contrato Nº ' . $orden->codigo, url([
            '/operacion/contrato/view',
            'id' => $orden->id
        ]), [
            'class' => 'btn btn-sm btn-outline-primary'
        ]);
    }
} else {
    if ($orden = $model->orden ?? null) {
        if ($orden2 = $orden->orden ?? null) {
            echo Html::a('Presupuesto Nº ' . $orden2->codigo, url([
                '/operacion/presupuesto/view',
                'id' => $orden2->id
            ]), [
                'class' => 'btn btn-sm btn-outline-primary'
            ]);
        }
        echo Html::a('Reserva Nº ' . $orden->codigo, url([
            '/operacion/reserva/view',
            'id' => $orden->id
        ]), [
            'class' => 'btn btn-sm btn-outline-primary'
        ]);
    }
    foreach ($model->ordens ?? [] as $orden) {
        echo Html::a('Extension Nº ' . $orden->codigo, url([
            '/operacion/contrato/view',
            'id' => $orden->id
        ]), [
            'class' => 'btn btn-sm btn-outline-secondary'
        ]);
    }
    if ($model->getOldAttribute('tipo_contrato') == 'LP') {
        echo Html::a('Extender contrato', '#', [
            'type' => 'POST',
            'submit' => url([
                'next',
                'id' => $model->id
            ]),
            'before-send' => 'confirm("¿Está seguro de extender el contrato?")',
            'class' => 'mt-2 btn btn-sm btn-success'
        ]);
    }
}
?>
		</div>
		<table class="w-100 text-muted">
			<tr>
				<th>Total:</th>
				<td class="text-right pl-2"><?= app()->formatter->asCurrency($base = $model->baseTotal ?? 0)?></td>
			</tr>
			<tr>
				<th>IVA:</th>
				<td class="text-right pl-2"><?= app()->formatter->asCurrency($base * BASE_IVA)?></td>
			</tr>
			<tr>
				<th>Total:</th>
				<td class="text-right pl-2 text-danger"><?= app()->formatter->asCurrency($base * (1 + BASE_IVA))?></td>
			</tr>
		</table>
	</div>
</div>