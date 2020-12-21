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
if ($orden = $model->orden ?? null) {
    echo Html::a('Presupuesto Nº ' . $orden->codigo, url([
        '/operacion/presupuesto/view',
        'id' => $orden->id
    ]), [
        'class' => 'btn btn-sm btn-outline-primary'
    ]);
}
if ($orden = $model->ordens[0] ?? null) {
    echo Html::a('Contrato Nº ' . $orden->codigo, url([
        '/operacion/contrato/view',
        'id' => $orden->id
    ]), [
        'class' => 'btn btn-sm btn-outline-primary'
    ]);
} else {
    echo Html::a('Generar contrato', '#', [
        'type' => 'POST',
        'submit' => url([
            'next',
            'id' => $model->id
        ]),
        'before-send' => 'confirm("¿Está seguro de hacer contrato la reserva?")',
        'class' => 'mt-2 btn btn-sm btn-success'
    ]);
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