<?php
/**
 * @var \yii\web\View $this
 * @var \kyubi\base\ActiveRecord $model
 */
use kyubi\ui\widgets\DetailView;
use yii\helpers\Html;
?>
<div class="d-flex">
	<div class="w-100">
<?php
echo DetailView::widget([
    'model' => $model,
    'options' => [
        'tag' => 'section',
        'class' => 'form-row'
    ]
]);
?>
</div>
	<div class="pl-3 d-flex align-items-center justify-content-center">
		<div class="btn-group-vertical text-nowrap">
<?php
if ($orden = $model->ordens[0] ?? null) {
    echo Html::a('Reserva Nº ' . $orden->codigo, url([
        '/operacion/reserva/view',
        'id' => $orden->id
    ]), [
        'class' => 'btn btn-sm btn-outline-primary'
    ]);
    if ($orden = $orden->ordens[0] ?? null) {
        echo Html::a('Contrato Nº ' . $orden->codigo, url([
            '/operacion/contrato/view',
            'id' => $orden->id
        ]), [
            'class' => 'btn btn-sm btn-outline-primary'
        ]);
    }
} else {
    echo Html::a('Generar reserva', '#', [
        'type' => 'POST',
        'submit' => url([
            'next',
            'id' => $model->id
        ]),
        'before-send' => 'confirm("¿Está seguro de reservar este presupuesto?")',
        'class' => 'mt-2 btn btn-sm btn-success'
    ]);
}
?>
		</div>
	</div>
</div>